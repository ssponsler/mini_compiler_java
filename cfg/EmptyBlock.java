package cfg;

import java.util.List;
import llvm.Instruction;

public class EmptyBlock extends BasicBlock {
  public EmptyBlock(String label) {
    super(label);
  }

  public EmptyBlock(String label, List<Instruction> instructions) {
    super(label, instructions);
  }

  public String toString() {
    return super.toString() + " %return empty block% #\n\n";
  }
}
