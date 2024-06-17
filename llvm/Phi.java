package llvm;

public class Phi {
  private String blockLabel;
  private Value value;

  public Phi(String blockLabel, Value value) {
    this.blockLabel = blockLabel;
    this.value = value;
  }

  public String toString() {
    return String.format("[%s, %%%s]", this.value.toString(), this.blockLabel);
  }

  public String getLabel() {
    return this.blockLabel;
  }

  public Value getValue() {
    return this.value;
  }

  public void setValue(Value val) {
    this.value = val;
  }

  public void setLabel(String blockLabel) {
    this.blockLabel = blockLabel;
  }
}
