import "package:nove/domain/calculator/character.dart";
import "package:nove/domain/calculator/internals/formatter/calculator_formatter.dart";
import "package:nove/domain/expression_evaluator/expression_evaluator.dart";

class Calculator {
  String expression;

  Calculator(this.expression);

  void addCharacter(Character characterToBeAdded) {
    expression = CalculatorFormatter.getExpressionWithCharacterAdded(
      expression,
      characterToBeAdded.value,
    );
  }

  void addCharacterAt(
    Character characterToBeAdded,
    int indexOfCharacterToBeAdded,
  ) {
    expression = CalculatorFormatter.getExpressionWithCharacterAddedAt(
      expression,
      characterToBeAdded.value,
      indexOfCharacterToBeAdded,
    );
  }

  void backspace() {
    expression = CalculatorFormatter.getExpressionWithoutLastCharacter(
      expression,
    );
  }

  void backspaceAt(int indexOfCharacterToBeBackspaced) {
    expression = CalculatorFormatter.getExpressionWithoutCharacterAt(
      expression,
      indexOfCharacterToBeBackspaced,
    );
  }

  void clean() {
    expression = "";
  }

  void evaluate() {
    late final String evaluatedExpression;
    late final String fixedEvaluatedExpression;

    evaluatedExpression = ExpressionEvaluator.getEvaluatedExpression(
      expression,
    ).toString();

    fixedEvaluatedExpression =
        CalculatorFormatter.getExpressionWithFixedTruncation(
          evaluatedExpression,
        );

    expression = CalculatorFormatter.getExpressionWithoutUnnecessaryZeros(
      fixedEvaluatedExpression,
    );
  }
}
