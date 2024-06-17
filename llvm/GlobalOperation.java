package llvm;

import java.util.Map;

public class GlobalOperation implements Operation {
  private final LLVMType type;

  public GlobalOperation(LLVMType type) {
    this.type = type;
  }

  public String toString() {
    return String.format("common global %s %s, align 8", this.type.toString(), (this.type instanceof LLVMStruct) ? "null" : "0");
  }

  public void markUsed(Map<String, Boolean> used) {}

  public void propagate(Map<String, Integer> constants) {}

  public void accept(LLVMVisitor v) {
    v.visit(this);
  }
}
