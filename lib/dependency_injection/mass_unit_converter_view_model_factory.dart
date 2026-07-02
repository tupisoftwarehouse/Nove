import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/mass_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";

class MassUnitConverterViewModelFactory {
  MassUnitConverterViewModelFactory._();

  static MassUnitConverterViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    try {
      final listOfMassUnitsFromKeyValueDatabase =
          MassUnitConverterDataStore.getListOfMassUnits(keyValueDatabase);
      final baseMassUnitIndexFromKeyValueDatabase =
          MassUnitConverterDataStore.getBaseMassUnitIndex(keyValueDatabase);

      final measureUnitConverter = MeasureUnitConverter<MassUnit>(
        ZEROED_MASS_UNIT,
        listOfMassUnitsFromKeyValueDatabase,
        baseMassUnitIndexFromKeyValueDatabase,
      );

      final massUnitConverter = MassUnitConverter(measureUnitConverter);

      return MassUnitConverterViewModel(massUnitConverter, keyValueDatabase);
    } catch (_) {
      final measureUnitConverter = MeasureUnitConverter<MassUnit>(
        ZEROED_MASS_UNIT,
        [ZEROED_MASS_UNIT],
        0,
      );

      final massUnitConverter = MassUnitConverter(measureUnitConverter);

      return MassUnitConverterViewModel(massUnitConverter, keyValueDatabase);
    }
  }
}
