import "package:flutter_test/flutter_test.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/calculator/character.dart";

void main() {
  group("Test \"Calculator\" Component", () {
    late Calculator calculator;

    setUp(() {
      calculator = Calculator("");
    });

    test("Test Adding Character To Expression", () {
      calculator.addCharacter(Character.ONE);

      expect(calculator.expression, Character.ONE.value);
    });

    test("Test Removing Last Character From Expression", () {
      calculator.addCharacter(Character.ONE);

      calculator.backspace();

      expect(calculator.expression, "");
    });

    test("Test Turning Expression Empty", () {
      calculator.addCharacter(Character.ONE);

      calculator.clean();

      expect(calculator.expression, "");
    });

    test("Test Evaluating Expression", () {
      calculator.addCharacter(Character.ONE);
      calculator.addCharacter(Character.PLUS);
      calculator.addCharacter(Character.ONE);

      calculator.evaluate();

      expect(calculator.expression, Character.TWO.value);
    });
  });
}
