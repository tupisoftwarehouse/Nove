import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/compositions/time_input_divider.dart";

void main() {
  group("Test \"TimeInputDivider\" Composition", () {
    testWidgets("Test If Composition Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TimeInputDivider())),
      );

      expect(find.byType(TimeInputDivider), findsOneWidget);
    });
  });
}
