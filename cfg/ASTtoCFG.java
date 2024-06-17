package cfg;

import java.util.ArrayList;
import java.util.List;

import ast.*;
import semantic.Visitor;

public class ASTtoCFG extends Visitor {

  private BasicBlock cfg;
  private BasicBlock current;
  private Conditional conditional;
  private ArrayList<Statement> codeBlock;
  private int count;

  public ASTtoCFG() {
    this.conditional = Conditional.NONE;
    this.count = 0;
    this.codeBlock = new ArrayList<Statement>();
    this.cfg = new LineBlock(this.getLabel(), null);
    this.current = this.cfg;
  }

  public ASTtoCFG(int count) {
    this.conditional = Conditional.NONE;
    this.count = count;
    this.codeBlock = new ArrayList<Statement>();
    this.cfg = new LineBlock(this.getLabel(), null);
    this.current = this.cfg;
  }

  public void visit(ReturnEmptyStatement st) {
    if (this.codeBlock.size() > 0) {
      this.addSecureBlock(new LineBlock(this.getLabel(), this.getStatementBlock()));
      this.addSecureBlock(new EmptyBlock(this.getLabel()));
    } else {
      this.addSecureBlock(new EmptyBlock(this.getLabel()));
    }
  }

  public void visit(PrintStatement st) {
    this.codeBlock.add(st);
  }
  public void visit(ReturnStatement st) {
    if (this.codeBlock.size() > 0) {
      this.addSecureBlock(new LineBlock(this.getLabel(), this.getStatementBlock()));
      this.addSecureBlock(new ReturnBlock(this.getLabel(), st.getExpression()));
    } else {
      this.addSecureBlock(new ReturnBlock(this.getLabel(), st.getExpression()));
    }
  }

  public void visit(BlockStatement st) {
    for (Statement s : st.getStatements()) {
      s.accept(this);
    }
    if (this.codeBlock.size() > 0) {
      this.addSecureBlock(new LineBlock(this.getLabel(), this.getStatementBlock()));
    }
  }

  public void visit(WhileStatement st) {
    ConditionalBlock block = new ConditionalBlock(st.getGuard(), this.getLabel(), this.getStatementBlock());
    LineBlock end = new LineBlock(this.getLabel(), this.getStatementBlock());
    this.addSecureBlock(block);

    this.conditional = Conditional.THEN;
    st.getBody().accept(this);
    this.conditional = Conditional.NONE;

    ConditionalBlock cond = new ConditionalBlock(st.getGuard(), this.getLabel(), this.getStatementBlock(), true);
    this.addSecureBlock(cond);
    this.conditional = Conditional.THEN;
    this.addSecureBlock(block.getThen());

    this.conditional = Conditional.ELSE;
    this.current = block;
    this.addSecureBlock(end);
    this.current = cond;
    this.addSecureBlock(end);
    this.conditional = Conditional.NONE;
  }


  public void visit(PrintLnStatement st) {
    this.codeBlock.add(st);
  }

  public void visit(InvocationStatement st) {
    this.codeBlock.add(st);
  }

  public void visit(DeleteStatement st) {
    this.codeBlock.add(st);
  }

  public void visit(ConditionalStatement st) {
    this.addSecureBlock(new ConditionalBlock(st.getGuard(), this.getLabel(), this.getStatementBlock()));

    LineBlock end = new LineBlock(this.getLabel(), null);

    BasicBlock temp = this.current;

    this.conditional = Conditional.THEN;
    st.getThenBlock().accept(this);
    this.conditional = Conditional.NONE;
    if (!(this.current instanceof ReturnBlock) && !(this.current instanceof EmptyBlock)) {
      end.addParent();
    }
    this.addSecureBlock(end);

    this.current = temp;

    this.conditional = Conditional.ELSE;
    st.getElseBlock().accept(this);
    this.conditional = Conditional.NONE;
    if (!(this.current instanceof ReturnBlock) && !(this.current instanceof EmptyBlock)) {
      end.addParent();
    }
    this.addSecureBlock(end);
  }

  public void visit(AssignmentStatement st) {
    this.codeBlock.add(st);
  }

  public void visit(FalseExpression exp) {}

  public void visit(Function obj) {
    obj.getBody().accept(this);
    if ((this.current instanceof LineBlock) && (this.current.next() == null)) {
      this.addSecureBlock(new EmptyBlock(this.getLabel()));
    }
  }

  private void addSecureBlock(BasicBlock block) {
    if (this.current instanceof ConditionalBlock) {
      if (this.conditional == Conditional.THEN) {
        this.current.addThen(block);
        block.addPredecessor(this.current);
        this.current = this.current.getThen();
      } else {
        this.current.addElse(block);
        block.addPredecessor(this.current);
        this.current = this.current.getElse();
      }
    } else if (this.current instanceof LineBlock) {
      this.current.addBlock(block);
      block.addPredecessor(this.current);
      this.current = this.current.next();
    }
  }

  private String getLabel() {
    this.count += 1;
    return "LU" + Integer.toString(this.count);
  }

  private BlockStatement getStatementBlock() {
    BlockStatement block = new BlockStatement((List<Statement>)this.codeBlock.clone(),-1);
    this.codeBlock.clear();
    return block;
  }

  public int getCount() {
    return this.count;
  }

  public void setCount(int count) {
    this.count = count;
  }

  public BasicBlock getCurrent() {
    return this.current;
  }

  public BasicBlock getCFG() {
    return this.cfg;
  }

  private static enum Conditional {
    THEN, ELSE, NONE;
  }

  public void visit(Program obj) {}

  public void visit(IntegerExpression exp) {}

  public void visit(LvalueDot obj) {}

  public void visit(BinaryExpression exp) {}

  public void visit(ReadExpression exp) {}

  public void visit(LvalueIndex obj) {}

  public void visit(LvalueId obj) {}

  public void visit(NewExpression exp) {}

  public void visit(IdentifierExpression exp) {}

  public void visit(NewArrayExpression exp) {}

  public void visit(TrueExpression exp) {}

  public void visit(UnaryExpression exp) {}

  public void visit(TypeDeclaration obj) {}

  public void visit(NullExpression exp) {}

  public void visit(IndexExpression exp) {}

  public void visit(Declaration obj) {}

  public void visit(InvocationExpression exp) {}

  public void visit(DotExpression exp) {}
}
