package ast;

import semantic.Visitor;

public class NewArrayExpression
    extends AbstractExpression
{
    private final String size;

    public NewArrayExpression(int lineNum, String size)
    {
        super(lineNum);
        System.out.println("NewArrayExpression");
        this.size = size;
        System.out.println("size: " + size);
    }
    public String toString(String sp) { return "";}

    public void accept(Visitor v) {
        v.visit(this);
    }


}