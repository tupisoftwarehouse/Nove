import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/temperature_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";

class TemperatureUnitConverterViewModelFactory {
  TemperatureUnitConverterViewModelFactory._();

  static TemperatureUnitConverterViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    try {
      final listOfTemperatureUnitsFromKeyValueDatabase =
          TemperatureUnitConverterDataStore.getListOfTemperatureUnits(
            keyValueDatabase,
          );
      final baseTemperatureUnitIndexFromKeyValueDatabase =
          TemperatureUnitConverterDataStore.getBaseTemperatureUnitIndex(
            keyValueDatabase,
          );

      final measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
        ZEROED_TEMPERATURE_UNIT,
        listOfTemperatureUnitsFromKeyValueDatabase,
        baseTemperatureUnitIndexFromKeyValueDatabase,
      );

      final temperatureUnitConverter = TemperatureUnitConverter(
        measureUnitConverter,
      );

      return TemperatureUnitConverterViewModel(
        temperatureUnitConverter,
        keyValueDatabase,
      );
    } catch (_) {
      final measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
        ZEROED_TEMPERATURE_UNIT,
        [ZEROED_TEMPERATURE_UNIT],
        0,
      );

      final temperatureUnitConverter = TemperatureUnitConverter(
        measureUnitConverter,
      );

      return TemperatureUnitConverterViewModel(
        temperatureUnitConverter,
        keyValueDatabase,
      );
    }
  }
}
