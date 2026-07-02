import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/calculator/character.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/internals/transaction_scripts/calculator_handling/calculator_expression_character_adding_transaction_script.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CalculatorExpressionCharacterAddingTransactionScript\" Class", () {
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
      "Test If Method \"addCharacterToExpression\" Adds Character To Expression If Cursor Is At The End Of The Expression",
      () {
        CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
          expressionInputTextController,
          calculatorViewModel,
          Character.ONE,
        );

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          Character.ONE.value,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          Character.ONE.value,
        );
      },
    );

    test(
      "Test If Method \"addCharacterToExpression\" Adds Character To Expression At A Given Index If Cursor Is Not At The End Of The Expression",
      () {
        calculatorViewModel.addCharacter(Character.ONE);

        expressionInputTextController.text =
            calculatorViewModel.currentExpressionSnapshot.value.expression;

        expressionInputTextController.selection = TextSelection.collapsed(
          offset: 0,
        );

        CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
          expressionInputTextController,
          calculatorViewModel,
          Character.TWO,
        );

        expect(expressionInputTextController.selection.extentOffset, 1);
        expect(expressionInputTextController.selection.baseOffset, 1);

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          Character.TWO.value + Character.ONE.value,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          Character.TWO.value + Character.ONE.value,
        );
      },
    );
  });
}
