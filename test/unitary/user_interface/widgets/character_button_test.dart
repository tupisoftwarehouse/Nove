import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/user_interface/widgets/character_button.dart";

void main() {
  group("Test \"CharacterButton\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CharacterButton(
              character: CalculatorCharacter.EQUAL,
              accessibilityLabel: APPLICATION_LANGUAGE
                  .CALCULATOR_EQUAL_BUTTON_ACCESSIBILITY_LABEL,
              onTap: () {
                isWidgetTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text(CalculatorCharacter.EQUAL.value));

      expect(isWidgetTapped, true);
    });
  });
}
