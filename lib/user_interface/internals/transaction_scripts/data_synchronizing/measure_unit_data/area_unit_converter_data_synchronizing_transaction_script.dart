import "package:flutter/foundation.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/area_unit_converter_data_store.dart";

class AreaUnitConverterDataSynchronizingTransactionScript {
  AreaUnitConverterDataSynchronizingTransactionScript._();

  static void synchronizeListOfAreaUnitsAndBaseAreaUnitIndex(
    AreaUnitConverter areaUnitConverter,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<List<AreaUnitEntity>> listOfAreaUnits,
    ValueNotifier<int> baseAreaUnitIndex,
  ) {
    AreaUnitConverterDataStore.setListOfAreaUnits(
      areaUnitConverter.listOfAreaUnits,
      keyValueDatabase,
    );
    AreaUnitConverterDataStore.setBaseAreaUnitIndex(
      areaUnitConverter.baseAreaUnitIndex,
      keyValueDatabase,
    );

    listOfAreaUnits.value = [...areaUnitConverter.listOfAreaUnits];
    baseAreaUnitIndex.value = areaUnitConverter.baseAreaUnitIndex;
  }
}
