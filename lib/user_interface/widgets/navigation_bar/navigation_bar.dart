import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart" hide Orientation;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/surface.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/widgets/navigation_bar/navigation_bar_item.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";

class NavigationBar extends StatefulWidget {
  final List<NavigationBarItem> items;

  const NavigationBar({super.key, required this.items});

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarState();
  }
}

class _NavigationBarState extends State<NavigationBar> {
  late final ThemeViewModel _themeViewModel;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _themeViewModel.theme,
      builder: (_, theme, _) {
        final itemsWithDividers = widget.items.expand((item) {
          return [
            item,
            Divider(
              color: theme.elevatedSurface.borderColor,
              orientation: Orientation.VERTICAL,
            ),
          ];
        }).toList()..removeLast();

        return IntrinsicWidth(
          child: Surface(
            height: 64,
            backgroundColor: theme.elevatedSurface.backgroundColor,
            borderColor: theme.elevatedSurface.borderColor,
            borderRadius: BorderRadius.circular(1000),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: itemsWithDividers,
            ),
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return NavigationBar(
    items: [
      NavigationBarItem(
        icon: Symbols.equal_rounded,
        title: "Calculator",
        isSelected: true,
        accessibilityLabel: "",
        onTap: () {},
      ),
      NavigationBarItem(
        icon: Symbols.widgets_rounded,
        title: "Utilities",
        isSelected: false,
        accessibilityLabel: "",
        onTap: () {},
      ),
    ],
  );
}
