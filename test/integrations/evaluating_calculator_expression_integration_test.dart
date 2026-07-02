import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/calculator/character.dart";

void main() {
  group("Test \"Evaluating calculator Expression\" Integration", () {
    late Calculator calculator;

    setUpAll(() {
      calculator = Calculator("");
    });

    test(
      "Test \"ExpressionEvaluator\" Evaluating Expression On \"Calculator\"",
      () {
        calculator.addCharacter(Character.ONE);
        calculator.addCharacter(Character.PLUS);
        calculator.addCharacter(Character.ONE);

        calculator.evaluate();

        expect(calculator.expression, EVALUATED_EXPRESSION.toString());
      },
    );
  });
}
