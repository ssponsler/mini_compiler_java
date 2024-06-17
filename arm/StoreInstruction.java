package arm;

public class StoreInstruction implements ARMInstruction {
  private final Operand target;
  private final Operand source;

  public StoreInstruction(Operand target, Operand source) {
    this.target = target;
    this.source = source;
  }

  public String toString() {
    return String.format("str %s, [%s]", this.target.toString(), this.source.toString());
  }
}
