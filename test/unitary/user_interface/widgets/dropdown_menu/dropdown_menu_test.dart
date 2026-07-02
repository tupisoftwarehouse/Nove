import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";

void main() {
  group("Test \"DropdownMenu\" Widget", () {
    testWidgets(
      "Test If Widget Shows Dropdown Menu Items And Item Dispatches \"onTap\" And Hides Dropdown Menu Items On Item Tapped",
      (WidgetTester tester) async {
        bool isItemTapped = false;

        await tester.pumpWidget(
          material.MaterialApp(
            home: material.Scaffold(
              body: DropdownMenu(
                selectedItemShortcut: APPLICATION_LANGUAGE
                    .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL,
                accessibilityLabel: APPLICATION_LANGUAGE
                    .NUMBER_SYSTEM_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                items: [
                  DropdownMenuItem(
                    label: APPLICATION_LANGUAGE
                        .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL,
                    abbreviation: APPLICATION_LANGUAGE
                        .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT,
                    isSelected: false,
                    accessibilityLabel: APPLICATION_LANGUAGE
                        .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL,
                    onTap: () {
                      isItemTapped = true;
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

        await tester.pumpAndSettle();

        await tester.tap(
          find.text(
            APPLICATION_LANGUAGE
                .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT,
          ),
        );

        await tester.pumpAndSettle();

        expect(isItemTapped, true);
      },
    );

    testWidgets("Test If Widget Hides Dropdown Menu Items On Back Button Press", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: material.Builder(
            builder: (context) {
              return material.Scaffold(
                body: material.ElevatedButton(
                  onPressed: () {
                    material.Navigator.of(context).push(
                      material.MaterialPageRoute(
                        builder: (_) {
                          return material.Scaffold(
                            body: DropdownMenu(
                              selectedItemShortcut: APPLICATION_LANGUAGE
                                  .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL,
                              accessibilityLabel: APPLICATION_LANGUAGE
                                  .NUMBER_SYSTEM_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                              items: [
                                DropdownMenuItem(
                                  label: APPLICATION_LANGUAGE
                                      .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL,
                                  abbreviation: APPLICATION_LANGUAGE
                                      .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT,
                                  isSelected: true,
                                  accessibilityLabel: APPLICATION_LANGUAGE
                                      .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: const material.SizedBox.shrink(),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.byType(material.SizedBox), warnIfMissed: false);

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle(AnimationDuration.MEDIUM.value);

      await tester.binding.handlePopRoute();

      await tester.pumpAndSettle(AnimationDuration.MEDIUM.value);

      expect(find.byType(DropdownMenuItem), findsNothing);
    });
  });
}
