import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/compositions/lower_third_content.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

void main() {
  group("Test \"LowerThirdContent\" Composition", () {
    testWidgets("Test If Composition Renders", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                LowerThirdContent(
                  isPadded: true,
                  child: Text(
                    APPLICATION_LANGUAGE
                        .CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE,
                    style: LABEL_12_BOLD(SECONDARY_500),
                  ),
                ),
              ],
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
