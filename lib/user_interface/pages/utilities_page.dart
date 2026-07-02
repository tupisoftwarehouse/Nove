import "package:flutter/widgets.dart" hide Router;
import "package:nove/user_interface/compositions/end_screen_padding.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/sections/utility_banner_deck_sections.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class UtilitiesPage extends StatefulWidget {
  final Router router;

  const UtilitiesPage({super.key, required this.router});

  @override
  State<UtilitiesPage> createState() {
    return _UtilitiesPageState();
  }
}

class _UtilitiesPageState extends State<UtilitiesPage>
    with AutomaticKeepAliveClientMixin {
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
  bool get wantKeepAlive {
    return true;
  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ValueListenableBuilder(
      valueListenable: _themeViewModel.theme,
      builder: (_, theme, _) {
        return Container(
          decoration: BoxDecoration(color: theme.surface.backgroundColor),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 96),
                  UtilityBannerDeckSections(
                    deviceLanguageStringsViewModel:
                        _deviceLanguageStringsViewModel,
                    router: widget.router,
                  ),
                  const EndScreenPadding(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
