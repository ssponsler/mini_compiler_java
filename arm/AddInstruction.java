package arm;

public class AddInstruction implements ARMInstruction {
  public final RegisterOperand target;
  public final RegisterOperand left;
  public final Operand right;

  public AddInstruction(RegisterOperand target, RegisterOperand left, Operand right) {
    this.target = target;
    this.left = left;
    this.right = right;
  }

  public String toString() {
    return String.format("add %s, %s, %s", this.target, this.left, this.right);
  }
}
