package arm;

public class CompareInstruction implements ARMInstruction {
  private final Operand left;
  private final Operand right;

  public CompareInstruction(Operand left, Operand right) {
    this.left = left;
    this.right = right;
  }

  public String toString() {
    return String.format("cmp %s, %s", this.left.toString(), this.right.toString());
  }
}
