import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter/widget_previews.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class TextArea extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const TextArea({
    super.key,
    required this.placeholder,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<TextArea> createState() {
    return _TextAreaState();
  }
}

class _TextAreaState extends State<TextArea> {
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
      builder: (context, theme, _) {
        return material.Material(
          color: TRANSPARENT,
          child: material.Theme(
            data: material.Theme.of(context).copyWith(
              textSelectionTheme: material.TextSelectionThemeData(
                selectionColor: theme.textEmphasis9Color.withValues(alpha: 0.3),
                selectionHandleColor: theme.textEmphasis9Color,
                cursorColor: theme.textEmphasis9Color,
              ),
            ),
            child: material.TextField(
              controller: widget.controller,
              decoration: material.InputDecoration(
                hintText: widget.placeholder,
                contentPadding: const material.EdgeInsets.all(16),
                border: material.InputBorder.none,
                hintStyle: PARAGRAPH_16_REGULAR(theme.textEmphasis6Color),
              ),
              style: PARAGRAPH_16_REGULAR(theme.textEmphasis9Color),
              keyboardType: material.TextInputType.multiline,
              maxLines: null,
              cursorColor: theme.textEmphasis9Color,
              focusNode: widget.focusNode,
              onTapOutside: (_) {
                widget.focusNode.unfocus();
              },
              onChanged: widget.onChanged,
            ),
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return TextArea(
    placeholder: "Type some text here",
    controller: TextEditingController(),
    focusNode: FocusNode(),
    onChanged: (_) {},
  );
}
