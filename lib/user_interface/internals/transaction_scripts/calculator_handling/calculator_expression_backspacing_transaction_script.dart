import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";

class CalculatorExpressionBackspacingTransactionScript {
  CalculatorExpressionBackspacingTransactionScript._();

  static void backspaceExpression(
    TextEditingController expressionInputTextController,
    CalculatorViewModel calculatorViewModel,
  ) {
    if (isCursorAtTheStartOfExpression(
      expressionInputTextController.selection.extent.offset,
    )) {
      return;
    } else if (isCursorAtTheEndOfExpression(
      expressionInputTextController.selection.extent.offset,
      expressionInputTextController.text,
    )) {
      calculatorViewModel.backspace();
    } else {
      final currentCursorPosition =
          expressionInputTextController.selection.extentOffset;

      calculatorViewModel.backspaceAt(currentCursorPosition);

      expressionInputTextController.selection = TextSelection(
        baseOffset: currentCursorPosition - 1,
        extentOffset: currentCursorPosition - 1,
      );
    }
  }
}
