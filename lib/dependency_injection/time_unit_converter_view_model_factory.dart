import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/time_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/time_unit_converter_view_model.dart";

class TimeUnitConverterViewModelFactory {
  TimeUnitConverterViewModelFactory._();

  static TimeUnitConverterViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    try {
      final listOfTimeUnitsFromKeyValueDatabase =
          TimeUnitConverterDataStore.getListOfTimeUnits(keyValueDatabase);
      final baseTimeUnitIndexFromKeyValueDatabase =
          TimeUnitConverterDataStore.getBaseTimeUnitIndex(keyValueDatabase);

      final measureUnitConverter = MeasureUnitConverter<TimeUnit>(
        ZEROED_TIME_UNIT,
        listOfTimeUnitsFromKeyValueDatabase,
        baseTimeUnitIndexFromKeyValueDatabase,
      );

      final timeUnitConverter = TimeUnitConverter(measureUnitConverter);

      return TimeUnitConverterViewModel(timeUnitConverter, keyValueDatabase);
    } catch (_) {
      final measureUnitConverter = MeasureUnitConverter<TimeUnit>(
        ZEROED_TIME_UNIT,
        [ZEROED_TIME_UNIT],
        0,
      );

      final timeUnitConverter = TimeUnitConverter(measureUnitConverter);

      return TimeUnitConverterViewModel(timeUnitConverter, keyValueDatabase);
    }
  }
}
