import "package:flutter/widgets.dart" hide Router;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/page_content_wrapper.dart";
import "package:nove/user_interface/widgets/utility_banner.dart";

class SmallScreenUtilityBannerDecks extends StatelessWidget {
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final Router router;

  const SmallScreenUtilityBannerDecks({
    super.key,
    required this.deviceLanguageStringsViewModel,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return PageContentWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ValueListenableBuilder(
          valueListenable: deviceLanguageStringsViewModel.deviceLanguageStrings,
          builder: (_, deviceLanguageStrings, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  UtilityBanner(
                    icon: Symbols.activity_zone_rounded,
                    title:
                        deviceLanguageStrings.AREA_UNIT_CONVERTER_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .AREA_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToAreaUnitConverterScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.body_fat_rounded,
                    title: deviceLanguageStrings
                        .BODY_MASS_INDEX_CALCULATOR_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .BODY_MASS_INDEX_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToBodyMassIndexCalculatorScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.attach_money_rounded,
                    title: deviceLanguageStrings
                        .CURRENCY_UNIT_CONVERTER_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .CURRENCY_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToCurrencyUnitConverterScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.straighten_rounded,
                    title: deviceLanguageStrings
                        .LENGTH_UNIT_CONVERTER_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .LENGTH_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToLengthUnitConverterScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.scale_rounded,
                    title:
                        deviceLanguageStrings.MASS_UNIT_CONVERTER_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .MASS_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToMassUnitConverterScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.numbers_rounded,
                    title: deviceLanguageStrings
                        .NUMBER_SYSTEM_CONVERTER_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .NUMBER_SYSTEM_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToNumberSystemConverterScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.rocket_rounded,
                    title:
                        deviceLanguageStrings.SPEED_UNIT_CONVERTER_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .SPEED_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToSpeedUnitConverterScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.ac_unit_rounded,
                    title: deviceLanguageStrings
                        .TEMPERATURE_UNIT_CONVERTER_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .TEMPERATURE_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToTemperatureUnitConverterScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.text_fields_rounded,
                    title: deviceLanguageStrings
                        .TEXT_INFORMATION_PARSER_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .TEXT_INFORMATION_PARSER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToTextInformationParserScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.more_time_rounded,
                    title: deviceLanguageStrings.TIME_AGGREGATOR_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .TIME_AGGREGATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToTimeAggregatorScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.watch_rounded,
                    title: deviceLanguageStrings.TIME_CALCULATOR_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .TIME_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToTimeCalculatorScreen(context);
                    },
                  ),
                  const SizedBox(height: 13),
                  UtilityBanner(
                    icon: Symbols.avg_pace_rounded,
                    title:
                        deviceLanguageStrings.TIME_UNIT_CONVERTER_UTILITY_NAME,
                    accessibilityLabel: deviceLanguageStrings
                        .TIME_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
                    onTap: () {
                      router.navigateToTimeUnitConverterScreen(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
