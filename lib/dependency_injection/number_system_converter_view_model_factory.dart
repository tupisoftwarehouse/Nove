import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/number_system_converter_data_store.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";

class NumberSystemConverterViewModelFactory {
  NumberSystemConverterViewModelFactory._();

  static NumberSystemConverterViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    try {
      final listOfNumberSystemsFromKeyValueDatabase =
          NumberSystemConverterDataStore.getListOfNumberSystems(
            keyValueDatabase,
          );
      final baseNumberSystemIndexFromKeyValueDatabase =
          NumberSystemConverterDataStore.getBaseNumberSystemIndex(
            keyValueDatabase,
          );

      final measureUnitConverter = MeasureUnitConverter<NumberSystem>(
        ZEROED_NUMBER_SYSTEM,
        listOfNumberSystemsFromKeyValueDatabase,
        baseNumberSystemIndexFromKeyValueDatabase,
      );

      final numberSystemConverter = NumberSystemConverter(measureUnitConverter);

      return NumberSystemConverterViewModel(
        numberSystemConverter,
        keyValueDatabase,
      );
    } catch (_) {
      final measureUnitConverter = MeasureUnitConverter<NumberSystem>(
        ZEROED_NUMBER_SYSTEM,
        [ZEROED_NUMBER_SYSTEM],
        0,
      );

      final numberSystemConverter = NumberSystemConverter(measureUnitConverter);

      return NumberSystemConverterViewModel(
        numberSystemConverter,
        keyValueDatabase,
      );
    }
  }
}
