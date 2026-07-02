import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/screens/home_screen.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/expression_snapshot_item.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"User Interface Managing Expressions\" Integration", () {
    late CalculatorViewModel calculatorViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late Router router;

    setUp(() {
      final calculator = Calculator("");
      final keyValueDatabase = KeyValueDatabaseMock();
      final expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager(
        [],
      );
      final navigator = NavigatorMock((_, _) {}, (_) {});

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

      router = Router(navigator);
    });

    testWidgets(
      "Test Managing Expressions From Calculator By \"Calculator\" And \"ExpressionSnapshotHistoryManager\" On \"UserInterface\"",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: HomeScreen(
              calculatorViewModel: calculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.text(CalculatorCharacter.ONE.value));
        await tester.tap(find.text(CalculatorCharacter.ADD.value));
        await tester.tap(find.text(CalculatorCharacter.ONE.value));

        await tester.tap(find.text(CalculatorCharacter.EQUAL.value));

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

        await tester.tap(find.byIcon(Symbols.compress_rounded));

        await tester.pumpAndSettle(AnimationDuration.LONG.value);

        await tester.tap(find.text(CalculatorCharacter.CLEAR.value));

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.expand_rounded));

        await tester.pumpAndSettle(AnimationDuration.LONG.value);

        await tester.tap(
          find.text(
            calculatorViewModel
                .listOfPreviousExpressionSnapshots
                .value
                .first
                .expression,
          ),
          warnIfMissed: false,
        );

        await tester.pumpAndSettle(AnimationDuration.LONG.value);

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          CalculatorCharacter.ONE.value +
              CalculatorCharacter.ADD.value +
              CalculatorCharacter.ONE.value,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          CalculatorCharacter.TWO.value,
        );

        await tester.tap(find.byIcon(Symbols.expand_rounded));

        await tester.pumpAndSettle(AnimationDuration.LONG.value);

        await tester.drag(
          find.byType(ExpressionSnapshotItem),
          EXPRESSION_SNAPSHOT_ITEM_DISMISS_FULL_SWIPE,
        );

        await tester.pumpAndSettle(AnimationDuration.LONG.value);

        expect(
          calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
          0,
        );
      },
    );
  });
}
