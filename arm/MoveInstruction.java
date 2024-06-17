package arm;

public class MoveInstruction implements ARMInstruction {
  private final Operand target;
  private final Operand source;

  public MoveInstruction(Operand target, Operand source) {
    this.target = target;
    this.source = source;
  }

  public String toString() {
    return String.format("mov %s, %s", this.target.toString(), this.source.toString());
  }
}
