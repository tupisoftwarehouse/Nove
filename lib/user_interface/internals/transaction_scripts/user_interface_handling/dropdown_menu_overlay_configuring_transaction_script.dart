import "package:flutter/widgets.dart" hide Orientation;
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_container.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";

class DropdownMenuOverlayConfiguringTransactionScript {
  DropdownMenuOverlayConfiguringTransactionScript._();

  static OverlayEntry getConfiguredOverlayEntry(
    LayerLink layerLink,
    ThemeViewModel themeViewModel,
    ValueNotifier<bool> isShown,
    List<DropdownMenuItem> items,
    double dropdownMenuWidth,
    VoidCallback removeMenuDropdownOverlayEntry,
  ) {
    return OverlayEntry(
      builder: (_) {
        return DropdownMenuContainer(
          layerLink: layerLink,
          themeViewModel: themeViewModel,
          isShown: isShown,
          items: items,
          dropdownMenuWidth: dropdownMenuWidth,
          removeMenuDropdownOverlayEntry: removeMenuDropdownOverlayEntry,
        );
      },
    );
  }
}
