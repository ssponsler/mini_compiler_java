package ast;

import semantic.Visitor;

public interface Statement
{
  public String toString(String sp);
  public void accept(Visitor v);
}
