package llvm;

import ast.BinaryExpression.Operator;
import java.util.Map;

public class BinaryOperation implements Operation {
    private final Operator operator;
    private final String operatorStr;
    private Value left;
    private Value right;

    public BinaryOperation(Operator operator, Value left, Value right) {
        this.operator = operator;
        this.operatorStr = getOperatorString(operator);
        this.left = left;
        this.right = right;
    }

    public BinaryOperation(String operatorStr, Value left, Value right) {
        this.operator = null;
        this.operatorStr = operatorStr;
        this.left = left;
        this.right = right;
    }

    public String toString() {
        return String.format("%s i64 %s, %s", this.operatorStr, this.left.toString(), this.right.toString());
    }

    private String getOperatorString(Operator operator) {
        switch (operator) {
            case MINUS:
                return "sub";
            case TIMES:
                return "mul";
            case DIVIDE:
                return "sdiv";
            case OR:
                return "or";
            case AND:
                return "and";
            default:
                return "add";
        }
    }

    public Operator getOperator() {
        return this.operator;
    }

public int getResult() {
    if ((this.left instanceof IntValue) && (this.right instanceof IntValue)) {
        int leftVal = ((IntValue) this.left).getValue();
        int rightVal = ((IntValue) this.right).getValue();

        if (this.operator == Operator.MINUS) {
            return leftVal - rightVal;
        } else if (this.operator == Operator.TIMES) {
            return leftVal * rightVal;
        } else if (this.operator == Operator.DIVIDE) {
            return leftVal / rightVal;
        } else if (this.operator == Operator.OR) {
            return (leftVal != 0 || rightVal != 0) ? 1 : 0;
        } else if (this.operator == Operator.AND) {
            return (leftVal != 0 && rightVal != 0) ? 1 : 0;
        } else {
            return leftVal + rightVal;
        }
    }
    return -1;
}

    public void markUsed(Map<String, Boolean> used) {
        if (this.left instanceof RegisterValue) {
            used.put(this.left.toString(), true);
        }
        if (this.right instanceof RegisterValue) {
            used.put(this.right.toString(), true);
        }
    }

    public void propagate(Map<String, Integer> constants) {
        if (constants.containsKey(this.left.toString())) {
            this.left = new IntValue(constants.get(this.left.toString()));
        }
        if (constants.containsKey(this.right.toString())) {
            this.right = new IntValue(constants.get(this.right.toString()));
        }
    }

    public Value getLeft() {
        return this.left;
    }

    public Value getRight() {
        return this.right;
    }

    public void accept(LLVMVisitor v) {
        v.visit(this);
    }
}
