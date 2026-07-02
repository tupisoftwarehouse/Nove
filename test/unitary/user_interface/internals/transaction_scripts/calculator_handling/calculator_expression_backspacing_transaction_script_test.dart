import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/calculator/character.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/internals/transaction_scripts/calculator_handling/calculator_expression_backspacing_transaction_script.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CalculatorExpressionBackspacingTransactionScript\" Class", () {
    late CalculatorViewModel calculatorViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TextEditingController expressionInputTextController;

    setUp(() {
      final calculator = Calculator("");
      final keyValueDatabase = KeyValueDatabaseMock();
      final expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager(
        [],
      );

      deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
        APPLICATION_LANGUAGE,
        (_) {},
      );

      calculatorViewModel = CalculatorViewModel(
        calculator,
        expressionSnapshotHistoryManager,
        keyValueDatabase,
        deviceLanguageStringsViewModel,
      );

      expressionInputTextController = TextEditingController();
    });

    test(
      "Test If Method \"backspaceExpression\" Keeps Expression The Way It Is If Cursor Is At The Start Of The Expression",
      () {
        CalculatorExpressionBackspacingTransactionScript.backspaceExpression(
          expressionInputTextController,
          calculatorViewModel,
        );

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          "",
        );
        expect(calculatorViewModel.currentExpressionSnapshot.value.result, "");
      },
    );

    test(
      "Test If Method \"backspaceExpression\" Backspaces Expression If Cursor Is At The End Of The Expression",
      () {
        calculatorViewModel.addCharacter(Character.ONE);

        CalculatorExpressionBackspacingTransactionScript.backspaceExpression(
          expressionInputTextController,
          calculatorViewModel,
        );

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          "",
        );
        expect(calculatorViewModel.currentExpressionSnapshot.value.result, "");
      },
    );

    test(
      "Test If Method \"\" Backspaces Expression At A Given Index If Cursor Is Not At The End Of The Expression",
      () {
        calculatorViewModel.addCharacter(Character.ONE);
        calculatorViewModel.addCharacter(Character.TWO);
        calculatorViewModel.addCharacter(Character.THREE);

        expressionInputTextController.text =
            calculatorViewModel.currentExpressionSnapshot.value.expression;

        expressionInputTextController.selection = TextSelection.collapsed(
          offset: 1,
        );

        CalculatorExpressionBackspacingTransactionScript.backspaceExpression(
          expressionInputTextController,
          calculatorViewModel,
        );

        expect(expressionInputTextController.selection.extentOffset, 0);
        expect(expressionInputTextController.selection.baseOffset, 0);

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          Character.TWO.value + Character.THREE.value,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          Character.TWO.value + Character.THREE.value,
        );
      },
    );
  });
}
