import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";

void main() {
  group("Test \"Divider\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: material.Scaffold(
            body: Divider(
              color: NEUTRALS_300,
              orientation: Orientation.HORIZONTAL,
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });
  });
}
