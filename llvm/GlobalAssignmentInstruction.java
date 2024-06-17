package llvm;

import java.util.Map;

public class GlobalAssignmentInstruction implements Instruction {
  private final String target;
  private final Operation source;

  public GlobalAssignmentInstruction(String target, Operation source) {
    this.target = target;
    this.source = source;
  }

  public String toString() {
    return String.format("%s = %s%n", this.target, this.source.toString());
  }

  public void markUsed(Map<String, Boolean> used) {
    //
  }

  public void propagate(Map<String, Integer> constants) {
    //
  }

  public String getTarget() {
    return this.target;
  }

  public void accept(LLVMVisitor v) {
    v.visit(this);
  }
}
