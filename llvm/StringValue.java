package llvm;

public class StringValue implements Value {
    private final String value;
    private final LLVMType type = new LLVMStringType();

    public StringValue(String value) {
        this.value = value;
    }

    public String toString() {
        return "\"" + value + "\"";
    }

    public LLVMType getType() {
        return new LLVMStringType();
    }

    public int getValue() {
      return 0;
    }

    public String toTypeString() {
      return this.type.toString() + " " + this.toString();
    }

}
