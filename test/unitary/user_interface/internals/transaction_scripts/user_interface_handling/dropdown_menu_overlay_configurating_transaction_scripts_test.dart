import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/dropdown_menu_overlay_configuring_transaction_script.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";

void main() {
  group("Test \"DropdownMenuOverlayConfiguringTransactionScript\" Class", () {
    late ThemeViewModel themeViewModel;
    late ValueNotifier<bool> isShown;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      themeViewModel = ThemeViewModelFactory.getInstance();

      isShown = ValueNotifier(false);
    });

    test(
      "Test If Method \"getConfiguredOverlay\" Returns Configured Dropdown Menu Overlay Entry",
      () {
        final layerLink = LayerLink();
        final configuredOverlayEntry =
            DropdownMenuOverlayConfiguringTransactionScript.getConfiguredOverlayEntry(
              layerLink,
              themeViewModel,
              isShown,
              [
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
              DROPDOWN_MENU_WIDTH,
              () {},
            );

        expect(configuredOverlayEntry, isA<OverlayEntry>());
      },
    );
  });
}
