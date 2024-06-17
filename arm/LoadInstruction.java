package arm;

public class LoadInstruction implements ARMInstruction {
  private final Operand target;
  private final Operand source;

  public LoadInstruction(Operand target, Operand source) {
    this.target = target;
    this.source = source;
  }

  public String toString() {
    return String.format("ldr %s, [%s]", this.target.toString(), this.source.toString());
  }
}
