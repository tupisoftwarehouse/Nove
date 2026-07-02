import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/agnostic_widgets/surface.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

void main() {
  group("Test \"Surface\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Surface(
              backgroundColor: PRIMARY_900,
              borderColor: PRIMARY_800,
              borderRadius: BorderRadius.circular(
                LABEL_12_BOLD(SECONDARY_500).fontSize!,
              ),
              child: Text(
                APPLICATION_LANGUAGE.CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE,
                style: LABEL_12_BOLD(SECONDARY_500),
              ),
            ),
          ),
        ),
      );

      expect(
        find.text(
          APPLICATION_LANGUAGE.CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE,
        ),
        findsOneWidget,
      );
    });
  });
}
