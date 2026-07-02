import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class TimeInputDivider extends StatefulWidget {
  const TimeInputDivider({super.key});

  @override
  State<TimeInputDivider> createState() {
    return _TimeInputDividerState();
  }
}

class _TimeInputDividerState extends State<TimeInputDivider> {
  late final ThemeViewModel themeViewModel;

  @override
  void initState() {
    super.initState();

    themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: themeViewModel.theme,
      builder: (_, theme, _) {
        return SizedBox(
          width: 20,
          child: SizedBox(
            height: 56,
            width: 5,
            child: Center(
              child: Text(":", style: HEADING_4(theme.iconEmphasis9Color)),
            ),
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return TimeInputDivider();
}
