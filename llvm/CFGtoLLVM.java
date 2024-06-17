package llvm;

import ast.*;
import ast.BinaryExpression.Operator;
import ast.UnaryExpression.UnaryOperator;
import cfg.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import semantic.Visitor;

public class CFGtoLLVM extends Visitor {
    private int currentReg;
    private String prevBlock;
    private ArrayList<Instruction> currentBlock;
    private ArrayList<LLVMBlock> currentFunction;
    private ArrayList<LLVMFunction> functions;
    private ArrayList<Value> allocatedPointers;
    private Value currentValue;
    private LLVMType returnType;
    private LLVMProgram program;
    private List<String> locals;
    private Map<String, FunctionAssembler> funcDict;
    private Map<String, Value> symbolDict;
    private Map<String, LLVMStruct> typeDict;
    private Map<String, Integer> visited;
    private Map<String, LLVMType> localDict;
    private Map<String, Boolean> phiUsed;
    private Map<String, Boolean> argsHash;
    private Map<String, String> newRef;

    private final String RETURN = "_retval_";

    private static boolean useStackAllocation = false;

    public static void setUseStackAllocation(boolean useStackAllocation) {
        CFGtoLLVM.useStackAllocation = useStackAllocation;
    }

    public CFGtoLLVM() {
        this.prevBlock = "";
        this.currentReg = 0;
        this.currentBlock = new ArrayList<>();
        this.currentFunction = new ArrayList<>();
        this.functions = new ArrayList<>();
        this.locals = new ArrayList<>();
        this.funcDict = new HashMap<>();
        this.symbolDict = new HashMap<>();
        this.typeDict = new HashMap<>();
        this.visited = new HashMap<>();
        this.localDict = new HashMap<>();
        this.phiUsed = new HashMap<>();
        this.argsHash = new HashMap<>();
        this.newRef = new HashMap<>();
        this.allocatedPointers = new ArrayList<>();
    }

    public CFGtoLLVM(Map<String, Boolean> argsHash) {
        this();
        this.argsHash = argsHash;
        if (this.argsHash.containsKey("-stack")) {
            this.useStackAllocation = true;
        }
    }

    public CFGtoLLVM(int reg, ArrayList<Instruction> block, ArrayList<LLVMBlock> function, Value value, Map<String, LLVMStruct> typeDict) {
        this();
        this.currentReg = reg;
        this.currentBlock = block;
        this.currentFunction = function;
        this.currentValue = value;
        this.typeDict = typeDict;
    }

    public void visit(Program obj) {
        for (TypeDeclaration type : obj.getTypes()) {
            type.accept(this);
        }
        List<Instruction> types = this.getBlock();

        for (Declaration decl : obj.getDeclarations()) {
            LLVMType type = this.toLLVMType(decl.getType());
            this.currentBlock.add(new GlobalAssignmentInstruction("@" + decl.getName(), new GlobalOperation(type)));
            this.symbolDict.put(decl.getName(), new GlobalValue(decl.getName(), type));
        }
        //scanf global
        this.symbolDict.put("read_scratch", new GlobalValue(".read_scratch", new LLVMI64()));
        List<Instruction> globals = this.getBlock();

        for (FunctionWrapper functionwrapper : obj.getCFGFunctions()) {
            this.visit(functionwrapper);
        }

        this.program = new LLVMProgram(types, globals, this.functions);
    }

    public void visit(TypeDeclaration obj) {
        List<StructAssembler> fields = new ArrayList<>();
        for (Declaration decl : obj.getFields()) {
            fields.add(new StructAssembler(decl.getName(), this.toLLVMType(decl.getType())));
        }

        LLVMStruct struct = new LLVMStruct(obj.getName(), fields);
        this.typeDict.put(obj.getName(), struct);

        this.currentBlock.add(new GlobalAssignmentInstruction(
            struct.toString().substring(0, struct.toString().length() - 1),
            new TypeOperation(fields)
        ));
    }

    public void visit(Declaration obj) {}

    public void visit(Function obj) {}

    public void visit(FunctionWrapper functionwrapper) {
        HashMap<String, Value> symbolCopy = new HashMap<>(this.symbolDict);
        List<Value> params = new ArrayList<>();
        List<LLVMType> paramTypes = new ArrayList<>();

        for (Declaration decl : functionwrapper.getParams()) {
            LLVMType type = this.toLLVMType(decl.getType());
            Value param = new TempValue(decl.getName(), type);
            params.add(param);
            paramTypes.add(type);
            this.symbolDict.put(decl.getName(), param);
            this.localDict.put(decl.getName(), type);
            this.locals.add(decl.getName());
        }

        for (Declaration decl : functionwrapper.getLocals()) {
            LLVMType type = this.toLLVMType(decl.getType());
            Value localVar;
            if (useStackAllocation) {
               localVar = newRegister(new LLVMPointerType(type));
               this.currentBlock.add(new AssignmentInstruction(localVar, new AllocateOperation(type)));
            } else {
               localVar = this.defaultValue(type);
            }
            this.symbolDict.put(decl.getName(), localVar);
            this.localDict.put(decl.getName(), type);
            this.locals.add(decl.getName());
         }

        this.funcDict.put(functionwrapper.getName(), new FunctionAssembler(functionwrapper.getName(), this.toLLVMType(functionwrapper.getRetType()), paramTypes));
        this.returnType = this.toLLVMType(functionwrapper.getRetType());
        this.visit(functionwrapper.getBody());
        this.addFreeCalls();

        this.visited.clear();
        this.locals.clear();

        if (this.argsHash.containsKey("-c")) {
            this.visited.clear();
            this.compactCFG(functionwrapper.getBody().next(), false);
        }

        this.visited.clear();
        this.toLLVMFunction(functionwrapper.getBody());

        ArrayList<LLVMBlock> blocks = (ArrayList<LLVMBlock>) this.currentFunction.clone();
        this.currentFunction.clear();
        this.functions.add(new LLVMFunction(functionwrapper.getName(), this.toLLVMType(functionwrapper.getRetType()), params, blocks));

        if (this.argsHash.containsKey("-u")) {
            this.visited.clear();
            //System.out.println("Useless Code Elimination.");
            this.eliminateUselessCode(this.functions.get(this.functions.size() - 1));
        }

        if (this.argsHash.containsKey("-c")) {
            this.visited.clear();
            //System.out.println("CFG Compaction.");
            this.cleanGraph(this.functions.get(this.functions.size() - 1));
        }

        this.symbolDict = symbolCopy;
        this.localDict.clear();
    }

    public void eliminateUselessCode(LLVMFunction func) {
        Map<String, Boolean> used = new HashMap<>();
        do {
            //System.out.println("Removing dead code." + used.values());
            used.clear();
            func.markUsed(used);
            if (used.containsValue(false)) {
                func.clearUnused(used);
            }
        } while (used.containsValue(false));
    }

    public void cleanGraph(LLVMFunction func) {
        ListIterator<LLVMBlock> itr = func.getBlocks().listIterator();
        while (itr.hasNext()) {
            LLVMBlock block = itr.next();
            if (this.newRef.containsKey(block.getLabel())) {
                itr.remove();
            }
        }
        func.correctPhis(this.newRef);
    }

    public BasicBlock mergeBlocks(BasicBlock front, BasicBlock back) {
        this.newRef.put(back.getLabel(), front.getLabel());
        BasicBlock newBlock;
        if (back instanceof LineBlock) {
            LineBlock cast = (LineBlock) back;
            newBlock = new LineBlock(front.getLabel());

            if (cast.next() != null) {
                newBlock.addBlock(cast.next());
                cast.next().removePredecessor(cast);
                cast.next().addPredecessor(newBlock);
            }

        } else if (back instanceof ConditionalBlock) {
            ConditionalBlock cast = (ConditionalBlock) back;
            newBlock = new ConditionalBlock(cast.getGuard(), front.getLabel());

            if (cast.getThen() != null) {
                newBlock.addThen(cast.getThen());
                cast.getThen().removePredecessor(cast);
                cast.getThen().addPredecessor(newBlock);
            }

            if (cast.getElse() != null) {
                newBlock.addElse(cast.getElse());
                cast.getElse().removePredecessor(cast);
                cast.getElse().addPredecessor(newBlock);
            }

        } else if (back instanceof ReturnBlock) {
            newBlock = new ReturnBlock(front.getLabel(), ((ReturnBlock) back).getExpression());

        } else {
            newBlock = new EmptyBlock(front.getLabel());

        }

        front.getInstructions().remove(front.getInstructions().size() - 1);
        front.getInstructions().addAll(back.getInstructions());
        newBlock.setInstructions(front.getInstructions());

        if (front.getPredecessors().size() == 1) {
            BasicBlock frontPred = front.getPredecessors().get(0);
            newBlock.addPredecessor(frontPred);

            if (frontPred instanceof LineBlock) {
                frontPred.addBlock(newBlock);

            } else if (frontPred instanceof ConditionalBlock) {
                if (frontPred.getThen().getLabel().equals(front.getLabel())) {
                    frontPred.addThen(newBlock);
                } else {
                    frontPred.addElse(newBlock);
                }
            }
        }

        return newBlock;
    }

    public void compactCFG(BasicBlock block, Boolean canRevisit) {
        if (!canRevisit && this.visited.containsKey(block.getLabel())) {
            return;
        }
        this.visited.put(block.getLabel(), 0);

        if ((block instanceof LineBlock) && (block.next() != null)) {
            if (block.next().getPredecessors().size() <= 1) {
                BasicBlock newBlock = mergeBlocks(block, block.next());
                this.compactCFG(newBlock, true);
            } else {
                this.compactCFG(block.next(), false);
            }
        } else {
            if ((block instanceof LineBlock) && (block.next() != null)) {
                this.compactCFG(block.next(), false);
            } else if (block instanceof ConditionalBlock) {
                if (block.getThen() != null) {
                    this.compactCFG(block.getThen(), false);
                }
                if (block.getElse() != null) {
                    this.compactCFG(block.getElse(), false);
                }
            }
        }
    }

    public void addFreeCalls() {
        for (Value ptr : this.allocatedPointers) {
            this.currentBlock.add(new InvocationInstruction(
                new InvocationOperation(
                    "free",
                    new LLVMVoid(),
                    Arrays.asList(ptr),
                    Arrays.asList(new LLVMI8())
                )
            ));
        }
    }

    public Map<String, Boolean> createUnusedSet(Map<String, Boolean> used) {
        Map<String, Boolean> unUsed = new HashMap<>();
        for (String str : used.keySet()) {
            if (!used.get(str)) {
                unUsed.put(str, false);
            }
        }
        return unUsed;
    }

    public void toLLVMFunction(BasicBlock block) {
        if (this.visited.containsKey(block.getLabel())) {
            return;
        }

        this.removeUnusedPhis(block.getInstructions());
        this.visited.put(block.getLabel(), 0);
        LLVMBlock llvmBlock = new LLVMBlock(block.getLabel(), block.getInstructions());
        this.currentFunction.add(llvmBlock);

        if ((block instanceof LineBlock) && (block.next() != null)) {
            this.toLLVMFunction(block.next());
        } else if (block instanceof ConditionalBlock) {
            if (block.getThen() != null) {
                this.toLLVMFunction(block.getThen());
            }
            if (block.getElse() != null) {
                this.toLLVMFunction(block.getElse());
            }
        }
    }

    public void visit(BasicBlock block) {
        if (block instanceof LineBlock) {
            this.visit((LineBlock) block);
        } else if (block instanceof ConditionalBlock) {
            this.visit((ConditionalBlock) block);
        } else if (block instanceof ReturnBlock) {
            this.visit((ReturnBlock) block);
        } else if (block instanceof EmptyBlock) {
            this.visit((EmptyBlock) block);
        }
    }

    public void visit(LineBlock block) {
        if (!this.visited.containsKey(block.getLabel())) {
            this.visited.put(block.getLabel(), 0);

            if (block.getPredecessors().size() > 1) {
                for (String s : this.locals) {
                    Value last = this.getSymbol(s);
                    Value reg = newRegister(this.localDict.get(s));
                    Phi first = new Phi(this.prevBlock, last);
                    ArrayList<Phi> phis = new ArrayList<>();
                    phis.add(first);
                    this.currentBlock.add(new PhiInstruction(reg, this.localDict.get(s), phis));
                    this.phiUsed.put(reg.toString(), false);
                    this.symbolDict.put(s, reg);
                }
            } else {
                block.seal();
            }

            if (block.getBlock() != null) {
                block.getBlock().accept(this);
            }
            block.setInstructions(this.getBlock());

            if (block.next() != null) {
                block.addInstruction(new BranchInstruction(block.next().getLabel()));
                this.prevBlock = block.getLabel();
                this.visit(block.next());
            }

        } else if (block.getIsSealed()) {
            return;
        } else {
            for (int i = 0; i < this.locals.size(); i++) {
                Phi last = new Phi(this.prevBlock, this.getSymbol(this.locals.get(i)));
                ((PhiInstruction) block.getInstructions().get(i)).addPhi(last);
            }

            if (block.predecessorsSealed()) {
                block.seal();
            }
        }
    }

    public void visit(ConditionalBlock block) {
        if (!this.visited.containsKey(block.getLabel())) {
            this.visited.put(block.getLabel(), 0);

            if (block.getPredecessors().size() > 1) {
                for (String s : this.locals) {
                    Value last = this.getSymbol(s);
                    Value reg = newRegister(this.localDict.get(s));
                    Phi first = new Phi(this.prevBlock, last);
                    ArrayList<Phi> phis = new ArrayList<>();
                    phis.add(first);
                    this.currentBlock.add(new PhiInstruction(reg, this.localDict.get(s), phis));
                    this.phiUsed.put(reg.toString(), false);
                    this.symbolDict.put(s, reg);
                }
            } else {
                block.seal();
            }

            if (block.getBlock() != null) {
                block.getBlock().accept(this);
            }
            block.getGuard().accept(this);

            if ((block.getThen() != null) && (block.getElse() != null)) {
                Value temp = newRegister(new LLVMI64());
                this.currentBlock.add(new AssignmentInstruction(temp, new TruncateOperation(this.currentValue)));
                this.currentBlock.add(new ConditionalBranchInstruction(temp, block.getThen().getLabel(), block.getElse().getLabel()));
            }
            block.setInstructions(this.getBlock());

            HashMap<String, Value> symbolCopy = new HashMap<>(this.symbolDict);

            this.prevBlock = block.getLabel();
            if (block.getThen() != null) {
                this.visit(block.getThen());
            }

            this.symbolDict = symbolCopy;
            this.prevBlock = block.getLabel();
            if (block.getElse() != null) {
                this.visit(block.getElse());
            }

        } else if (block.getIsSealed()) {
            return;
        } else {
            for (int i = 0; i < this.locals.size(); i++) {
                Phi last = new Phi(this.prevBlock, this.getSymbol(this.locals.get(i)));
                ((PhiInstruction) block.getInstructions().get(i)).addPhi(last);
            }

            if (block.predecessorsSealed()) {
                block.seal();
            }
        }
    }

    public void visit(LoopBlock block) {
        if (block.getBlock() != null) {
            block.getBlock().accept(this);
        }
    }

    public void visit(ReturnBlock block) {
        if (this.visited.containsKey(block.getLabel())) {
            return;
        }
        this.visited.put(block.getLabel(), 0);

        if (block.getExpression() != null) {
            block.getExpression().accept(this);
        }

        this.currentBlock.add(new ReturnInstruction(this.returnType, this.currentValue));
        block.setInstructions(this.getBlock());
    }

    public void visit(EmptyBlock block) {
        if (this.visited.containsKey(block.getLabel())) {
            return;
        }
        this.visited.put(block.getLabel(), 0);

        this.currentBlock.add(new ReturnEmptyInstruction());
        block.setInstructions(this.getBlock());
    }

    public void visit(BinaryExpression exp) {
      exp.getLeft().accept(this);
      Value left = this.currentValue;
      exp.getRight().accept(this);
      Value right = this.currentValue;
  
      Value reg = newRegister(new LLVMI64());
      Operator op = exp.getOperator();
  
      if (op == Operator.PLUS || op == Operator.MINUS || op == Operator.DIVIDE || 
          op == Operator.TIMES || op == Operator.AND || op == Operator.OR) {
          this.currentBlock.add(new AssignmentInstruction(reg, new BinaryOperation(op, left, right)));
      } else if (op == Operator.LT || op == Operator.GT || op == Operator.LE || 
                 op == Operator.GE || op == Operator.EQ || op == Operator.NE) {
          Value temp = newRegister(new LLVMI64());
          this.currentBlock.add(new AssignmentInstruction(reg, new ComparisonOperation(op, left, right)));
          this.currentBlock.add(new AssignmentInstruction(temp, new ZextOperation(reg)));
          reg = temp;
      } else {
          this.currentBlock.add(new AssignmentInstruction(reg, new BinaryOperation(op, left, right)));
      }
  
      this.currentValue = reg;
    }

    public void visit(DotExpression exp) {
      exp.getLeft().accept(this);
  
      if (this.currentValue instanceof NullValue) {
          String label = this.newLabel();
          this.currentBlock.add(new ReturnEmptyInstruction());
          this.currentFunction.add(new LLVMBlock(label, this.getBlock()));
          return;
      }
  
      Value left = this.currentValue;
      LLVMStruct struct = this.typeDict.get(((LLVMStruct) left.getType()).getName());
  
      int fieldNum = struct.getFieldNum(exp.getId());
      StructAssembler field = struct.getFields().get(fieldNum);
  
      Value pointer = newRegister(field.getType());
      this.currentBlock.add(new AssignmentInstruction(
          pointer,
          new PointerOperation(struct, left, fieldNum)
      ));
  
      if (pointer.getType() instanceof LLVMI64 || pointer.getType() instanceof LLVMStruct) {
          Value nextLoad = newRegister(pointer.getType());
          this.currentBlock.add(new AssignmentInstruction(
              nextLoad,
              new LoadOperation(pointer.getType(), pointer)
          ));
          pointer = nextLoad;
      }
  
      this.currentValue = pointer;
   }
  

    public void visit(FalseExpression exp) {
        Value val = newRegister(new LLVMI64());
        this.currentBlock.add(new AssignmentInstruction(
            val,
            new BinaryOperation(Operator.PLUS, new IntValue(0), new IntValue(0))
        ));
        this.currentValue = val;
    }

    public void visit(IdentifierExpression exp) {
        Value symbol = this.getSymbol(exp.getId());

        if (this.isGlobal(exp.getId())) {
            Value reg = newRegister(symbol.getType());
            this.currentBlock.add(new AssignmentInstruction(reg,
                new LoadOperation(symbol.getType(), symbol)
            ));
            symbol = reg;
        }

        this.currentValue = symbol;
    }

    public void visit(IntegerExpression exp) {
        this.currentValue = new IntValue(Integer.parseInt(exp.toString("")));
    }

    public void visit(NewArrayExpression exp) {
      //
    }

    public void visit(InvocationExpression exp) {
        List<Value> params = new ArrayList<>();

        FunctionAssembler FunctionAssembler = this.funcDict.get(exp.getName());
        for (int i = 0; i < exp.getArguments().size(); i++) {
            Expression e = exp.getArguments().get(i);
            e.accept(this);
            params.add(this.currentValue);
        }

        Value reg = newRegister(FunctionAssembler.getRetType());
        this.currentBlock.add(new AssignmentInstruction(
            reg,
            new InvocationOperation(exp.getName(), reg.getType(), params, FunctionAssembler.getParamTypes())
        ));
        this.currentValue = reg;
    }

    public void visit(NewExpression exp) {
        Value malloc = newRegister(new LLVMI8());

        this.currentBlock.add(new AssignmentInstruction(
            malloc,
            new InvocationOperation(
                "malloc",
                new LLVMI8(),
                Arrays.asList(new IntValue(this.typeDict.get(exp.getId()).getFields().size() * 8)),
                Arrays.asList(new LLVMI64())
            )
        ));

        //this.allocatedPointers.add(malloc);

        Value bitcast = newRegister(this.typeDict.get(exp.getId()));
        this.currentBlock.add(new AssignmentInstruction(
            bitcast,
            new BitcastOperation(new LLVMI8(), malloc, bitcast.getType()))
        );

        this.currentValue = bitcast;
    }

    public void visit(NullExpression exp) {
        this.currentValue = new NullValue();
    }

    public void visit(ReadExpression exp) {
        this.currentBlock.add(new ReadInstruction());
    }

    public void visit(TrueExpression exp) {
        Value val = newRegister(new LLVMI64());
        this.currentBlock.add(new AssignmentInstruction(
            val,
            new BinaryOperation(Operator.PLUS, new IntValue(0), new IntValue(1))
        ));
        this.currentValue = val;
    }

    public void visit(UnaryExpression exp) {
        exp.getOperand().accept(this);
        Value val = this.newRegister(new LLVMI64());

        if (exp.getOperator() == UnaryOperator.MINUS) {
            this.currentBlock.add(new AssignmentInstruction(val, new BinaryOperation(Operator.MINUS, new IntValue(0), this.currentValue)));
        } else {
            this.currentBlock.add(new AssignmentInstruction(val, new XorOperation(new IntValue(1), this.currentValue)));
        }

        this.currentValue = val;
    }

    public void visit(IndexExpression exp) {
      exp.getLeft().accept(this);
      Value arrValue = this.currentValue;
  
      exp.getIdx().accept(this);
      Value idxValue = this.currentValue;
  
      //ERROR HERE
      LLVMArrayType arrType = (LLVMArrayType) arrValue.getType();
      LLVMType elementType = new LLVMI64();
  
      LLVMType elementPointerType = new LLVMPointerType(elementType);
  
      Value elementAddress = this.newRegister(elementPointerType);
      this.currentBlock.add(new GetElementPtrInstruction(elementAddress, arrType, arrValue, idxValue));
  
      Value resultRegister = this.newRegister(elementType);
      this.currentBlock.add(new AssignmentInstruction(resultRegister, new LoadOperation(elementType, elementAddress)));
  
      this.currentValue = resultRegister;
  }

    public void visit(AssignmentStatement st) {
        st.getSource().accept(this);
        Value source = this.currentValue;
        st.getTarget().accept(this);
        Value target = this.currentValue;

        if (st.getSource() instanceof ReadExpression) {
            Value val = newRegister(new LLVMI64());
            this.currentBlock.add(new AssignmentInstruction(val, new LoadOperation(val.getType(), this.symbolDict.get("read_scratch"))));
            if ((st.getTarget() instanceof LvalueDot) || this.isGlobal(st.getTarget().getId())) {
                this.currentBlock.add(new StoreInstruction(val, target, new LLVMI64()));
            } else {
                this.symbolDict.put(st.getTarget().getId(), val);
            }
            return;
        } else if ((st.getTarget() instanceof LvalueDot) || (this.isGlobal(st.getTarget().getId()))) {
            this.currentBlock.add(new StoreInstruction(source, target, target.getType()));
        }

        if (!(st.getTarget() instanceof LvalueDot) && (!this.isGlobal(st.getTarget().getId()))) {
            this.symbolDict.put(st.getTarget().getId(), source);
        }
    }

    public void visit(BlockStatement st) {
        for (Statement s : st.getStatements()) {
            s.accept(this);
        }
    }

    public void visit(ConditionalStatement st) {}

    public void visit(DeleteStatement st) {
        st.getExpression().accept(this);
        Value exp = this.currentValue;

        Value bitcast = newRegister(new LLVMI8());
        this.currentBlock.add(new AssignmentInstruction(
            bitcast,
            new BitcastOperation(exp.getType(), exp,bitcast.getType())
        ));

        this.currentBlock.add(new InvocationInstruction(
            new InvocationOperation(
                "free",
                new LLVMVoid(),
                Arrays.asList(bitcast),
                Arrays.asList(new LLVMI8())
            )
        ));
    }

    public void visit(InvocationStatement st) {
        InvocationExpression exp = ((InvocationExpression) st.getExpression());
        List<Value> params = new ArrayList<>();

        FunctionAssembler fa = this.funcDict.get(exp.getName());
        Expression e;
        for (int i = 0; i < exp.getArguments().size(); i++) {
            e = exp.getArguments().get(i);
            e.accept(this);
            params.add(this.currentValue);
        }

        this.currentBlock.add(new InvocationInstruction(
            new InvocationOperation(exp.getName(), fa.getRetType(), params, fa.getParamTypes())
        ));
    }

    public void visit(PrintStatement st) {
        st.getExpression().accept(this);
        Value value = this.currentValue;
        this.currentBlock.add(new PrintInstruction(value, false));
    }

    public void visit(PrintLnStatement st) {
        st.getExpression().accept(this);
        Value value = this.currentValue;
        this.currentBlock.add(new PrintInstruction(value, true));
    }

    public void visit(ReturnStatement st) {
        st.getExpression().accept(this);
        this.currentBlock.add(new ReturnInstruction(this.currentValue.getType(), this.currentValue));
    }

    public void visit(ReturnEmptyStatement st) {
        this.currentBlock.add(new ReturnEmptyInstruction());
    }

    public void visit(WhileStatement st) {}

    public void visit(LvalueId obj) {
        this.currentValue = this.getSymbol(obj.getId());
    }

    public void visit(LvalueDot exp) {
        exp.getLeft().accept(this);

        Value left = this.currentValue;
        LLVMStruct struct = this.typeDict.get(((LLVMStruct) left.getType()).getName());

        int fieldNum = struct.getFieldNum(exp.getId());
        StructAssembler field = struct.getFields().get(fieldNum);

        Value pointer = newRegister(field.getType());
        this.currentBlock.add(new AssignmentInstruction(
            pointer,
            new PointerOperation(struct, left, fieldNum)
        ));

        this.currentValue = pointer;
    }

    public void visit(LvalueIndex idx) {
      idx.getLeft().accept(this);
      Value arrValue = this.currentValue;
  
      idx.getIdx().accept(this);
      Value idxValue = this.currentValue;
  
      LLVMArrayType arrayType = (LLVMArrayType) arrValue.getType();
      LLVMType elementType = new LLVMI64();
  
      LLVMType elementPointerType = new LLVMPointerType(elementType);
  
      Value elementAddress = this.newRegister(elementPointerType);
      this.currentBlock.add(new GetElementPtrInstruction(elementAddress, arrayType, arrValue, idxValue));
  
      Value resultRegister = this.newRegister(elementType);
      this.currentBlock.add(new AssignmentInstruction(resultRegister, new LoadOperation(elementType, elementAddress)));
  
      this.currentValue = resultRegister;
  }

    public LLVMProgram getProgram() {
        return this.program;
    }

    private LLVMType toLLVMType(Type t) {
        if ((t instanceof BoolType) || (t instanceof IntType)) {
            return new LLVMI64();
        } 
        else if (t instanceof StructType) {
            return new LLVMStruct(((StructType) t).getName(), null);
        }
        else if (t instanceof ArrayType) {
            //return new LLVMArrayType(this.toLLVMType(((ArrayType) t).getType()), ((ArrayType) t).getSize());    
        }
        return new LLVMVoid();
    }

    private Value getSymbol(String s) {
        Value val = this.symbolDict.get(s);
        if (this.phiUsed.containsKey(val.toString())) {
            this.phiUsed.put(val.toString(), true);
        }
        return val;
    }

    private Boolean isGlobal(String s) {
      for (int i = 0; i < this.locals.size(); i++) {
          if (this.locals.get(i).equals(s)) {
              return false;
          }
      }
      return true;
    }

    public void removeUnusedPhis(List<Instruction> instrs) {
        ListIterator<Instruction> itr = instrs.listIterator();
        while (itr.hasNext()) {
            Instruction inst = itr.next();
            if (inst instanceof PhiInstruction) {
                if (!this.phiUsed.get(((PhiInstruction) inst).getTarget().toString())) {
                    itr.remove();
                }
            }
        }
    }

    private Value defaultValue(LLVMType t) {
        if (t instanceof LLVMI64) {
            return new IntValue(0);
        } else {
            return new NullValue();
        }
    }

    private List<Instruction> getBlock() {
        ArrayList<Instruction> instrs = (ArrayList<Instruction>) this.currentBlock.clone();
        this.currentBlock.clear();
        return instrs;
    }

    private Value newRegister(LLVMType type) {
      this.currentReg++;
      if (useStackAllocation) {
          Value alloca = new RegisterValue(this.currentReg - 1, new LLVMPointerType(type));
          this.currentBlock.add(new AssignmentInstruction(alloca, new AllocateOperation(type)));
          return alloca;
      } else {
          return new RegisterValue(this.currentReg - 1, type);
      }
  }

    private String newLabel() {
        return "L" + this.currentReg++;
    }
}