import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class ScaffoldHeading extends StatefulWidget {
  final String title;

  const ScaffoldHeading({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _ScaffoldHeadingState();
  }
}

class _ScaffoldHeadingState extends State<ScaffoldHeading> {
  late final ThemeViewModel _themeViewModel;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: _themeViewModel.theme,
      builder: (_, theme, _) {
        return Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            top: 101,
            bottom: 42,
            left: 16,
            right: 16,
          ),
          child: Text(
            widget.title,
            style: HEADING_3(theme.textEmphasis9Color),
            softWrap: true,
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return ScaffoldHeading(
    title: APPLICATION_LANGUAGE.AREA_UNIT_CONVERTER_UTILITY_NAME,
  );
}
