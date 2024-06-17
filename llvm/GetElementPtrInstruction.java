package llvm;

import java.util.Map;

public class GetElementPtrInstruction implements Instruction {
  private final Value result;
  private final LLVMType type;
  private final Value base;
  private final Value index;

  public GetElementPtrInstruction(Value result, LLVMType type, Value base, Value index) {
    this.result = result;
    this.type = type;
    this.base = base;
    this.index = index;
  }

  @Override
  public String toString() {
    return String.format(
      "  %s = getelementptr %s, %s* %s, i32 0, i32 %s",
      this.result.toString(),
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

  public Value getResult() {
    return this.result;
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
  public void propagate(Map<String, Integer> constants) {
    //
  }

  @Override
  public void accept(LLVMVisitor v) {
    v.visit(this);
  }
}
