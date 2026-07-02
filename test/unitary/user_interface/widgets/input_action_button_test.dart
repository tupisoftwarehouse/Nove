import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";

void main() {
  group("Test \"InputActionButton\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputActionButton(
              icon: Symbols.add_rounded,
              tooltipMessage:
                  APPLICATION_LANGUAGE.REMOVE_TIME_BUTTON_TOOLTIP_MESSAGE,
              accessibilityLabel:
                  APPLICATION_LANGUAGE.REMOVE_TIME_BUTTON_TOOLTIP_MESSAGE,
              onTap: () {
                isWidgetTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.add_rounded));

      expect(isWidgetTapped, true);
    });
  });
}
