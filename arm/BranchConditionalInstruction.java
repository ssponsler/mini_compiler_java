package arm;

import ast.BinaryExpression.Operator;

public class BranchConditionalInstruction implements ARMInstruction {
  private final Operator operator;
  private final String label;

  public BranchConditionalInstruction(Operator operator, String label) {
    this.operator = operator;
    this.label = label;
  }

  public String toString() {
    return String.format("%s %s", this.getOperatorStr(), this.label);
  }

  private String getOperatorStr() {
    switch (this.operator) {
      case GE: return "bge";
      case LT: return "blt";
      case NE: return "bne";
      case GT: return "bgt";
      case LE: return "ble";
      default: return "beq";
    }
  }
}
