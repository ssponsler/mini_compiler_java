package llvm;

import java.util.Map;

public class ArrPointerOperation implements Operation {
  private final LLVMType type;
  private final Value base;
  private final Value index;

  public ArrPointerOperation(LLVMType type, Value base, Value index) {
    this.type = type;
    this.base = base;
    this.index = index;
  }

  @Override
  public String toString() {
    return String.format(
      "getelementptr %s, %s %s, i32 0, i32 %s",
      this.type.toString(),
      this.type.toString(),
      this.base.toString(),
      this.index.toString()
    );
  }

  public LLVMType getType() {
    return this.type;
  }

  public Value getBase() {
    return this.base;
  }

  public Value getIndex() {
    return this.index;
  }

  @Override
  public void markUsed(Map<String, Boolean> used) {
    if (this.base instanceof RegisterValue) {
      used.put(this.base.toString(), true);
    }
    if (this.index instanceof RegisterValue) {
      used.put(this.index.toString(), true);
    }
  }

  @Override
  public void propagate(Map<String, Integer> constants) {}

  @Override
  public void accept(LLVMVisitor v) {
    v.visit(this);
  }
}
