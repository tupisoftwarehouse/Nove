import "package:flutter/material.dart" hide Router;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/pages/calculator_page.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/expression_snapshot_item.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/expression_viewfinder.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CalculatorPage\" Page", () {
    late CalculatorViewModel calculatorViewModel;
    late ValueNotifier<bool> isExpressionHistoryOpened;
    late ValueNotifier<bool> isViewfinderAnimated;

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

      calculatorViewModel = CalculatorViewModel(
        calculator,
        expressionSnapshotHistoryManager,
        keyValueDatabase,
        deviceLanguageStringsViewModel,
      );

      isExpressionHistoryOpened = ValueNotifier<bool>(false);
      isViewfinderAnimated = ValueNotifier<bool>(false);
    });

    testWidgets(
      "Test If Expression Viewfinder Inputs Are With Text Set And Scrolled To The End And Sets Scrolling To The End Listener On Expression Snapshot Update On First Build",
      (tester) async {
        calculatorViewModel.currentExpressionSnapshot.value =
            EXPRESSION_SNAPSHOT;

        await tester.pumpWidget(
          MediaQuery(
            data: MediaQueryData(
              size: HISTORY_NOT_ABLE_TO_BE_OPENED_SCREEN_HEIGHT,
            ),
            child: MaterialApp(
              home: Scaffold(
                body: CalculatorPage(
                  calculatorViewModel: calculatorViewModel,
                  isExpressionHistoryOpened: isExpressionHistoryOpened,
                  isViewfinderAnimated: isViewfinderAnimated,
                ),
              ),
            ),
          ),
        );

        expect(
          tester
              .widget<TextField>((find.byType(TextField).first))
              .controller!
              .text,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          tester
              .widget<TextField>((find.byType(TextField).at(1)))
              .controller!
              .text,
          EXPRESSION_SNAPSHOT.result,
        );
      },
    );

    testWidgets(
      "Test If Expression History Is Closed On Screen Not Having Enough Height To Show It",
      (tester) async {
        isExpressionHistoryOpened.value = true;

        await tester.pumpWidget(
          MediaQuery(
            data: MediaQueryData(
              size: HISTORY_NOT_ABLE_TO_BE_OPENED_SCREEN_HEIGHT,
            ),
            child: MaterialApp(
              home: Scaffold(
                body: CalculatorPage(
                  calculatorViewModel: calculatorViewModel,
                  isExpressionHistoryOpened: isExpressionHistoryOpened,
                  isViewfinderAnimated: isViewfinderAnimated,
                ),
              ),
            ),
          ),
        );

        expect(isExpressionHistoryOpened.value, false);
      },
    );

    testWidgets(
      "Test If Expression Viewfinder Expression Input Is Unfocused On Void Space Tapped",
      (tester) async {
        calculatorViewModel.currentExpressionSnapshot.value =
            EXPRESSION_SNAPSHOT;

        isExpressionHistoryOpened.value = true;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CalculatorPage(
                calculatorViewModel: calculatorViewModel,
                isExpressionHistoryOpened: isExpressionHistoryOpened,
                isViewfinderAnimated: isViewfinderAnimated,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(TextField).first);

        await tester.tap(find.byType(GestureDetector).first);

        await tester.pump();

        expect(
          tester
              .widget<ExpressionViewfinder>(find.byType(ExpressionViewfinder))
              .expressionInputFocusNode
              .hasFocus,
          false,
        );
        expect(
          tester
              .widget<ExpressionViewfinder>(find.byType(ExpressionViewfinder))
              .expressionInputTextController
              .selection
              .baseOffset,
          EXPRESSION_SNAPSHOT.expression.length,
        );
        expect(
          tester
              .widget<ExpressionViewfinder>(find.byType(ExpressionViewfinder))
              .expressionInputTextController
              .selection
              .extentOffset,
          EXPRESSION_SNAPSHOT.expression.length,
        );
      },
    );

    testWidgets(
      "Test If Expression Viewfinder Is Closed On Foreground Backdrop Tapped",
      (tester) async {
        isExpressionHistoryOpened.value = true;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CalculatorPage(
                calculatorViewModel: calculatorViewModel,
                isExpressionHistoryOpened: isExpressionHistoryOpened,
                isViewfinderAnimated: isViewfinderAnimated,
              ),
            ),
          ),
        );

        await tester.tapAt(FOREGROUND_BACKDROP_POSITION);

        expect(isExpressionHistoryOpened.value, false);
      },
    );

    testWidgets(
      "Test If Expression Viewfinder Is Animated Opened On \"isExpressionHistoryOpened\" And \"isViewfinderAnimated\" True",
      (tester) async {
        isExpressionHistoryOpened.value = true;
        isViewfinderAnimated.value = true;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CalculatorPage(
                calculatorViewModel: calculatorViewModel,
                isExpressionHistoryOpened: isExpressionHistoryOpened,
                isViewfinderAnimated: isViewfinderAnimated,
              ),
            ),
          ),
        );

        final viewfinderContainer = find.byType(AnimatedContainer).first;

        expect(
          tester.getSize(viewfinderContainer).height,
          OPENED_EXPRESSION_VIEWFINDER_HEIGHT,
        );
      },
    );

    testWidgets(
      "Test If Expression Viewfinder Expression Input Updates Expression Snapshot On Calculator View Model If They Are Different",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CalculatorPage(
                calculatorViewModel: calculatorViewModel,
                isExpressionHistoryOpened: isExpressionHistoryOpened,
                isViewfinderAnimated: isViewfinderAnimated,
              ),
            ),
          ),
        );

        await tester.enterText(
          find.byType(TextField).first,
          EXPRESSION_TO_BE_EVALUATED,
        );

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          EXPRESSION_TO_BE_EVALUATED,
        );
      },
    );

    testWidgets(
      "Test If Snackbar Recovers Reset Data On Tap And Closes Expression History",
      (tester) async {
        isExpressionHistoryOpened.value = true;

        calculatorViewModel.setExpression(EXPRESSION_TO_BE_EVALUATED);

        calculatorViewModel.evaluate();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CalculatorPage(
                calculatorViewModel: calculatorViewModel,
                isExpressionHistoryOpened: isExpressionHistoryOpened,
                isViewfinderAnimated: isViewfinderAnimated,
              ),
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.delete_rounded));

        await tester.pumpAndSettle(AnimationDuration.LONG.value);

        expect(
          calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
          0,
        );
      },
    );

    testWidgets(
      "Test If Snackbar Restores Previous Expression Snapshot On Tap And Reopens Expression History",
      (tester) async {
        isExpressionHistoryOpened.value = true;

        calculatorViewModel.setExpression(EXPRESSION_TO_BE_EVALUATED);

        calculatorViewModel.evaluate();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CalculatorPage(
                calculatorViewModel: calculatorViewModel,
                isExpressionHistoryOpened: isExpressionHistoryOpened,
                isViewfinderAnimated: isViewfinderAnimated,
              ),
            ),
          ),
        );

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
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
      isExpressionHistoryOpened.value = true;

      calculatorViewModel.setExpression(EXPRESSION_TO_BE_EVALUATED);

      calculatorViewModel.evaluate();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CalculatorPage(
              calculatorViewModel: calculatorViewModel,
              isExpressionHistoryOpened: isExpressionHistoryOpened,
              isViewfinderAnimated: isViewfinderAnimated,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.delete_rounded));

      await tester.pumpAndSettle(AnimationDuration.LONG.value);

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        calculatorViewModel.restoreListOfPreviousExpressionSnapshots();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets(
      "Test If Viewfinder History Item Restores Expression Snapshot On Tap And Closes Expression History",
      (tester) async {
        isExpressionHistoryOpened.value = true;

        calculatorViewModel.setExpression(EXPRESSION_SNAPSHOT.expression);

        calculatorViewModel.evaluate();

        calculatorViewModel.setExpression("");

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CalculatorPage(
                calculatorViewModel: calculatorViewModel,
                isExpressionHistoryOpened: isExpressionHistoryOpened,
                isViewfinderAnimated: isViewfinderAnimated,
              ),
            ),
          ),
        );

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

        expect(isViewfinderAnimated.value, false);
        expect(isExpressionHistoryOpened.value, false);
      },
    );

    testWidgets(
      "Test If Viewfinder History Item Removes Expression Snapshot From History On Dismissed",
      (tester) async {
        isExpressionHistoryOpened.value = true;

        calculatorViewModel.setExpression(EXPRESSION_SNAPSHOT.expression);

        calculatorViewModel.evaluate();

        calculatorViewModel.setExpression("");

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CalculatorPage(
                calculatorViewModel: calculatorViewModel,
                isExpressionHistoryOpened: isExpressionHistoryOpened,
                isViewfinderAnimated: isViewfinderAnimated,
              ),
            ),
          ),
        );

        await tester.drag(
          find.byType(ExpressionSnapshotItem),
          EXPRESSION_SNAPSHOT_ITEM_DISMISS_FULL_SWIPE,
        );

        await tester.pumpAndSettle();

        expect(
          calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
          0,
        );
      },
    );
  });
}
