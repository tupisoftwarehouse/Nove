import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/agnostic_widgets/surface.dart";
import "package:nove/user_interface/agnostic_widgets/tooltip.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

void main() {
  group("Test \"Tooltip\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: material.Scaffold(
            body: Tooltip(
              message: APPLICATION_LANGUAGE.BACK_BUTTON_TOOLTIP_MESSAGE,
              verticalOffset: 21,
              child: Surface(
                backgroundColor: NEUTRALS_50,
                borderColor: NEUTRALS_300,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  child: Text(
                    APPLICATION_LANGUAGE
                        .CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE,
                    style: LABEL_12_BOLD(NEUTRALS_900),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      expect(
        find.byTooltip(APPLICATION_LANGUAGE.BACK_BUTTON_TOOLTIP_MESSAGE),
        findsOneWidget,
      );
    });
  });
}
