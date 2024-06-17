package cfg;

import ast.Expression;
import ast.Statement;

public class LoopBlock extends BasicBlock {
  private BasicBlock next;
  private Expression guard;

  public LoopBlock(Expression guard, String label, Statement block) {
    super(label, block);
    this.guard = guard;
  }

  public LoopBlock(Expression guard, BasicBlock next, String label, Statement block) {
    super(label, block);
    this.next = next;
    this.guard = guard;
  }

  public String toString() {
    return super.toString() + " %while block% :\n\n" + (this.next == null ? "" : this.next.toString());
  }

  public BasicBlock cont() {
    return this;
  }

  public Expression guard() {
    return this.guard;
  }

  @Override
  public BasicBlock next() {
    return this.next;
  }

  @Override
  public void addBlock(BasicBlock block) {
    this.next = block;
  }
}
