import "package:flutter/widgets.dart" hide Router;
import "package:nove/user_interface/compositions/large_screen_utility_banner_decks.dart";
import "package:nove/user_interface/compositions/medium_screen_utility_banner_decks.dart";
import "package:nove/user_interface/compositions/small_screen_utility_banner_decks.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class UtilityBannerDeckSections extends StatelessWidget {
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final Router router;

  const UtilityBannerDeckSections({
    super.key,
    required this.deviceLanguageStringsViewModel,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    final applicationWindowSize = MediaQuery.of(context).size;

    if (isUtilityBannerDeckLarge(applicationWindowSize.width)) {
      return LargeScreenUtilityBannerDecks(
        deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
        router: router,
      );
    } else if (isUtilityBannerDeckMedium(applicationWindowSize.width)) {
      return MediumScreenUtilityBannerDecks(
        deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
        router: router,
      );
    } else {
      return SmallScreenUtilityBannerDecks(
        deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
        router: router,
      );
    }
  }
}
