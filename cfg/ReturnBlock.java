package cfg;

import ast.Expression;
import java.util.List;
import llvm.Instruction;

public class ReturnBlock extends BasicBlock {
  private Expression expression;

  public ReturnBlock(String label, Expression expr) {
    super(label);
    this.expression = expr;
  }

  public ReturnBlock(String label, Expression expression, List<Instruction> instructions) {
    super(label, instructions);
    this.expression = expression;
  }

  public String toString() {
    return super.toString() + " %return block% # \n\n";
  }

  public Expression getExpression() {
    return this.expression;
  }
}
