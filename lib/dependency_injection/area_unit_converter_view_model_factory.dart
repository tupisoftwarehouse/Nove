import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/area_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";

class AreaUnitConverterViewModelFactory {
  AreaUnitConverterViewModelFactory._();

  static AreaUnitConverterViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    try {
      final listOfAreaUnitsFromKeyValueDatabase =
          AreaUnitConverterDataStore.getListOfAreaUnits(keyValueDatabase);
      final baseAreaUnitIndexFromKeyValueDatabase =
          AreaUnitConverterDataStore.getBaseAreaUnitIndex(keyValueDatabase);
      final measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        ZEROED_AREA_UNIT,
        listOfAreaUnitsFromKeyValueDatabase,
        baseAreaUnitIndexFromKeyValueDatabase,
      );
      final areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      return AreaUnitConverterViewModel(areaUnitConverter, keyValueDatabase);
    } catch (_) {
      final measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        ZEROED_AREA_UNIT,
        [ZEROED_AREA_UNIT],
        0,
      );
      final areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      return AreaUnitConverterViewModel(areaUnitConverter, keyValueDatabase);
    }
  }
}
