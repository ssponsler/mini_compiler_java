package arm;

public class RegisterOperand implements Operand {
  private String name;

  public RegisterOperand(String name) {
    this.name = name;
  }

  public String toString() {
    return name;
  }
}
