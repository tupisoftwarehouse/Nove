import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/expression_snapshot_item.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/expression_viewfinder.dart";

void main() {
  group("Test \"ExpressionViewfinder\" Widget", () {
    late ValueNotifier<ExpressionSnapshotValueObject> expressionSnapshot;
    late ValueNotifier<List<ExpressionSnapshotValueObject>>
    listOfPreviousExpressionSnapshots;
    late TextEditingController expressionInputTextController;

    setUp(() {
      expressionSnapshot = ValueNotifier(EMPTY_EXPRESSION_SNAPSHOT);

      listOfPreviousExpressionSnapshots = ValueNotifier([EXPRESSION_SNAPSHOT]);

      expressionInputTextController = TextEditingController();
    });

    testWidgets(
      "Test If Expression Snapshot Listener Is Set And Is Scrolled To The End Of Expression",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ExpressionViewfinder(
                expressionSnapshot: expressionSnapshot,
                listOfPreviousExpressionSnapshots:
                    listOfPreviousExpressionSnapshots,
                expressionInputTextController: expressionInputTextController,
                expressionInputFocusNode: FOCUS_NODE,
                onExpressionChange: (_) {},
                onCleanListOfPreviousExpressionSnapshots: () {},
                onExpressionSnapshotItemTap: (_) {},
                onExpressionSnapshotItemDismissed: (_) {},
              ),
            ),
          ),
        );

        expressionSnapshot.value = EXPRESSION_SNAPSHOT;

        await tester.pumpAndSettle();

        expect(
          tester
              .widget<TextField>(find.byType(TextField).at(2))
              .scrollController!
              .offset,
          EXPRESSION_TO_BE_EVALUATED_SCROLL_OFFSET,
        );

        expect(
          tester
              .widget<TextField>(find.byType(TextField).at(3))
              .scrollController!
              .offset,
          EXPRESSION_TO_BE_EVALUATED_SCROLL_OFFSET,
        );

        expect(
          tester
              .widget<TextField>(find.byType(TextField).at(0))
              .controller!
              .text,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          tester
              .widget<TextField>(find.byType(TextField).at(1))
              .controller!
              .text,
          EXPRESSION_SNAPSHOT.result,
        );

        expect(
          tester
              .widget<TextField>(find.byType(TextField).at(2))
              .controller!
              .text,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          tester
              .widget<TextField>(find.byType(TextField).at(3))
              .controller!
              .text,
          EXPRESSION_SNAPSHOT.result,
        );
      },
    );

    testWidgets(
      "Test If Clean List Of Previous Expression Snapshots Button Is Not Appearing On List Of Previous Expression Snapshots Is Empty",
      (tester) async {
        listOfPreviousExpressionSnapshots = ValueNotifier([]);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ExpressionViewfinder(
                expressionSnapshot: expressionSnapshot,
                listOfPreviousExpressionSnapshots:
                    listOfPreviousExpressionSnapshots,
                expressionInputTextController: expressionInputTextController,
                expressionInputFocusNode: FOCUS_NODE,
                onExpressionChange: (_) {},
                onCleanListOfPreviousExpressionSnapshots: () {},
                onExpressionSnapshotItemTap: (_) {},
                onExpressionSnapshotItemDismissed: (_) {},
              ),
            ),
          ),
        );

        expect(
          tester.widget<AnimatedScale>(find.byType(AnimatedScale)).scale,
          0,
        );
      },
    );

    testWidgets(
      "Test If \"onExpressionChange\" Is Dispatched On Expression Input Change And Updates Expression Snapshot Input Scroll Controller Positions",
      (WidgetTester tester) async {
        String expressionValue = "";

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ExpressionViewfinder(
                expressionSnapshot: expressionSnapshot,
                listOfPreviousExpressionSnapshots:
                    listOfPreviousExpressionSnapshots,
                expressionInputTextController: expressionInputTextController,
                expressionInputFocusNode: FOCUS_NODE,
                onExpressionChange: (updatedExpression) {
                  expressionValue = updatedExpression;
                },
                onCleanListOfPreviousExpressionSnapshots: () {},
                onExpressionSnapshotItemTap: (_) {},
                onExpressionSnapshotItemDismissed: (_) {},
              ),
            ),
          ),
        );

        await tester.enterText(
          find.byType(TextField).at(2),
          EXPRESSION_SNAPSHOT.expression,
        );

        await tester.pump();

        expect(
          tester
              .widget<TextField>(find.byType(TextField).at(2))
              .scrollController!
              .offset,
          EXPRESSION_TO_BE_EVALUATED_SCROLL_OFFSET,
        );

        expect(
          tester
              .widget<TextField>(find.byType(TextField).at(3))
              .scrollController!
              .offset,
          EXPRESSION_TO_BE_EVALUATED_SCROLL_OFFSET,
        );

        expect(expressionValue, EXPRESSION_SNAPSHOT.expression);
      },
    );

    testWidgets(
      "Test \"onCleanListOfPreviousExpressionSnapshots\" Is Dispatched On Clean List Of Previous Expression Snapshots Button Tapped",
      (WidgetTester tester) async {
        bool isCleanListOfPreviousExpressionSnapshotsTapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ExpressionViewfinder(
                expressionSnapshot: expressionSnapshot,
                listOfPreviousExpressionSnapshots:
                    listOfPreviousExpressionSnapshots,
                expressionInputTextController: expressionInputTextController,
                expressionInputFocusNode: FOCUS_NODE,
                onExpressionChange: (_) {},
                onCleanListOfPreviousExpressionSnapshots: () {
                  isCleanListOfPreviousExpressionSnapshotsTapped = true;
                },
                onExpressionSnapshotItemTap: (_) {},
                onExpressionSnapshotItemDismissed: (_) {},
              ),
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.delete_rounded));

        expect(isCleanListOfPreviousExpressionSnapshotsTapped, true);
      },
    );

    testWidgets(
      "Test If \"onExpressionSnapshotItemTap\" Is Dispatched On Expression Snapshot Item Tapped",
      (WidgetTester tester) async {
        bool isExpressionSnapshotItemTapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ExpressionViewfinder(
                expressionSnapshot: expressionSnapshot,
                listOfPreviousExpressionSnapshots:
                    listOfPreviousExpressionSnapshots,
                expressionInputTextController: expressionInputTextController,
                expressionInputFocusNode: FOCUS_NODE,
                onExpressionChange: (_) {},
                onCleanListOfPreviousExpressionSnapshots: () {},
                onExpressionSnapshotItemTap: (_) {
                  isExpressionSnapshotItemTapped = true;
                },
                onExpressionSnapshotItemDismissed: (_) {},
              ),
            ),
          ),
        );

        await tester.tap(
          find.descendant(
            of: find.byType(ExpressionSnapshotItem),
            matching: find.byType(TapIndicator),
          ),
        );

        expect(isExpressionSnapshotItemTapped, true);
      },
    );

    testWidgets(
      "Test If \"onExpressionSnapshotItemDismissed\" Is Dispatched On Expression Snapshot Item Dismissed",
      (WidgetTester tester) async {
        bool isExpressionSnapshotItemDismissed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ExpressionViewfinder(
                expressionSnapshot: expressionSnapshot,
                listOfPreviousExpressionSnapshots:
                    listOfPreviousExpressionSnapshots,
                expressionInputTextController: expressionInputTextController,
                expressionInputFocusNode: FOCUS_NODE,
                onExpressionChange: (_) {},
                onCleanListOfPreviousExpressionSnapshots: () {},
                onExpressionSnapshotItemTap: (_) {},
                onExpressionSnapshotItemDismissed: (_) {
                  isExpressionSnapshotItemDismissed = true;
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

        expect(isExpressionSnapshotItemDismissed, true);
      },
    );
  });
}
