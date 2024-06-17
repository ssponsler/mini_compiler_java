package arm;

public class MultiplyInstruction implements ARMInstruction {
  public final RegisterOperand target;
  public final RegisterOperand left;
  public final RegisterOperand right;

  public MultiplyInstruction(RegisterOperand target, RegisterOperand left, RegisterOperand right) {
    this.target = target;
    this.left = left;
    this.right = right;
  }

  public String toString() {
    return String.format("mul %s, %s, %s", this.target, this.left, this.right);
  }
}
