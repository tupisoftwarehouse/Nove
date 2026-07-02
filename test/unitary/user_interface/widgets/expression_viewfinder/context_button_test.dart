import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/context_button.dart";

void main() {
  group("Test \"ContextButton\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContextButton(
              icon: Symbols.delete_rounded,
              color: NEUTRALS_50,
              tapIndicatorColor: NEUTRALS_50,
              accessibilityLabel: APPLICATION_LANGUAGE
                  .CLEAN_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_BUTTON_ACCESSIBILITY_LABEL,
              onTap: () {
                isWidgetTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.delete_rounded));

      expect(isWidgetTapped, true);
    });
  });
}
