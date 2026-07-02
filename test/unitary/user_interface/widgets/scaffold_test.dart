import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/widgets/scaffold.dart";

void main() {
  group("Test \"Scaffold\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isBackButtonTapped = false;
      bool isActionButtonTapped = false;

      await tester.pumpWidget(
        material.MaterialApp(
          home: Scaffold(
            onBackButtonTap: () {
              isBackButtonTapped = true;
            },
            actionButtons: [
              ActionButton(
                icon: Symbols.history_2,
                tooltipMessage:
                    APPLICATION_LANGUAGE.RESET_BUTTON_TOOLTIP_MESSAGE,
                accessibilityLabel:
                    APPLICATION_LANGUAGE.RESET_BUTTON_ACCESSIBILITY_LABEL,
                onTap: () {
                  isActionButtonTapped = true;
                },
              ),
            ],
            body: Container(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.tap(find.byIcon(Symbols.history_2));

      expect(isBackButtonTapped, true);
      expect(isActionButtonTapped, true);
    });
  });
}
