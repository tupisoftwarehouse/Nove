import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter/widget_previews.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class Input extends StatefulWidget {
  final bool isCentralized;
  final String hintText;
  final TextInputType type;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const Input({
    super.key,
    this.isCentralized = false,
    required this.type,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<Input> createState() {
    return _InputState();
  }
}

class _InputState extends State<Input> {
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
        return material.Material(
          color: TRANSPARENT,
          child: material.Theme(
            data: material.Theme.of(context).copyWith(
              textSelectionTheme: material.TextSelectionThemeData(
                selectionColor: theme.input.color.withValues(alpha: 0.3),
                selectionHandleColor: theme.input.color,
              ),
            ),
            child: SizedBox(
              height: 56,
              child: material.TextField(
                controller: widget.controller,
                decoration: material.InputDecoration(
                  hintText: widget.hintText,
                  contentPadding: const material.EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 26,
                  ),
                  border: material.OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: material.BorderSide.none,
                    gapPadding: 0,
                  ),
                  filled: true,
                  hoverColor: theme.input.backgroundColor,
                  focusColor: theme.input.backgroundColor,
                  fillColor: theme.input.backgroundColor,
                  hintStyle: HEADING_4(theme.input.placeholderColor),
                ),
                style: HEADING_4(theme.input.color),
                textAlignVertical: TextAlignVertical.center,
                textAlign: widget.isCentralized
                    ? TextAlign.center
                    : TextAlign.start,
                keyboardType: TextInputType.number,
                cursorColor: theme.input.color,
                focusNode: widget.focusNode,
                onTapOutside: (_) {
                  widget.focusNode.nextFocus();

                  widget.focusNode.unfocus();
                },
                onChanged: widget.onChanged,
              ),
            ),
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return Input(
    hintText: "Enter an age",
    type: TextInputType.number,
    controller: TextEditingController(),
    focusNode: FocusNode(),
    onChanged: (_) {},
  );
}
