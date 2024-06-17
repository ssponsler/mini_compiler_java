package llvm;

import java.util.List;
import java.util.Map;

public class TypeOperation implements Operation {
  private final List<StructAssembler> fields;

  public TypeOperation(List<StructAssembler> fields) {
    this.fields = fields;
  }

  public String toString() {
    String out = "type {";
    for (int i = 0; i < this.fields.size(); i++) {
      out += this.fields.get(i).getType().toString() + ((i < this.fields.size() - 1) ? ", " : "");
    }
    return out + "}";
  }

  public void markUsed(Map<String, Boolean> used) {
    //
  }

  public void propagate(Map<String, Integer> constants) {
    //
  }

  public void accept(LLVMVisitor v) {
    v.visit(this);
  }
}
