import "package:flutter/widgets.dart" hide Router;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/widgets/scaffold.dart";

class CurrentCurrencyValuesFetchRetryingSection extends StatelessWidget {
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final Router router;
  final VoidCallback onTap;

  const CurrentCurrencyValuesFetchRetryingSection({
    super.key,
    required this.deviceLanguageStringsViewModel,
    required this.router,
    required this.onTap,
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
          body: Center(
            child: ActionButton(
              icon: Symbols.refresh_rounded,
              tooltipMessage: deviceLanguageStrings
                  .CURRENT_CURRENCY_VALUES_RETRY_BUTTON_TOOLTIP_MESSAGE,
              accessibilityLabel: deviceLanguageStrings
                  .CURRENT_CURRENCY_VALUES_RETRY_BUTTON_ACCESSIBILITY_LABEL,
              onTap: onTap,
            ),
          ),
        );
      },
    );
  }
}
