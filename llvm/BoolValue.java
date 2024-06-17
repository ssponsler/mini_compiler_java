package llvm;

public class BoolValue implements Value {
  private final boolean value;
  private final LLVMType type;

  public BoolValue(boolean value) {
    this.value = value;
    this.type = new LLVMI64();
  }

  public String toString() {
    return Boolean.toString(this.value);
  }

  public String toTypeString() {
    return type.toString() + " " + this.toString();
  }

  public LLVMType getType() {
    return this.type;
  }

  public int getValue() {
    return this.value ? 1 : 0;
  }
}
