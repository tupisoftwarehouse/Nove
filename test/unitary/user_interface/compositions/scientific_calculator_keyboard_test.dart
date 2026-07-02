import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/user_interface/compositions/scientific_calculator_keyboard.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ScientificCalculatorKeyboard\" Composition", () {
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

    testWidgets(
      "Test If Calculator Buttons Dispatches Its Action On Tap And Add Character To Expression",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: material.Scaffold(
              body: ScientificCalculatorKeyboard(
                calculatorViewModel: calculatorViewModel,
                deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
                expressionInputTextController: expressionInputTextController,
              ),
            ),
          ),
        );

        await tester.tap(find.text(CalculatorCharacter.ONE.value));
        await tester.tap(find.text(CalculatorCharacter.ONE.value));
        await tester.tap(find.byIcon(Symbols.backspace_rounded));
        await tester.tap(find.text(CalculatorCharacter.TWO.value));
        await tester.tap(find.text(CalculatorCharacter.THREE.value));
        await tester.tap(find.text(CalculatorCharacter.FOUR.value));
        await tester.tap(find.text(CalculatorCharacter.FIVE.value));
        await tester.tap(find.text(CalculatorCharacter.SIX.value));
        await tester.tap(find.text(CalculatorCharacter.SEVEN.value));
        await tester.tap(find.text(CalculatorCharacter.EIGHT.value));
        await tester.tap(find.text(CalculatorCharacter.NINE.value));
        await tester.tap(find.text(CalculatorCharacter.ZERO.value));
        await tester.tap(find.text(CalculatorCharacter.ADD.value));
        await tester.tap(find.text(CalculatorCharacter.DIVIDE.value));

        await tester.tap(find.byIcon(Symbols.arrows_output_rounded));

        await tester.pumpAndSettle(AnimationDuration.MEDIUM.value);

        await tester.tap(find.text(CalculatorCharacter.E.value));
        await tester.tap(find.text(CalculatorCharacter.FACTORIAL.value));
        await tester.tap(find.text(CalculatorCharacter.LEFT_PARENTHESIS.value));
        await tester.tap(find.text(CalculatorCharacter.MULTIPLY.value));
        await tester.tap(find.text(CalculatorCharacter.PERCENTAGE.value));
        await tester.tap(find.text(CalculatorCharacter.PI.value));
        await tester.tap(find.text(CalculatorCharacter.POWER.value));
        await tester.tap(find.text(CalculatorCharacter.RECIPROCAL.value));
        await tester.tap(
          find.text(CalculatorCharacter.RIGHT_PARENTHESIS.value),
        );
        await tester.tap(find.text(CalculatorCharacter.ROOT.value));
        await tester.tap(find.text(CalculatorCharacter.EQUAL.value));

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          EXPRESSION_WITH_ALL_AVAILABLE_CHARACTERS,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .NOT_VALID_EXPRESSION_ERROR_MESSAGE,
        );

        await tester.tap(find.text(CalculatorCharacter.CLEAR.value));

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          "",
        );

        await tester.tap(find.byIcon(Symbols.arrows_input_rounded));

        await tester.pumpAndSettle(AnimationDuration.MEDIUM.value);

        expect(find.byIcon(Symbols.arrows_output_rounded), findsOneWidget);
      },
    );
  });
}
