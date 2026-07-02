import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/length_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";

class LengthUnitConverterViewModelFactory {
  LengthUnitConverterViewModelFactory._();

  static LengthUnitConverterViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    try {
      final listOfLengthUnitsFromKeyValueDatabase =
          LengthUnitConverterDataStore.getListOfLengthUnits(keyValueDatabase);
      final baseLengthUnitIndexFromKeyValueDatabase =
          LengthUnitConverterDataStore.getBaseLengthUnitIndex(keyValueDatabase);

      final measureUnitConverter = MeasureUnitConverter<LengthUnit>(
        ZEROED_LENGTH_UNIT,
        listOfLengthUnitsFromKeyValueDatabase,
        baseLengthUnitIndexFromKeyValueDatabase,
      );

      final lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

      return LengthUnitConverterViewModel(
        lengthUnitConverter,
        keyValueDatabase,
      );
    } catch (_) {
      final measureUnitConverter = MeasureUnitConverter<LengthUnit>(
        ZEROED_LENGTH_UNIT,
        [ZEROED_LENGTH_UNIT],
        0,
      );

      final lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

      return LengthUnitConverterViewModel(
        lengthUnitConverter,
        keyValueDatabase,
      );
    }
  }
}
