package llvm;

import java.util.Map;

public interface Instruction {
  public void markUsed(Map<String, Boolean> used);
  public void propagate(Map<String, Integer> constants);
  public void accept(LLVMVisitor v);
}
