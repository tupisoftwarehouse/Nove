import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/navigation_bar/navigation_bar_item.dart";
import "package:nove/user_interface/widgets/navigation_bar/navigation_bar.dart";

void main() {
  group("Test \"NavigationBar\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        material.MaterialApp(
          home: material.Scaffold(
            body: NavigationBar(
              items: [
                NavigationBarItem(
                  icon: Symbols.equal_rounded,
                  title:
                      APPLICATION_LANGUAGE.NAVIGATION_BAR_CALCULATOR_PAGE_TITLE,
                  isSelected: true,
                  accessibilityLabel: APPLICATION_LANGUAGE
                      .NAVIGATION_BAR_CALCULATOR_PAGE_ELEMENT_ACCESSIBILITY_LABEL,
                  onTap: () {
                    isWidgetTapped = true;
                  },
                ),
              ],
            ),
          ),
        ),
      );

      await tester.tap(
        find.text(APPLICATION_LANGUAGE.NAVIGATION_BAR_CALCULATOR_PAGE_TITLE),
      );

      expect(isWidgetTapped, true);
    });
  });
}
