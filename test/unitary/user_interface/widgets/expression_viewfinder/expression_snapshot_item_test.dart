import "package:flutter/material.dart" hide Divider;
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/expression_snapshot_item.dart";

void main() {
  group("Test \"ExpressionSnapshotItem\" Widget", () {
    testWidgets(
      "Test If Widget Updates Expression Snapshot On Controllers Text On \"didUpdateWidget\" Event",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ExpressionSnapshotItem(
                key: EXPRESSION_SNAPSHOT_ITEM_KEY,
                expressionSnapshot: EMPTY_EXPRESSION_SNAPSHOT,
                accessibilityLabel: APPLICATION_LANGUAGE
                    .EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL,
                onTap: () {},
                onDismissed: () {},
              ),
            ),
          ),
        );

        expect(
          find.text(EMPTY_EXPRESSION_SNAPSHOT.expression).at(0),
          findsOneWidget,
        );
        expect(
          find.text(EMPTY_EXPRESSION_SNAPSHOT.result).at(1),
          findsOneWidget,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ExpressionSnapshotItem(
                key: EXPRESSION_SNAPSHOT_ITEM_KEY,
                expressionSnapshot: EXPRESSION_SNAPSHOT,
                accessibilityLabel: APPLICATION_LANGUAGE
                    .EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL,
                onTap: () {},
                onDismissed: () {},
              ),
            ),
          ),
        );

        expect(find.text(EXPRESSION_SNAPSHOT.expression), findsOneWidget);
        expect(find.text(EXPRESSION_SNAPSHOT.result), findsOneWidget);

        expect(find.text(EMPTY_EXPRESSION_SNAPSHOT.expression), findsNothing);
        expect(find.text(EMPTY_EXPRESSION_SNAPSHOT.result), findsNothing);
      },
    );

    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExpressionSnapshotItem(
              expressionSnapshot: EXPRESSION_SNAPSHOT,
              accessibilityLabel: APPLICATION_LANGUAGE
                  .EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL,
              onTap: () {
                isWidgetTapped = true;
              },
              onDismissed: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TapIndicator));

      expect(isWidgetTapped, true);
    });

    testWidgets("Test If Widget Dispatches \"onDismiss\" Event On Dismissed", (
      WidgetTester tester,
    ) async {
      bool isWidgetDismissed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExpressionSnapshotItem(
              expressionSnapshot: EXPRESSION_SNAPSHOT,
              accessibilityLabel: APPLICATION_LANGUAGE
                  .EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL,
              onTap: () {},
              onDismissed: () {
                isWidgetDismissed = true;
              },
            ),
          ),
        ),
      );

      await tester.drag(
        find.byType(ExpressionSnapshotItem),
        EXPRESSION_SNAPSHOT_ITEM_DISMISS_FULL_SWIPE,
      );

      await tester.pumpAndSettle();

      expect(isWidgetDismissed, true);

      expect(find.byType(Divider), findsNothing);
    });
  });
}
