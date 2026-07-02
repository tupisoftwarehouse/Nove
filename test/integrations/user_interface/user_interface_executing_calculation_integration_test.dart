import "package:flutter/material.dart" hide Router;
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/user_interface/screens/home_screen.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \" User Interface Executing Calculation\" Integration", () {
    late Router router;
    late CalculatorViewModel calculatorViewModel;

    setUp(() {
      final calculator = Calculator("");
      final keyValueDatabase = KeyValueDatabaseMock();
      final expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager(
        [],
      );
      final deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
        APPLICATION_LANGUAGE,
        (_) {},
      );
      final navigator = NavigatorMock((_, _) {}, (_) {});

      router = Router(navigator);

      calculatorViewModel = CalculatorViewModel(
        calculator,
        expressionSnapshotHistoryManager,
        keyValueDatabase,
        deviceLanguageStringsViewModel,
      );
    });

    testWidgets(
      "Test Executing Calculation By \"Calculator\" On \"UserInterface\"",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: HomeScreen(
                calculatorViewModel: calculatorViewModel,
                router: router,
              ),
            ),
          ),
        );

        await tester.tap(find.text(CalculatorCharacter.ONE.value));
        await tester.tap(find.text(CalculatorCharacter.ADD.value));
        await tester.tap(find.text(CalculatorCharacter.ONE.value));

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          CalculatorCharacter.ONE.value +
              CalculatorCharacter.ADD.value +
              CalculatorCharacter.ONE.value,
        );

        await tester.tap(find.text(CalculatorCharacter.EQUAL.value));

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          CalculatorCharacter.TWO.value,
        );
      },
    );
  });
}
