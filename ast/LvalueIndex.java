package ast;

import semantic.Visitor;

public class LvalueIndex implements Lvalue {
    private final int lineNum;
    private final Expression left;
    private final Expression idx;

    public LvalueIndex(int lineNum, Expression left, Expression idx) {
        this.lineNum = lineNum;
        this.left = left;
        this.idx = idx;
    }

    public void accept(Visitor v) {
        v.visit(this);
    }

    public String toString(String sp) {
        return String.format("%s%s[%s]%n", sp, this.left.toString(sp), this.idx.toString());
    }

    public int getLineNum() {
        return this.lineNum;
    }

    public Expression getLeft() {
        return this.left;
    }

    public Expression getIdx() {
        return this.idx;
    }

    public String getId() {
        return this.idx.toString();
    }
}
