package arm;

import ast.BinaryExpression.Operator;

public class MoveConditionalInstruction implements ARMInstruction {
  private final Operator operator;
  private final Operand target;
  private final Operand source;

  public MoveConditionalInstruction(Operator operator, Operand target, Operand source) {
    this.operator = operator;
    this.target = target;
    this.source = source;
  }

  public String toString() {
    return String.format("%s %s, %s", this.getOperatorStr(), this.target.toString(), this.source.toString());
  }

  private String getOperatorStr() {
    switch (this.operator) {
      case LT: return "movlt";
      case GT: return "movgt";
      case LE: return "movle";
      case GE: return "movge";
      case NE: return "movne";
      default: return "moveq";
    }
  }
}
