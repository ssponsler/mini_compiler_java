package arm;

public class BranchLinkInstruction implements ARMInstruction {
  private final String name;

  public BranchLinkInstruction(String name) {
    this.name = name;
  }

  public String toString() {
    return "bl " + name;
  }
}
