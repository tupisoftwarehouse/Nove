import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class UtilityBanner extends StatelessWidget {
  final IconData icon;
  final String title;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const UtilityBanner({
    super.key,
    required this.icon,
    required this.title,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext _) {
    return Semantics(
      label: accessibilityLabel,
      button: true,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(26)),
        child: TapIndicator(
          indicatorColor: NEUTRALS_50,
          onTap: onTap,
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: PRIMARY_900,
              borderRadius: const BorderRadius.all(Radius.circular(26)),
              border: Border.all(
                color: PRIMARY_800,
                width: 1,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -180,
                  top: -90,
                  child: Icon(
                    icon,
                    size: 360,
                    color: PRIMARY_800,
                    weight: FontWeight.w900.value.toDouble(),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Positioned(
                  top: 32,
                  left: 26,
                  right: 26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        fill: 1,
                        size: 76,
                        color: SECONDARY_500,
                        weight: FontWeight.w900.value.toDouble(),
                        fontWeight: FontWeight.w900,
                      ),
                      const SizedBox(height: 13),
                      Text(
                        title,
                        style: HEADING_4(NEUTRALS_50),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return UtilityBanner(
    icon: Symbols.activity_zone_rounded,
    title: "Area Converter",
    accessibilityLabel: "",
    onTap: () {},
  );
}
