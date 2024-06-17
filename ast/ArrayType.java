package ast;

public class ArrayType implements Type {
    private final int size;

    public ArrayType(int size) {
        this.size = size;
    }

    public int getSize() {
        return this.size;
    }

    @Override
    public String toString() {
        return String.format("int_array[%d]", this.size);
    }
}
