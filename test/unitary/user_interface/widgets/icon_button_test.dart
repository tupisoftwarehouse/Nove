import "package:flutter/material.dart" hide IconButton;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/icon_button.dart";

void main() {
  group("Test \"IconButton\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconButton(
              icon: Symbols.add_rounded,
              title: APPLICATION_LANGUAGE.ADD_BUTTON_TITLE,
              accessibilityLabel:
                  APPLICATION_LANGUAGE.ADD_TIME_BUTTON_ACCESSIBILITY_LABEL,
              onTap: () {
                isWidgetTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text(APPLICATION_LANGUAGE.ADD_BUTTON_TITLE));

      expect(isWidgetTapped, true);
    });
  });
}
