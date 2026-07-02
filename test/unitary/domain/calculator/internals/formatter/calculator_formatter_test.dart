import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/calculator_constants.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/domain/calculator/character.dart";
import "package:nove/domain/calculator/internals/formatter/calculator_formatter.dart";

void main() {
  group("Test \"CalculatorFormatter\" Class", () {
    test(
      "Test If Method \"getExpressionWithoutLastCharacter\" Returns Expression Without Last Character",
      () {
        final expressionWithoutLastCharacter =
            CalculatorFormatter.getExpressionWithoutLastCharacter(
              EXPRESSION_TO_BE_EVALUATED,
            );

        expect(
          expressionWithoutLastCharacter,
          EXPRESSION_TO_BE_EVALUATED_WITHOUT_LAST_CHARACTER,
        );
      },
    );

    test(
      "Test If Method \"getExpressionWithoutLastCharacter\" Returns Empty Expression If Expression Is Empty",
      () {
        final emptyExpression =
            CalculatorFormatter.getExpressionWithoutLastCharacter("");

        expect(emptyExpression, "");
      },
    );

    test(
      "Test If Method \"getExpressionWithoutCharacterAt\" Returns Expression Without Character At A Given Index",
      () {
        final expressionWithoutLastCharacter =
            CalculatorFormatter.getExpressionWithoutCharacterAt(
              EXPRESSION_TO_BE_EVALUATED,
              EXPRESSION_TO_BE_EVALUATED.length,
            );

        expect(
          expressionWithoutLastCharacter,
          EXPRESSION_TO_BE_EVALUATED_WITHOUT_LAST_CHARACTER,
        );
      },
    );

    test(
      "Test If Method \"getExpressionWithoutCharacterAt\" Returns Empty Expression If Expression Is Empty",
      () {
        final expressionWithoutLastCharacter =
            CalculatorFormatter.getExpressionWithoutCharacterAt("", 0);

        expect(expressionWithoutLastCharacter, "");
      },
    );

    test(
      "Test If Method \"getExpressionWithCharacterAdded\" Returns Expression With Character Added",
      () {
        final expressionWithCharacterAdded =
            CalculatorFormatter.getExpressionWithCharacterAdded(
              EXPRESSION_TO_BE_EVALUATED,
              Character.ONE.value,
            );

        expect(
          expressionWithCharacterAdded,
          EXPRESSION_TO_BE_EVALUATED + Character.ONE.value,
        );
      },
    );

    test(
      "Test If Method \"getExpressionWithCharacterAddedAt\" Returns Expression With Character Added At A Given Index",
      () {
        final expressionWithCharacterAdded =
            CalculatorFormatter.getExpressionWithCharacterAddedAt(
              EXPRESSION_TO_BE_EVALUATED,
              Character.ONE.value,
              0,
            );

        expect(
          expressionWithCharacterAdded,
          Character.ONE.value + EXPRESSION_TO_BE_EVALUATED,
        );
      },
    );

    test(
      "Test If Method \"getExpressionWithFixedTruncation\" Returns Expression With Fixed Truncation",
      () {
        final expressionWithFixedTruncation =
            CalculatorFormatter.getExpressionWithFixedTruncation(
              NOT_FIXED_POINT_VALUE,
            );

        expect(expressionWithFixedTruncation, FIXED_POINT_VALUE);
      },
    );

    test(
      "Test If Method \"getExpressionWithFixedTruncation\" Returns Not Changed Value If Formatting Fails",
      () {
        final expressionWithFixedTruncation =
            CalculatorFormatter.getExpressionWithFixedTruncation("");

        expect(expressionWithFixedTruncation, "");
      },
    );

    test(
      "Test If Method \"getExpressionWithoutUnnecessaryZeros\" Returns Expression Without Unnecessary Zeros",
      () {
        final expressionWithoutUnnecessaryZeros =
            CalculatorFormatter.getExpressionWithoutUnnecessaryZeros(
              EXPRESSION_WITH_UNNECESSARY_ZEROS,
            );

        expect(
          expressionWithoutUnnecessaryZeros,
          EXPRESSION_WITHOUT_UNNECESSARY_ZEROS,
        );
      },
    );
  });
}
