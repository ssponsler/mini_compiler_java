package llvm;

import java.util.Map;

public class AssignmentInstruction implements Instruction {
  private final Value target;
  private final Operation source;

  public AssignmentInstruction(Value target, Operation source) {
    this.target = target;
    this.source = source;
  }

  public String toString() {
    return String.format("  %s = %s\n", this.target, this.source.toString());
  }

  public Value getTarget() {
    return this.target;
  }

  public Operation source() {
    return this.source;
  }
  @Override
  public void markUsed(Map<String, Boolean> used) {
      if (!used.containsKey(this.target.toString())) {
         used.put(this.target.toString(), false);
      }
      this.source.markUsed(used);
   }

   public void getResult(Map<String, Integer> constants) {
      int result = -1;
      String operationType = "";

      if (this.source instanceof BinaryOperation) {
         operationType = "BinaryOperation";
      } else if (this.source instanceof XorOperation) {
         operationType = "XorOperation";
      } else if (this.source instanceof ComparisonOperation) {
         operationType = "ComparisonOperation";
      } else if (this.source instanceof ZextOperation) {
         operationType = "ZextOperation";
      } else if (this.source instanceof TruncateOperation) {
         operationType = "TruncateOperation";
      }

      switch (operationType) {
         case "BinaryOperation":
            result = ((BinaryOperation) this.source).getResult();
            break;
         case "XorOperation":
            result = ((XorOperation) this.source).getResult();
            break;
         case "ComparisonOperation":
            result = ((ComparisonOperation) this.source).getResult();
            break;
         case "ZextOperation":
            result = ((ZextOperation) this.source).getResult();
            break;
         case "TruncateOperation":
            result = ((TruncateOperation) this.source).getResult();
            break;
         default:
            // No operation type matched, result remains -1
            break;
      }

      if (result != -1) {
         constants.put(this.target.toString(), result);
      }
   }

  public void propagate(Map<String, Integer> constants) {
    this.source.propagate(constants);
  }

  public void accept(LLVMVisitor v) {
    v.visit(this);
  }
}
