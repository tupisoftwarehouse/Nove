import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_container.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";

void main() {
  group("Test \"DropdownMenuContainer\" Widget", () {
    late LayerLink layerLink;
    late ThemeViewModel themeViewModel;
    late ValueNotifier<bool> isShown;

    setUp(() {
      layerLink = LayerLink();

      themeViewModel = ThemeViewModelFactory.getInstance();

      isShown = ValueNotifier(true);
    });

    testWidgets(
      "Test If Widget Removes Dropdown Menu Container Overlay Entry On Container Tapped",
      (WidgetTester tester) async {
        bool isOverlayEntryRemoved = false;

        await tester.pumpWidget(
          material.MaterialApp(
            home: material.Scaffold(
              body: Stack(
                children: [
                  DropdownMenuContainer(
                    layerLink: layerLink,
                    themeViewModel: themeViewModel,
                    isShown: isShown,
                    items: [
                      DropdownMenuItem(
                        label: APPLICATION_LANGUAGE
                            .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL,
                        abbreviation: APPLICATION_LANGUAGE
                            .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT,
                        isSelected: false,
                        accessibilityLabel: APPLICATION_LANGUAGE
                            .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL,
                        onTap: () {},
                      ),
                    ],
                    dropdownMenuWidth: DROPDOWN_MENU_WIDTH,
                    removeMenuDropdownOverlayEntry: () {
                      isOverlayEntryRemoved = true;
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        await tester.tap(find.byType(GestureDetector).first);

        expect(isOverlayEntryRemoved, true);
      },
    );

    testWidgets(
      "Test If Widget Removes Dropdown Menu Container Overlay Entry On Item Tapped",
      (WidgetTester tester) async {
        bool isOverlayEntryRemoved = false;

        await tester.pumpWidget(
          material.MaterialApp(
            home: material.Scaffold(
              body: Stack(
                children: [
                  DropdownMenuContainer(
                    layerLink: layerLink,
                    themeViewModel: themeViewModel,
                    isShown: isShown,
                    items: [
                      DropdownMenuItem(
                        label: APPLICATION_LANGUAGE
                            .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL,
                        abbreviation: APPLICATION_LANGUAGE
                            .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT,
                        isSelected: false,
                        accessibilityLabel: APPLICATION_LANGUAGE
                            .SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL,
                        onTap: () {},
                      ),
                    ],
                    dropdownMenuWidth: DROPDOWN_MENU_WIDTH,
                    removeMenuDropdownOverlayEntry: () {
                      isOverlayEntryRemoved = true;
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        await tester.tap(find.byType(DropdownMenuItem), warnIfMissed: false);

        expect(isOverlayEntryRemoved, true);
      },
    );
  });
}
