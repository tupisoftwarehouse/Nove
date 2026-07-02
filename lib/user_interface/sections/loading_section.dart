import "package:flutter/widgets.dart" hide Router;
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/loading_indicator.dart";
import "package:nove/user_interface/widgets/scaffold.dart";

class LoadingSection extends StatelessWidget {
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final Router router;

  const LoadingSection({
    super.key,
    required this.deviceLanguageStringsViewModel,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: deviceLanguageStringsViewModel.deviceLanguageStrings,
      builder: (_, deviceLanguageStrings, _) {
        return Scaffold(
          onBackButtonTap: () {
            router.navigateBack(context);
          },
          body: LoadingIndicator(
            accessibilityLabel:
                deviceLanguageStrings.LOADING_INDICATOR_ACCESSIBILITY_LABEL,
          ),
        );
      },
    );
  }
}
