import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/speed_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";

class SpeedUnitConverterViewModelFactory {
  SpeedUnitConverterViewModelFactory._();

  static SpeedUnitConverterViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    try {
      final listOfSpeedUnitsFromKeyValueDatabase =
          SpeedUnitConverterDataStore.getListOfSpeedUnits(keyValueDatabase);
      final baseSpeedUnitIndexFromKeyValueDatabase =
          SpeedUnitConverterDataStore.getBaseSpeedUnitIndex(keyValueDatabase);

      final measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
        ZEROED_SPEED_UNIT,
        listOfSpeedUnitsFromKeyValueDatabase,
        baseSpeedUnitIndexFromKeyValueDatabase,
      );

      final speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

      return SpeedUnitConverterViewModel(speedUnitConverter, keyValueDatabase);
    } catch (_) {
      final measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
        ZEROED_SPEED_UNIT,
        [ZEROED_SPEED_UNIT],
        0,
      );

      final speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

      return SpeedUnitConverterViewModel(speedUnitConverter, keyValueDatabase);
    }
  }
}
