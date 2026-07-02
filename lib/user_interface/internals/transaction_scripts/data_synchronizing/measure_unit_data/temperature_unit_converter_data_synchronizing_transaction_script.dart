import "package:flutter/foundation.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/temperature_unit_converter_data_store.dart";

class TemperatureUnitConverterDataSynchronizingTransactionScript {
  TemperatureUnitConverterDataSynchronizingTransactionScript._();

  static void synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex(
    TemperatureUnitConverter temperatureUnitConverter,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<List<TemperatureUnitEntity>> listOfTemperatureUnits,
    ValueNotifier<int> baseTemperatureUnitIndex,
  ) {
    TemperatureUnitConverterDataStore.setListOfTemperatureUnits(
      temperatureUnitConverter.listOfTemperatureUnits,
      keyValueDatabase,
    );
    TemperatureUnitConverterDataStore.setBaseTemperatureUnitIndex(
      temperatureUnitConverter.baseTemperatureUnitIndex,
      keyValueDatabase,
    );

    listOfTemperatureUnits.value = [
      ...temperatureUnitConverter.listOfTemperatureUnits,
    ];
    baseTemperatureUnitIndex.value =
        temperatureUnitConverter.baseTemperatureUnitIndex;
  }
}
