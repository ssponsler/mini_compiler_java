package arm;

import llvm.*;

import ast.BinaryExpression.Operator;

import java.util.Map;
import java.util.TreeMap;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

public class LLVMtoARM extends LLVMVisitor {

  private ArrayList<ARMInstruction> currentBlock;
  private ArrayList<ARMBlock> currentFunction;
  private ArrayList<ARMFunction> functions;

  private Map<String, Map<String, Operand>> phis;
  private int phiNum;

  private String currentBlockName;
  private Operand currentTarget;


  public LLVMtoARM() {
    this.currentBlock = new ArrayList<ARMInstruction>();
    this.currentFunction = new ArrayList<ARMBlock>();
    this.functions = new ArrayList<ARMFunction>();
  }


  public void visit(LLVMProgram prog) {
    for (LLVMFunction func : prog.getFuncs()) {
      this.visit(func);
    }
  }


  public void visit(LLVMFunction func) {
    this.phiNum = 0;

    this.constructPhis(func);

    this.currentBlock.add(new PushInstruction((List<RegisterOperand>)Arrays.asList(new RegisterOperand("fp"), new RegisterOperand("pc"))));
    this.currentBlock.add(new AddInstruction(new RegisterOperand("fp"), new RegisterOperand("sp"), new ImmediateOp(4)));
    for (int i = 0; i < func.getParams().size(); i++) {
      this.currentBlock.add(new MoveInstruction(this.valueToOperand(func.getParams().get(i)), new RegisterOperand("r" + Integer.toString(i))));
    }

    for (LLVMBlock block : func.getBlocks()) {
      this.visit(block);
    }
    this.functions.add(new ARMFunction(func.getName(), this.getFunction()));
  }


  private void constructPhis(LLVMFunction func) {
    int numPhi = 0;

    this.phis = new HashMap<String, Map<String, Operand>>();
    for (LLVMBlock block : func.getBlocks()) {
      for (Instruction instruction : block.getInstructions()) {
        if (instruction instanceof PhiInstruction) {
          numPhi = makePhiMap((PhiInstruction)instruction, numPhi);

        } else {
          continue;
        }
      }
    }
  }


  private int makePhiMap(PhiInstruction instruction, int numPhi) {
    for (Phi phi : instruction.getPhis()) {
      if (!this.phis.containsKey(phi.getLabel())) {
        this.phis.put(phi.getLabel(), new HashMap<String, Operand>());
      }
      this.phis.get(phi.getLabel()).put("%phi" + Integer.toString(numPhi), this.valueToOperand(phi.getValue()));
    }
    numPhi++;
    return numPhi;
  }


  private void addPhisToBlock() {
    if (this.phis.containsKey(this.currentBlockName)) {
      TreeMap<String, Operand> sorted = new TreeMap<>();
      sorted.putAll(this.phis.get(this.currentBlockName));

      for (String key : sorted.keySet()) {
        this.currentBlock.add(new MoveInstruction(new RegisterOperand(key), sorted.get(key)));
      }
    }
  }

  public void visit(LLVMBlock block) {
    this.currentBlockName = block.getLabel();
    for (Instruction instruction : block.getInstructions()) {
      instruction.accept(this);
    }
    this.currentFunction.add(new ARMBlock(block.getLabel(), this.getBlock()));
  }


  public void visit(AssignmentInstruction instruction) {
    this.currentTarget = this.valueToOperand(instruction.getTarget());
    instruction.source().accept(this);
  }


  public void visit(llvm.BranchInstruction instruction) {
    this.addPhisToBlock();
    this.currentBlock.add(new BranchInstruction(instruction.getLabel()));
  }


  public void visit(ConditionalBranchInstruction instruction) {
    this.addPhisToBlock();
    this.currentBlock.add(new CompareInstruction(this.valueToOperand(instruction.getCompValue()), new ImmediateOp(1)));
    this.currentBlock.add(new BranchConditionalInstruction(Operator.EQ, instruction.getTrueLabel()));
    this.currentBlock.add(new BranchInstruction(instruction.getFalseLabel()));
  }


  public void visit(GlobalAssignmentInstruction instruction) {
      //this.currentBlock.add(new MoveInstruction(this.valueToOperand(instruction.getTarget()), new ImmediateOp(0)));
  }

  public void visit(GetElementPtrInstruction instruction) {
      //this.currentTarget = this.valueToOperand(instruction.getTarget());
      //this.currentBlock.add(new MoveInstruction(this.currentTarget, this.valueToOperand(instruction.getSource())));
  }


  public void visit(InvocationInstruction instruction) {
    InvocationOperation opr = instruction.getInvocation();
    for (int i = 0; i < opr.getParams().size(); i++) {
      this.currentBlock.add(
        new MoveInstruction(
          new RegisterOperand("r" + String.valueOf(i)),
          this.valueToOperand(opr.getParams().get(i))
        )
      );
    }
    this.currentBlock.add(new BranchLinkInstruction(opr.getName()));
  }


  public void visit(PhiInstruction instruction) {
    this.currentBlock.add(new MoveInstruction(this.valueToOperand(instruction.getTarget()), new RegisterOperand("%phi" + String.valueOf(phiNum))));
    this.phiNum++;
  }


  public void visit(PrintInstruction instruction) {
      this.currentBlock.add(new MoveInstruction(new RegisterOperand("r0"), this.valueToOperand(instruction.getValue())));
      this.currentBlock.add(new BranchLinkInstruction("puts"));
  }


  public void visit(ReadInstruction instruction) {}


  public void visit(ReturnEmptyInstruction instruction) {
    this.currentBlock.add(new PopInstruction((List<RegisterOperand>)Arrays.asList(new RegisterOperand("fp"), new RegisterOperand("pc"))));
  }


  public void visit(ReturnInstruction instruction) {
    this.currentBlock.add(new MoveInstruction(new RegisterOperand("r0"), this.valueToOperand(instruction.getValue())));
    this.currentBlock.add(new PopInstruction((List<RegisterOperand>)Arrays.asList(new RegisterOperand("fp"), new RegisterOperand("pc"))));
  }


  public void visit(llvm.StoreInstruction instruction) {
    this.currentBlock.add(new StoreInstruction(this.valueToOperand(instruction.getSource()), this.valueToOperand(instruction.getTarget())));
  }


  public void visit(AllocateOperation opr) {}


  public void visit(BinaryOperation opr) {
    Operand left = this.valueToOperand(opr.getLeft());
    Operand right = this.valueToOperand(opr.getRight());
    if (opr.getOperator() == Operator.DIVIDE) {
      this.currentBlock.add(new MoveInstruction(new RegisterOperand("r0"), left));
      this.currentBlock.add(new MoveInstruction(new RegisterOperand("r1"), right));
      this.currentBlock.add(new BranchLinkInstruction("__aeabi_idiv"));
      this.currentBlock.add(new MoveInstruction(this.currentTarget, new RegisterOperand("r0")));
    } else {
      this.currentBlock.add(new BinaryARMInstruction(opr.getOperator(), this.currentTarget, left, right));
    }
  }


  public void visit(BitcastOperation opr) {
    this.currentBlock.add(new MoveInstruction(this.currentTarget, this.valueToOperand(opr.getSourceValue())));
  }


  public void visit(ComparisonOperation opr) {
    this.currentBlock.add(new MoveInstruction(this.currentTarget, new ImmediateOp(0)));
    this.currentBlock.add(new CompareInstruction(this.valueToOperand(opr.getLeft()), this.valueToOperand(opr.getRight())));
    this.currentBlock.add(new MoveConditionalInstruction(opr.getOperator(), this.currentTarget, new ImmediateOp(1)));
  }


  public void visit(GlobalOperation opr) {
      this.currentBlock.add(new MoveInstruction(this.currentTarget, new ImmediateOp(0)));
  }


  public void visit(InvocationOperation opr) {
    for (int i = 0; i < opr.getParams().size(); i++) {
      this.currentBlock.add(
        new MoveInstruction(
          new RegisterOperand("r" + String.valueOf(i)),
          this.valueToOperand(opr.getParams().get(i))
        )
      );
    }
    this.currentBlock.add(new BranchLinkInstruction(opr.getName()));
    this.currentBlock.add(new MoveInstruction(this.currentTarget, new RegisterOperand("r0")));
  }


  public void visit(LoadOperation opr) {
    this.currentBlock.add(new LoadInstruction(this.currentTarget, this.valueToOperand(opr.getSource())));
  }


  public void visit(PointerOperation opr) {
      this.currentBlock.add(new MoveInstruction(this.currentTarget, this.valueToOperand(opr.getValue())));
  }

  public void visit(ArrPointerOperation opr) {
      this.currentBlock.add(new MoveInstruction(this.currentTarget, this.valueToOperand(opr.getIndex())));
  }


  public void visit(TruncateOperation opr) {
      this.currentBlock.add(new MoveInstruction(this.currentTarget, this.valueToOperand(opr.getValue())));
  }


  public void visit(TypeOperation opr) {}


  public void visit(XorOperation opr) {
      Operand left = this.valueToOperand(opr.getLeft());
      Operand right = this.valueToOperand(opr.getRight());
      this.currentBlock.add(new BinaryARMInstruction(Operator.XOR, this.currentTarget, left, right));
  }


  public void visit(ZextOperation opr) {
      this.currentBlock.add(new MoveInstruction(this.currentTarget, this.valueToOperand(opr.getValue())));
  }


  public ArrayList<ARMFunction> getFunctions() {
    return this.functions;
  }


  private Operand valueToOperand(Value v) {
    if (v instanceof IntValue) {
      return new ImmediateOp(v.getValue());
    } else {
      return new RegisterOperand(v.toString());
    }
  }


  private ArrayList<ARMBlock> getFunction() {
    ArrayList<ARMBlock> blocks = (ArrayList<ARMBlock>)this.currentFunction.clone();
    this.currentFunction.clear();
    return blocks;
  }


  private ArrayList<ARMInstruction> getBlock() {
    ArrayList<ARMInstruction> instrs = (ArrayList<ARMInstruction>)this.currentBlock.clone();
    this.currentBlock.clear();
    return instrs;
  }
}
