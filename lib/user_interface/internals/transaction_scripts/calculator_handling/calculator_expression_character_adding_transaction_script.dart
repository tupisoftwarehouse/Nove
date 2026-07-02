import "package:flutter/widgets.dart";
import "package:nove/domain/calculator/character.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";

class CalculatorExpressionCharacterAddingTransactionScript {
  CalculatorExpressionCharacterAddingTransactionScript._();

  static void addCharacterToExpression(
    TextEditingController expressionInputTextController,
    CalculatorViewModel calculatorViewModel,
    Character character,
  ) {
    if (isCursorAtTheEndOfExpression(
      expressionInputTextController.selection.extent.offset,
      expressionInputTextController.text,
    )) {
      calculatorViewModel.addCharacter(character);
    } else {
      final currentCursorPosition =
          expressionInputTextController.selection.extentOffset;

      calculatorViewModel.addCharacterAt(character, currentCursorPosition);

      expressionInputTextController.selection = TextSelection(
        baseOffset: currentCursorPosition + 1,
        extentOffset: currentCursorPosition + 1,
      );
    }
  }
}
