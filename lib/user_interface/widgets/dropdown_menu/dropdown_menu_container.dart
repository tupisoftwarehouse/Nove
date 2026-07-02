import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart" hide Orientation;
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/agnostic_widgets/surface.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";

class DropdownMenuContainer extends StatefulWidget {
  final LayerLink layerLink;
  final ThemeViewModel themeViewModel;
  final ValueNotifier<bool> isShown;
  final List<DropdownMenuItem> items;
  final double dropdownMenuWidth;
  final VoidCallback removeMenuDropdownOverlayEntry;

  const DropdownMenuContainer({
    super.key,
    required this.layerLink,
    required this.themeViewModel,
    required this.isShown,
    required this.items,
    required this.dropdownMenuWidth,
    required this.removeMenuDropdownOverlayEntry,
  });

  @override
  State<StatefulWidget> createState() {
    return _DropdownMenuContainerState();
  }
}

class _DropdownMenuContainerState extends State<DropdownMenuContainer> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext _) {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.removeMenuDropdownOverlayEntry,
        child: Stack(
          children: [
            CompositedTransformFollower(
              link: widget.layerLink,
              offset: const Offset(0, 68),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: ValueListenableBuilder(
                  valueListenable: widget.themeViewModel.theme,
                  builder: (_, theme, _) {
                    final itemsWithDividers =
                        widget.items.indexed
                            .map((item) {
                              if (item.$2.isSelected) {
                                _scrollController = ScrollController(
                                  initialScrollOffset: item.$1 * 48 - 56,
                                );
                              }

                              return DropdownMenuItem(
                                label: item.$2.label,
                                abbreviation: item.$2.abbreviation,
                                isSelected: item.$2.isSelected,
                                accessibilityLabel: item.$2.accessibilityLabel,
                                onTap: () {
                                  item.$2.onTap();

                                  widget.isShown.value = false;

                                  widget.removeMenuDropdownOverlayEntry();
                                },
                              );
                            })
                            .expand((element) {
                              return [
                                element,
                                Divider(
                                  color: theme.elevatedSurface.borderColor,
                                  orientation: Orientation.HORIZONTAL,
                                ),
                              ];
                            })
                            .toList()
                          ..removeLast();

                    return ValueListenableBuilder(
                      valueListenable: widget.isShown,
                      builder: (_, isShownValue, _) {
                        return AnimatedContainer(
                          height: isShownValue ? widget.items.length * 48 : 0,
                          constraints: const BoxConstraints(maxHeight: 168),
                          width: widget.dropdownMenuWidth,
                          duration: AnimationDuration.MEDIUM.value,
                          curve: Curves.easeInOutCirc,
                          child: Surface(
                            height: double.infinity,
                            width: double.infinity,
                            backgroundColor: theme.input.backgroundColor,
                            borderColor: theme.elevatedSurface.borderColor,
                            borderRadius: BorderRadius.circular(13),
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: itemsWithDividers,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return DropdownMenuContainer(
    layerLink: LayerLink(),
    themeViewModel: ThemeViewModelFactory.getInstance(),
    isShown: ValueNotifier(true),
    items: [
      DropdownMenuItem(
        label: "Binary",
        abbreviation: "BIN",
        isSelected: true,
        accessibilityLabel: "",
        onTap: () {},
      ),
    ],
    dropdownMenuWidth: 200,
    removeMenuDropdownOverlayEntry: () {},
  );
}
