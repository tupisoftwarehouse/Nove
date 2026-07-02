import "package:flutter/material.dart" hide Router, Navigator;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/pages/calculator_page.dart";
import "package:nove/user_interface/screens/home_screen.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"HomeScreen\" Screen", () {
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
      "Test If Calculator Page Is Navigated If Calculator Page Is Tapped On Navigation Bar",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: HomeScreen(
              calculatorViewModel: calculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .NAVIGATION_BAR_CALCULATOR_PAGE_TITLE,
          ),
        );

        await tester.pumpAndSettle();

        expect(
          tester.widget<PageView>(find.byType(PageView)).controller!.page,
          0,
        );
      },
    );

    testWidgets(
      "Test If Utilities Page Is Navigated If Utilities Page Is Tapped On Navigation Bar",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: HomeScreen(
              calculatorViewModel: calculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .NAVIGATION_BAR_UTILITIES_PAGE_TITLE,
          ),
        );

        await tester.pumpAndSettle();

        expect(
          tester.widget<PageView>(find.byType(PageView)).controller!.page,
          1,
        );
      },
    );

    testWidgets("Test If Pages Are Navigated If Screen Is Swiped", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            calculatorViewModel: calculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.drag(find.byType(PageView), UTILITIES_PAGE_SWIPE);

      await tester.pumpAndSettle(AnimationDuration.SHORT.value);

      expect(tester.widget<AnimatedScale>(find.byType(AnimatedScale)).scale, 0);

      expect(
        tester.widget<PageView>(find.byType(PageView)).controller!.page,
        1,
      );

      await tester.drag(find.byType(PageView), CALCULATOR_PAGE_SWIPE);

      await tester.pumpAndSettle();

      expect(
        tester.widget<PageView>(find.byType(PageView)).controller!.page,
        0,
      );
    });

    testWidgets(
      "Test If Open Expression History Button Is Opens Expression History On Tap",
      (tester) async {
        await tester.binding.setSurfaceSize(FIXED_SCREEN_SIZE);

        await tester.pumpWidget(
          MaterialApp(
            home: HomeScreen(
              calculatorViewModel: calculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.expand_rounded));

        await tester.pumpAndSettle();

        expect(find.byIcon(Symbols.compress_rounded), findsOneWidget);

        expect(
          tester
              .widget<CalculatorPage>(find.byType(CalculatorPage))
              .isExpressionHistoryOpened
              .value,
          true,
        );

        await tester.tap(find.byIcon(Symbols.compress_rounded));

        await tester.pumpAndSettle();

        expect(find.byIcon(Symbols.expand_rounded), findsOneWidget);

        expect(
          tester
              .widget<CalculatorPage>(find.byType(CalculatorPage))
              .isExpressionHistoryOpened
              .value,
          false,
        );

        await tester.binding.setSurfaceSize(null);
      },
    );
  });
}
