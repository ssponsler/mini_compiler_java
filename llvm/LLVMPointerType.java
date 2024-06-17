package llvm;

public class LLVMPointerType implements LLVMType {
   private final LLVMType pointeeType; 

   public LLVMPointerType(LLVMType pointeeType) {
       this.pointeeType = pointeeType;
   }

   @Override
   public String toString() {
       return pointeeType.toString() + "*";
   }

   public LLVMType getPointeeType() {
       return this.pointeeType;
   }
}
