package ast;

import semantic.Visitor;

public interface Lvalue
{
  public void accept(Visitor v);
  public String getId();
}
