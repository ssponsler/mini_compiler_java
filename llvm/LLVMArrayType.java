package llvm;

public class LLVMArrayType implements LLVMType {
    private final int size;

    public LLVMArrayType(int size) {
        this.size = size;
    }

    public int getSize() {
        return this.size;
    }

    @Override
    public String toString() {
        return String.format("[%d x %s]", "i64");
    }
}
