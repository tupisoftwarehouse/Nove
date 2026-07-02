import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/widgets/navigation_bar/indicator.dart";

void main() {
  group("Test \"Indicator\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: Indicator(isShown: true))),
      );

      expect(find.byType(Indicator), findsOneWidget);
    });
  });
}
