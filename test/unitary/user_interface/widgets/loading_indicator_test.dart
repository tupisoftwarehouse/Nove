import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/loading_indicator.dart";

void main() {
  group("Test \"LoadingIndicator\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoadingIndicator(
              accessibilityLabel:
                  APPLICATION_LANGUAGE.LOADING_INDICATOR_ACCESSIBILITY_LABEL,
            ),
          ),
        ),
      );

      expect(find.byType(LoadingIndicator), findsOneWidget);
    });
  });
}
