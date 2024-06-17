package ast;

import semantic.Visitor;

public class UnaryExpression extends AbstractExpression {
   private final UnaryOperator operator;
   private final Expression operand;

   private UnaryExpression(int lineNum, UnaryOperator operator, Expression operand) {
      super(lineNum);
      this.operator = operator;
      this.operand = operand;
   }

   public String toString(String sp) {
      return String.format("%s %s\n", this.operator.toString(), this.operand.toString());
   }

   public void accept(Visitor v) {
      v.visit(this);
   }

   public UnaryOperator getOperator() {
      return this.operator;
   }

   public Expression getOperand() {
      return this.operand;
   }

   public static UnaryExpression create(int lineNum, String opStr, Expression operand) {
      if (opStr.equals(NOT_OPERATOR)) {
         return new UnaryExpression(lineNum, UnaryOperator.NOT, operand);
      } else if (opStr.equals(MINUS_OPERATOR)) {
         return new UnaryExpression(lineNum, UnaryOperator.MINUS, operand);
      } else {
         throw new IllegalArgumentException();
      }
   }

   public String getOperatorStr() {
      switch (this.operator) {
         case NOT:
            return "xor"; 
         case MINUS:
            return "sub";
         default:
            throw new IllegalStateException("Unexpected value: " + this.operator);
      }
   }

   public static final String NOT_OPERATOR = "!";
   public static final String MINUS_OPERATOR = "-";

   public static enum UnaryOperator {
      NOT, MINUS
   }
}
