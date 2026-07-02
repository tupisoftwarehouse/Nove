import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/compositions/end_screen_padding.dart";

void main() {
  group("Test \"EndScreenPadding\" Composition", () {
    testWidgets("Test If Composition Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        material.MaterialApp(home: material.Scaffold(body: EndScreenPadding())),
      );

      expect(find.byType(EndScreenPadding), findsOneWidget);
    });
  });
}
