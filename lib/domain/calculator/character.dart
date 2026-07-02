enum Character {
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
  PLUS("+"),
  MINUS("-"),
  MULTIPLY("*"),
  DIVIDE("÷"),
  POINT("."),
  LEFT_PARENTHESIS("("),
  RIGHT_PARENTHESIS(")"),
  POWER("^"),
  SQUARED_ROOT("√"),
  FACTORIAL("!"),
  PI("π"),
  E("e"),
  PERCENTAGE("%"),
  RECIPROCAL("^(-1)");

  final String value;

  const Character(this.value);
}
