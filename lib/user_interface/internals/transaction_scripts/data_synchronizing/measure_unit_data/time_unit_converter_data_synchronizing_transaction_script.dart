import "package:flutter/foundation.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_unit_converter_data_store.dart";

class TimeUnitConverterDataSynchronizingTransactionScript {
  TimeUnitConverterDataSynchronizingTransactionScript._();

  static void synchronizeListOfTimeUnitsAndBaseTimeUnitIndex(
    TimeUnitConverter timeUnitConverter,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<List<TimeUnitEntity>> listOfTimeUnits,
    ValueNotifier<int> baseTimeUnitIndex,
  ) {
    TimeUnitConverterDataStore.setListOfTimeUnits(
      timeUnitConverter.listOfTimeUnits,
      keyValueDatabase,
    );
    TimeUnitConverterDataStore.setBaseTimeUnitIndex(
      timeUnitConverter.baseTimeUnitIndex,
      keyValueDatabase,
    );

    listOfTimeUnits.value = [...timeUnitConverter.listOfTimeUnits];
    baseTimeUnitIndex.value = timeUnitConverter.baseTimeUnitIndex;
  }
}
