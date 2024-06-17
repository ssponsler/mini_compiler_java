package ast;

import semantic.Visitor;

public class IndexExpression extends AbstractExpression {
    private final Expression left;
    private final Expression idx;

    public IndexExpression(int lineNum, Expression left, Expression idx) {
        super(lineNum);
        this.left = left;
        this.idx = idx;
    }

    public String toString(String sp) {
        return String.format("%s%s[%s]%n", sp, this.left.toString(sp), this.idx.toString(sp));
    }

    public void accept(Visitor v) {
        v.visit(this);
    }

    public Expression getLeft() {
        return this.left;
    }

    public Expression getIdx() {
        return this.idx;
    }
}
