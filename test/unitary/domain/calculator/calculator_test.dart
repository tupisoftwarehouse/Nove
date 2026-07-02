import "package:flutter_test/flutter_test.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/calculator/character.dart";

void main() {
  group("Test \"Calculator\" Class", () {
    late Calculator calculator;

    setUp(() {
      calculator = Calculator("");
    });

    test("Test If Method \"addCharacter\" Adds Character To Expression", () {
      calculator.addCharacter(Character.ONE);

      expect(calculator.expression, Character.ONE.value);
    });

    test(
      "Test If Method \"addCharacterAt\" Adds Character To Expression At Given Index",
      () {
        calculator.expression = Character.ONE.value + Character.THREE.value;

        calculator.addCharacterAt(Character.TWO, 1);

        expect(
          calculator.expression,
          Character.ONE.value + Character.TWO.value + Character.THREE.value,
        );
      },
    );

    test(
      "Test If Method \"backspace\" Removes Last Character From Expression When Expression Is Not Empty",
      () {
        calculator.expression = Character.ONE.value;

        calculator.backspace();

        expect(calculator.expression, "");
      },
    );

    test(
      "Test If Method \"backspaceAt\" Removes Last Character From Expression At Given Index when Expression Is Not Empty",
      () {
        calculator.expression =
            Character.ONE.value + Character.TWO.value + Character.THREE.value;

        calculator.backspaceAt(1);

        expect(
          calculator.expression,
          Character.TWO.value + Character.THREE.value,
        );
      },
    );

    test("Test If Method \"clean\" Turns Expression Empty", () {
      calculator.expression = Character.ONE.value;

      calculator.clean();

      expect(calculator.expression, "");
    });

    test(
      "Test If Method \"evaluate\" Evaluates Expression When Expression Is Not Empty",
      () {
        calculator.expression =
            Character.ONE.value + Character.PLUS.value + Character.ONE.value;

        calculator.evaluate();

        expect(calculator.expression, Character.TWO.value);
      },
    );
  });
}
