package llvm;

public abstract class LLVMVisitor {
  /*
    LLVM Language Forms
  */
  public abstract void visit(LLVMFunction func);

  public abstract void visit(LLVMBlock block);


  /*
    Instructions
  */
  public abstract void visit(AssignmentInstruction i);

  public abstract void visit(BranchInstruction i);

  public abstract void visit(ConditionalBranchInstruction i);

  public abstract void visit(GlobalAssignmentInstruction isnt);

  public abstract void visit(InvocationInstruction i);

  public abstract void visit(PhiInstruction i);

  public abstract void visit(PrintInstruction i);

  public abstract void visit(ReadInstruction i);

  public abstract void visit(ReturnEmptyInstruction i);

  public abstract void visit(ReturnInstruction i);

  public abstract void visit(StoreInstruction i);

  public abstract void visit(GetElementPtrInstruction i);


  /*
    Operations
  */
  public abstract void visit(AllocateOperation o);

  public abstract void visit(BinaryOperation o);

  public abstract void visit(BitcastOperation o);

  public abstract void visit(ComparisonOperation o);

  public abstract void visit(GlobalOperation o);

  public abstract void visit(InvocationOperation o);

  public abstract void visit(LoadOperation o);

  public abstract void visit(PointerOperation o);

  public abstract void visit(ArrPointerOperation o);

  public abstract void visit(TruncateOperation o);

  public abstract void visit(TypeOperation o);

  public abstract void visit(XorOperation o);

  public abstract void visit(ZextOperation o);
}
