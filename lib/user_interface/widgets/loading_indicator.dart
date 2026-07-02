import "package:flutter/material.dart" as material;
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class LoadingIndicator extends StatefulWidget {
  final String accessibilityLabel;

  const LoadingIndicator({super.key, required this.accessibilityLabel});

  @override
  State<LoadingIndicator> createState() {
    return _LoadingIndicatorState();
  }
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
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
        return Semantics(
          label: widget.accessibilityLabel,
          container: true,
          child: Center(
            child: material.CircularProgressIndicator(
              color: theme.loadingIndicatorColor,
              strokeCap: StrokeCap.round,
              strokeAlign: BorderSide.strokeAlignCenter,
              strokeWidth: 6,
            ),
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: LoadingIndicator(accessibilityLabel: ""),
  );
}
