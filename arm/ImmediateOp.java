package arm;

public class ImmediateOp implements Operand {
  private final int value;

  public ImmediateOp(int value) {
    this.value = value;
  }

  public String toString() {
    return String.format("#%d", this.value);
  }

  public int getValue() {
    return this.value;
  }
}
