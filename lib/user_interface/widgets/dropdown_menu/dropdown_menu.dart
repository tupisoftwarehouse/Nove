import "dart:async";
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/theme/icon_styles.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/dropdown_menu_overlay_configuring_transaction_script.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class DropdownMenu extends StatefulWidget {
  final List<DropdownMenuItem> items;
  final String selectedItemShortcut;
  final String accessibilityLabel;

  const DropdownMenu({
    super.key,
    required this.items,
    required this.selectedItemShortcut,
    required this.accessibilityLabel,
  });

  @override
  State<DropdownMenu> createState() {
    return _DropdownMenuState();
  }
}

class _DropdownMenuState extends State<DropdownMenu> {
  final _isShown = ValueNotifier(false);
  final LayerLink _layerLink = LayerLink();
  late final ThemeViewModel _themeViewModel;
  OverlayEntry? _menuDropdownOverlayEntry;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, _) {
        if (_isShown.value) {
          _isShown.value = false;

          _menuDropdownOverlayEntry?.remove();

          _menuDropdownOverlayEntry = null;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: _themeViewModel.theme,
        builder: (_, theme, _) {
          return Center(
            child: CompositedTransformTarget(
              link: _layerLink,
              child: GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Semantics(
                    label: widget.accessibilityLabel,
                    button: true,
                    child: TapIndicator(
                      indicatorColor: theme.tapIndicatorColor,
                      onTap: () {
                        final dropdownMenuWidth =
                            (context.findRenderObject() as RenderBox)
                                .size
                                .width;

                        _menuDropdownOverlayEntry =
                            DropdownMenuOverlayConfiguringTransactionScript.getConfiguredOverlayEntry(
                              _layerLink,
                              _themeViewModel,
                              _isShown,
                              widget.items,
                              dropdownMenuWidth,
                              () {
                                late final Timer dropDownMenuRemovingTimer;

                                _isShown.value = false;

                                dropDownMenuRemovingTimer = Timer(
                                  AnimationDuration.MEDIUM.value,
                                  () {
                                    _menuDropdownOverlayEntry?.remove();

                                    _menuDropdownOverlayEntry = null;

                                    dropDownMenuRemovingTimer.cancel();
                                  },
                                );
                              },
                            );

                        Overlay.of(context).insert(_menuDropdownOverlayEntry!);

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _isShown.value = true;
                        });
                      },
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: theme.input.backgroundColor,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.selectedItemShortcut,
                                style: HEADING_4(theme.iconEmphasis9Color),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: _isShown,
                              builder: (_, isShown, _) {
                                return AnimatedRotation(
                                  duration: AnimationDuration.MEDIUM.value,
                                  curve: Curves.easeInOutCirc,
                                  turns: isShown ? 0.25 : 0.75,
                                  child: HEADING_4_ICON(
                                    Symbols.arrow_back_ios_new_rounded,
                                    theme.iconEmphasis9Color,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

@Preview()
Widget preview() {
  final itemLabel = "Binary";
  final itemAbbreviation = "BIN";

  return DropdownMenu(
    selectedItemShortcut: itemAbbreviation,
    accessibilityLabel: "",
    items: [
      DropdownMenuItem(
        label: itemLabel,
        abbreviation: itemAbbreviation,
        isSelected: true,
        accessibilityLabel: "",
        onTap: () {},
      ),
    ],
  );
}
