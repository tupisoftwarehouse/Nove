import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/user_interface/widgets/checkbox.dart";

void main() {
  group("Test \"Checkbox\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        material.MaterialApp(
          home: material.Scaffold(
            body: Checkbox(
              isChecked: false,
              tooltipMessage: APPLICATION_LANGUAGE
                  .SELECT_UNIT_ELEMENT_TOOLTIP_MESSAGE(MassUnit.KILOGRAM.name),
              accessibilityLabel: APPLICATION_LANGUAGE
                  .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                    MassUnit.KILOGRAM.name,
                  ),
              onTap: () {
                isWidgetTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(
        find.bySemanticsLabel(
          APPLICATION_LANGUAGE.SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
            MassUnit.KILOGRAM.name,
          ),
        ),
      );

      expect(isWidgetTapped, true);
    });
  });
}
