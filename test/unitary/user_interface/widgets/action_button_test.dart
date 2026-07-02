import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/action_button.dart";

void main() {
  group("Test \"ActionButton\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ActionButton(
              icon: Symbols.arrow_back_ios_new_rounded,
              tooltipMessage: APPLICATION_LANGUAGE.BACK_BUTTON_TOOLTIP_MESSAGE,
              accessibilityLabel:
                  APPLICATION_LANGUAGE.BACK_BUTTON_ACCESSIBILITY_LABEL,
              onTap: () {
                isWidgetTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      expect(isWidgetTapped, true);
    });
  });
}
