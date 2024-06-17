package llvm;

import java.util.List;

public class LLVMStruct implements LLVMType {
  private final String name;
  private final List<StructAssembler> fields;

  public LLVMStruct(String name, List<StructAssembler> fields) {
    this.name = name;
    this.fields = fields;
  }

  public String toString() {
    return String.format("%%struct.%s*", this.name);
  }

  public String getName() {
    return this.name;
  }

  public int getFieldNum(String name) {
    int i = 0;
    while (i < this.fields.size()) {
      if (this.fields.get(i).getStr().equals(name)) {
        return i;
      }
      i++;
    }
    return 0;
  }

   public List<StructAssembler> getFields() {
      return this.fields;
   }

  public StructAssembler getFieldType(String name) {
    for (int i = 0; i < this.fields.size(); i++) {
      StructAssembler h = this.fields.get(i);
      if (h.getStr().equals(name)) {
        return h;
      }
    }
    return new StructAssembler("void", new LLVMVoid());
  }
}
