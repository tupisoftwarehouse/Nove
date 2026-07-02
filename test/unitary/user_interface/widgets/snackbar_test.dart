import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/snackbar.dart";

void main() {
  group("Test \"Snackbar\" Widget", () {
    testWidgets(
      "Test If Widget Dispatches \"onTap\" Event On Tapped And Executes \"onTimeout\" Event After Delay",
      (WidgetTester tester) async {
        bool isWidgetTapped = false;
        bool isTimeoutActionExecuted = false;

        await tester.pumpWidget(
          material.MaterialApp(
            home: material.Scaffold(
              body: Snackbar(
                message: APPLICATION_LANGUAGE
                    .RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_MESSAGE,
                description: APPLICATION_LANGUAGE
                    .RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_DESCRIPTION,
                icon: Symbols.settings_backup_restore_rounded,
                buttonAccessibilityLabel: APPLICATION_LANGUAGE
                    .RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_ACCESSIBILITY_LABEL,
                buttonTooltipMessage: APPLICATION_LANGUAGE
                    .RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_TOOLTIP_MESSAGE,
                onTap: () {
                  isWidgetTapped = true;
                },
                onTimeout: () {
                  isTimeoutActionExecuted = true;
                },
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

        await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

        expect(isWidgetTapped, true);
        expect(isTimeoutActionExecuted, true);
      },
    );
  });
}
