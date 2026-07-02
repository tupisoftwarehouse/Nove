import "package:flutter/foundation.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/speed_unit_converter_data_store.dart";

class SpeedUnitConverterDataSynchronizingTransactionScript {
  SpeedUnitConverterDataSynchronizingTransactionScript._();

  static void synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex(
    SpeedUnitConverter speedUnitConverter,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<List<SpeedUnitEntity>> listOfSpeedUnits,
    ValueNotifier<int> baseSpeedUnitIndex,
  ) {
    SpeedUnitConverterDataStore.setListOfSpeedUnits(
      speedUnitConverter.listOfSpeedUnits,
      keyValueDatabase,
    );
    SpeedUnitConverterDataStore.setBaseSpeedUnitIndex(
      speedUnitConverter.baseSpeedUnitIndex,
      keyValueDatabase,
    );

    listOfSpeedUnits.value = [...speedUnitConverter.listOfSpeedUnits];
    baseSpeedUnitIndex.value = speedUnitConverter.baseSpeedUnitIndex;
  }
}
