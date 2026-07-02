import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/compositions/scaffold_heading.dart";

void main() {
  group("Test \"ScaffoldHeading\" Composition", () {
    testWidgets("Test If Composition Renders", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScaffoldHeading(
              title: APPLICATION_LANGUAGE.AREA_UNIT_CONVERTER_UTILITY_NAME,
            ),
          ),
        ),
      );

      expect(
        find.text(APPLICATION_LANGUAGE.AREA_UNIT_CONVERTER_UTILITY_NAME),
        findsOneWidget,
      );
    });
  });
}
