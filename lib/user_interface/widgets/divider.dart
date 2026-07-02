import "package:flutter/material.dart" as material;
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart" hide Orientation;
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";

class Divider extends StatelessWidget {
  final Color color;
  final Orientation orientation;

  const Divider({super.key, required this.color, required this.orientation});

  @override
  Widget build(BuildContext _) {
    return isOrientationHorizontal(orientation)
        ? material.Divider(
            color: color,
            height: 1,
            endIndent: 0,
            radius: BorderRadius.circular(1000),
            thickness: 1,
            indent: 0,
          )
        : material.VerticalDivider(
            color: color,
            width: 1,
            endIndent: 0,
            radius: BorderRadius.circular(1000),
            thickness: 1,
            indent: 0,
          );
  }
}

@Preview()
Widget preview() {
  return Divider(color: NEUTRALS_300, orientation: Orientation.HORIZONTAL);
}
