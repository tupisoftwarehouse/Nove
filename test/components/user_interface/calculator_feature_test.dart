import "package:flutter/material.dart" hide Router;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/user_interface/screens/home_screen.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/expression_snapshot_item.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"Calculator\" Feature", () {
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

    testWidgets("Test Cleaning Expression Snapshot History", (tester) async {
      calculatorViewModel.setExpression(EXPRESSION_TO_BE_EVALUATED);

      calculatorViewModel.evaluate();

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

      await tester.tap(find.byIcon(Symbols.expand_rounded));

      await tester.pumpAndSettle(AnimationDuration.LONG.value);

      await tester.tap(find.byIcon(Symbols.delete_rounded));

      await tester.pumpAndSettle(AnimationDuration.LONG.value);

      expect(
        calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
        0,
      );
    });

    testWidgets("Test Restoring Expression Snapshot History", (tester) async {
      calculatorViewModel.setExpression(EXPRESSION_TO_BE_EVALUATED);

      calculatorViewModel.evaluate();

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

      await tester.tap(find.byIcon(Symbols.expand_rounded));

      await tester.pumpAndSettle(AnimationDuration.LONG.value);

      await tester.tap(find.byIcon(Symbols.delete_rounded));

      await tester.pumpAndSettle(AnimationDuration.LONG.value);

      expect(
        calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
        0,
      );

      await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(
        calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
        1,
      );
    });

    testWidgets("Test Removing Expression From Expression Snapshot History", (
      tester,
    ) async {
      calculatorViewModel.setExpression(EXPRESSION_SNAPSHOT.expression);

      calculatorViewModel.evaluate();

      calculatorViewModel.setExpression("");

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

      await tester.tap(find.byIcon(Symbols.expand_rounded));

      await tester.pumpAndSettle(AnimationDuration.LONG.value);

      await tester.drag(
        find.byType(ExpressionSnapshotItem),
        EXPRESSION_SNAPSHOT_ITEM_DISMISS_FULL_SWIPE,
      );

      await tester.pumpAndSettle();

      expect(
        calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
        0,
      );
    });

    testWidgets("Test Restoring Expression Snapshot From History", (
      tester,
    ) async {
      calculatorViewModel.setExpression(EXPRESSION_SNAPSHOT.expression);

      calculatorViewModel.evaluate();

      calculatorViewModel.setExpression("");

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

      await tester.tap(find.byIcon(Symbols.expand_rounded));

      await tester.pumpAndSettle(AnimationDuration.LONG.value);

      await tester.tap(find.byType(TextField).first, warnIfMissed: false);

      await tester.pumpAndSettle(AnimationDuration.LONG.value);

      expect(
        calculatorViewModel.currentExpressionSnapshot.value.expression,
        EXPRESSION_SNAPSHOT.expression,
      );
      expect(
        calculatorViewModel.currentExpressionSnapshot.value.result,
        EXPRESSION_SNAPSHOT.result,
      );
    });

    testWidgets("Test Executing Calculation", (tester) async {
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
    });
  });
}
