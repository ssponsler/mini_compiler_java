package arm;

public class BranchInstruction implements ARMInstruction {
  private final String label;

  public BranchInstruction(String label) {
    this.label = label;
  }

  public String toString() {
    return String.format("b %s", this.label);
  }
}
