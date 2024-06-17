package llvm;

public class LLVMI64 implements LLVMType {
  public String toString() {
    return "i64";
  }
  public LLVMType getPointerType() {
    return new LLVMPointerType(this);
  }
}
