package arm;

import java.util.List;

public class PushInstruction implements ARMInstruction {
  public List<RegisterOperand> registers;

  public PushInstruction(List<RegisterOperand> registers) {
    this.registers = registers;
  }

  public String toString() {
    String out = "push {";
    for (int i = 0; i < this.registers.size(); i++) {
      out += this.registers.get(i).toString() + ((i < (this.registers.size() - 1)) ? ", " : "");
    }

    return out + "}";
  }
}