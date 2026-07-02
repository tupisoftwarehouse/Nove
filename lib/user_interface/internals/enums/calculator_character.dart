enum CalculatorCharacter {
  ADD("+"),
  SUBTRACT("-"),
  MULTIPLY("*"),
  DIVIDE("÷"),
  EQUAL("="),
  CLEAR("C"),
  POINT("."),
  LEFT_PARENTHESIS("("),
  RIGHT_PARENTHESIS(")"),
  PERCENTAGE("%"),
  PI("π"),
  E("e"),
  ROOT("√"),
  POWER("^"),
  FACTORIAL("!"),
  RECIPROCAL("1/x"),
  ZERO("0"),
  ONE("1"),
  TWO("2"),
  THREE("3"),
  FOUR("4"),
  FIVE("5"),
  SIX("6"),
  SEVEN("7"),
  EIGHT("8"),
  NINE("9"),
  EXPAND_KEYBOARD("⇱"),
  SHRINK_KEYBOARD("⇲"),
  BACKSPACE("⌫");

  final String value;

  const CalculatorCharacter(this.value);
}
