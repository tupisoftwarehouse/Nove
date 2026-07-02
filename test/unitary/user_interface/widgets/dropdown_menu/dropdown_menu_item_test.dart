import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart"
    as dropdown_menu_item;

void main() {
  group("Test \"DropdownMenuItem\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: dropdown_menu_item.DropdownMenuItem(
              label: APPLICATION_LANGUAGE
                  .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL,
              abbreviation: APPLICATION_LANGUAGE
                  .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT,
              isSelected: false,
              accessibilityLabel: APPLICATION_LANGUAGE
                  .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL,
              onTap: () {
                isWidgetTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(
        find.text(
          APPLICATION_LANGUAGE.SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL,
        ),
      );

      expect(isWidgetTapped, true);
    });
  });
}
