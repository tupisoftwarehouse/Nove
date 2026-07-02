import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/concerns/preview_content_wrapper.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";

class Scaffold extends StatefulWidget {
  final VoidCallback onBackButtonTap;
  final List<Widget> actionButtons;
  final Widget body;

  const Scaffold({
    super.key,
    required this.onBackButtonTap,
    this.actionButtons = const [],
    required this.body,
  });

  @override
  State<StatefulWidget> createState() {
    return _ScaffoldState();
  }
}

class _ScaffoldState extends State<Scaffold> {
  late final ThemeViewModel _themeViewModel;
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();

    _deviceLanguageStringsViewModel =
        DeviceLanguageStringsViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final applicationWindowSize = MediaQuery.of(context).size;

    return ValueListenableBuilder(
      valueListenable: _deviceLanguageStringsViewModel.deviceLanguageStrings,
      builder: (_, deviceLanguageStrings, _) {
        return ValueListenableBuilder(
          valueListenable: _themeViewModel.theme,
          builder: (_, theme, _) {
            return Container(
              height: applicationWindowSize.height,
              width: applicationWindowSize.width,
              decoration: BoxDecoration(color: theme.surface.backgroundColor),
              child: SafeArea(
                child: Center(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 1280),
                    child: Stack(
                      children: [
                        widget.body,
                        Positioned(
                          top: 16,
                          left: 16,
                          right: 16,
                          height: 64,
                          child: Row(
                            children: [
                              ActionButton(
                                icon: Symbols.arrow_back_ios_new_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .BACK_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .BACK_BUTTON_ACCESSIBILITY_LABEL,
                                isHapticFeedbackEnabled: false,
                                onTap: widget.onBackButtonTap,
                              ),
                              const Spacer(),
                              ...widget.actionButtons,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return PreviewContentWrapper(
    child: Scaffold(
      onBackButtonTap: () {},
      actionButtons: [
        ActionButton(
          icon: Symbols.history_2,
          tooltipMessage: "Reset changes",
          accessibilityLabel: "",
          onTap: () {},
        ),
      ],
      body: Container(),
    ),
  );
}
