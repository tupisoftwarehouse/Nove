import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/internals/theme/colors.dart";

void main() {
  group("Test \"TapIndicator\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TapIndicator(
              indicatorColor: NEUTRALS_900,
              onTap: () {
                isWidgetTapped = true;
              },
              child: Container(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TapIndicator));

      expect(isWidgetTapped, true);
    });
  });
}
