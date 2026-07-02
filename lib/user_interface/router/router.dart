import "package:flutter/widgets.dart" hide Navigator;
import "package:nove/dependency_injection/current_currency_values_factory.dart";
import "package:nove/user_interface/internals/adapters/navigator.dart";
import "package:nove/dependency_injection/area_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/body_mass_index_calculator_view_model_factory.dart";
import "package:nove/dependency_injection/currency_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/dependency_injection/length_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/mass_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/number_system_converter_view_model_factory.dart";
import "package:nove/dependency_injection/speed_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/temperature_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/text_information_parser_view_model_factory.dart";
import "package:nove/dependency_injection/time_aggregator_view_model_factory.dart";
import "package:nove/dependency_injection/time_calculator_view_model_factory.dart";
import "package:nove/dependency_injection/time_unit_converter_view_model_factory.dart";
import "package:nove/user_interface/screens/area_unit_converter_screen.dart";
import "package:nove/user_interface/screens/body_mass_index_calculator_screen.dart";
import "package:nove/user_interface/screens/currency_unit_converter_screen.dart";
import "package:nove/user_interface/screens/length_unit_converter_screen.dart";
import "package:nove/user_interface/screens/mass_unit_converter_screen.dart";
import "package:nove/user_interface/screens/number_system_converter_screen.dart";
import "package:nove/user_interface/screens/speed_unit_converter_screen.dart";
import "package:nove/user_interface/screens/temperature_unit_converter_screen.dart";
import "package:nove/user_interface/screens/text_information_parser_screen.dart";
import "package:nove/user_interface/screens/time_aggregator_screen.dart";
import "package:nove/user_interface/screens/time_calculator_screen.dart";
import "package:nove/user_interface/screens/time_unit_converter_screen.dart";

class Router {
  final Navigator _navigator;

  Router(this._navigator);

  void navigateToAreaUnitConverterScreen(BuildContext context) {
    final areaUnitConverterViewModel =
        AreaUnitConverterViewModelFactory.getInstance();
    final areaUnitConverterScreen = AreaUnitConverterScreen(
      areaUnitConverterViewModel: areaUnitConverterViewModel,
      router: this,
    );

    _navigator.navigate(context, areaUnitConverterScreen);
  }

  void navigateToBodyMassIndexCalculatorScreen(BuildContext context) {
    final bodyMassIndexCalculatorViewModel =
        BodyMassIndexCalculatorViewModelFactory.getInstance();
    final bodyMassIndexCalculatorScreen = BodyMassIndexCalculatorScreen(
      bodyMassIndexCalculatorViewModel: bodyMassIndexCalculatorViewModel,
      router: this,
    );

    _navigator.navigate(context, bodyMassIndexCalculatorScreen);
  }

  void navigateToCurrencyUnitConverterScreen(BuildContext context) async {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    final currencyUnitConverterScreen = CurrencyUnitConverterScreen(
      keyValueDatabase: keyValueDatabase,
      router: this,
      getCurrencyUnitConverterViewModel: () async {
        final currentCurrencyValues =
            await CurrentCurrencyValuesFactory.getInstance();

        return CurrencyUnitConverterViewModelFactory.getInstance(
          currentCurrencyValues,
        );
      },
    );

    _navigator.navigate(context, currencyUnitConverterScreen);
  }

  void navigateToLengthUnitConverterScreen(BuildContext context) {
    final lengthUnitConverterViewModel =
        LengthUnitConverterViewModelFactory.getInstance();
    final lengthUnitConverterScreen = LengthUnitConverterScreen(
      lengthUnitConverterViewModel: lengthUnitConverterViewModel,
      router: this,
    );

    _navigator.navigate(context, lengthUnitConverterScreen);
  }

  void navigateToMassUnitConverterScreen(BuildContext context) {
    final massUnitConverterViewModel =
        MassUnitConverterViewModelFactory.getInstance();
    final massUnitConverterScreen = MassUnitConverterScreen(
      massUnitConverterViewModel: massUnitConverterViewModel,
      router: this,
    );

    _navigator.navigate(context, massUnitConverterScreen);
  }

  void navigateToNumberSystemConverterScreen(BuildContext context) {
    final numberSystemConverterViewModel =
        NumberSystemConverterViewModelFactory.getInstance();
    final numberSystemConverterScreen = NumberSystemConverterScreen(
      numberSystemConverterViewModel: numberSystemConverterViewModel,
      router: this,
    );

    _navigator.navigate(context, numberSystemConverterScreen);
  }

  void navigateToSpeedUnitConverterScreen(BuildContext context) {
    final speedUnitConverterViewModel =
        SpeedUnitConverterViewModelFactory.getInstance();
    final speedUnitConverterScreen = SpeedUnitConverterScreen(
      speedUnitConverterViewModel: speedUnitConverterViewModel,
      router: this,
    );

    _navigator.navigate(context, speedUnitConverterScreen);
  }

  void navigateToTemperatureUnitConverterScreen(BuildContext context) {
    final temperatureUnitConverterViewModel =
        TemperatureUnitConverterViewModelFactory.getInstance();
    final temperatureUnitConverterScreen = TemperatureUnitConverterScreen(
      temperatureUnitConverterViewModel: temperatureUnitConverterViewModel,
      router: this,
    );

    _navigator.navigate(context, temperatureUnitConverterScreen);
  }

  void navigateToTextInformationParserScreen(BuildContext context) {
    final textInformationParserViewModel =
        TextInformationParserViewModelFactory.getInstance();
    final textInformationParserScreen = TextInformationParserScreen(
      textInformationParserViewModel: textInformationParserViewModel,
      router: this,
    );

    _navigator.navigate(context, textInformationParserScreen);
  }

  void navigateToTimeAggregatorScreen(BuildContext context) {
    final timeAggregatorViewModel =
        TimeAggregatorViewModelFactory.getInstance();
    final timeAggregatorScreen = TimeAggregatorScreen(
      timeAggregatorViewModel: timeAggregatorViewModel,
      router: this,
    );

    _navigator.navigate(context, timeAggregatorScreen);
  }

  void navigateToTimeCalculatorScreen(BuildContext context) {
    final timeCalculatorViewModel =
        TimeCalculatorViewModelFactory.getInstance();
    final timeCalculatorScreen = TimeCalculatorScreen(
      timeCalculatorViewModel: timeCalculatorViewModel,
      router: this,
    );

    _navigator.navigate(context, timeCalculatorScreen);
  }

  void navigateToTimeUnitConverterScreen(BuildContext context) {
    final timeUnitConverterViewModel =
        TimeUnitConverterViewModelFactory.getInstance();
    final timeUnitConverterScreen = TimeUnitConverterScreen(
      timeUnitConverterViewModel: timeUnitConverterViewModel,
      router: this,
    );

    _navigator.navigate(context, timeUnitConverterScreen);
  }

  void navigateBack(BuildContext context) {
    _navigator.navigateBack(context);
  }
}
