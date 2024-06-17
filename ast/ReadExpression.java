package ast;

import semantic.Visitor;

public class ReadExpression
   extends AbstractExpression
{
   public ReadExpression(int lineNum)
   {
      super(lineNum);
   }

   public String toString(String sp) {
      return "read";
   }

   public void accept(Visitor v) {
      v.visit(this);
   }
}
