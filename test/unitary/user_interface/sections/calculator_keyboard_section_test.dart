import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/user_interface/compositions/scientific_calculator_keyboard.dart";
import "package:nove/user_interface/compositions/horizontal_calculator_keyboard.dart";
import "package:nove/user_interface/compositions/not_scientific_calculator_keyboard.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/sections/calculator_keyboard_section.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CalculatorKeyboardSection\" Section", () {
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

    testWidgets("Test If Composition Is Shown On Its Screen Size", (
      tester,
    ) async {
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(
            size: SCIENTIFIC_CALCULATOR_KEYBOARD_SCREEN_SIZE,
          ),
          child: MaterialApp(
            home: CalculatorKeyboardSection(
              calculatorViewModel: calculatorViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              expressionInputTextController: expressionInputTextController,
            ),
          ),
        ),
      );

      expect(find.byType(ScientificCalculatorKeyboard), findsOneWidget);
      expect(find.byType(HorizontalCalculatorKeyboard), findsNothing);
      expect(find.byType(NotScientificCalculatorKeyboard), findsNothing);

      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(
            size: HORIZONTAL_CALCULATOR_KEYBOARD_SCREEN_SIZE,
          ),
          child: MaterialApp(
            home: CalculatorKeyboardSection(
              calculatorViewModel: calculatorViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              expressionInputTextController: expressionInputTextController,
            ),
          ),
        ),
      );

      expect(find.byType(ScientificCalculatorKeyboard), findsNothing);
      expect(find.byType(HorizontalCalculatorKeyboard), findsOneWidget);
      expect(find.byType(NotScientificCalculatorKeyboard), findsNothing);

      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(
            size: NOT_SCIENTIFIC_CALCULATOR_KEYBOARD_SCREEN_SIZE,
          ),
          child: MaterialApp(
            home: CalculatorKeyboardSection(
              calculatorViewModel: calculatorViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              expressionInputTextController: expressionInputTextController,
            ),
          ),
        ),
      );

      expect(find.byType(ScientificCalculatorKeyboard), findsNothing);
      expect(find.byType(HorizontalCalculatorKeyboard), findsNothing);
      expect(find.byType(NotScientificCalculatorKeyboard), findsOneWidget);
    });
  });
}
