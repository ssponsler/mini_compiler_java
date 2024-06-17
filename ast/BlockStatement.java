package ast;

import java.util.List;

import semantic.Visitor;

import java.util.ArrayList;

public class BlockStatement
   extends AbstractStatement
{
   private final List<Statement> statements;

   public BlockStatement(List<Statement> statements, int lineNum)
   {
      super(lineNum);
      this.statements = statements;
   }

   public String toString(String sp) {
      String out = "";

      for (Statement s : this.statements) {
         out += s.toString("") + "\n";
      }

      return out;
   }

   public static BlockStatement emptyBlock()
   {
      return new BlockStatement(new ArrayList<>(), -1);
   }

   public void accept(Visitor v) {
      v.visit(this);
   }

   public List<Statement> getStatements() {
      return this.statements;
   }
}
