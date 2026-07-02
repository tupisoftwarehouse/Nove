import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/foreground_backdrop.dart";

void main() {
  group("Test \"ForegroundBackdrop\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        material.MaterialApp(
          home: material.Scaffold(
            body: ForegroundBackdrop(
              isVisible: true,
              accessibilityLabel:
                  APPLICATION_LANGUAGE.FOREGROUND_BACKDROP_ACCESSIBILITY_LABEL,
              onTap: () {
                isWidgetTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(
        find.bySemanticsLabel(
          APPLICATION_LANGUAGE.FOREGROUND_BACKDROP_ACCESSIBILITY_LABEL,
        ),
      );

      expect(isWidgetTapped, true);
    });
  });
}
