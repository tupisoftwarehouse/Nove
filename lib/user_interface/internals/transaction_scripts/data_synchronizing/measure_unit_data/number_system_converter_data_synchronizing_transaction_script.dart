import "package:flutter/foundation.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/number_system_converter_data_store.dart";

class NumberSystemConverterDataSynchronizingTransactionScript {
  NumberSystemConverterDataSynchronizingTransactionScript._();

  static void synchronizeListOfNumberSystemsAndBaseNumberSystemIndex(
    NumberSystemConverter numberSystemConverter,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<List<NumberSystemEntity>> listOfNumberSystems,
    ValueNotifier<int> baseNumberSystemIndex,
  ) {
    NumberSystemConverterDataStore.setListOfNumberSystems(
      numberSystemConverter.listOfNumberSystems,
      keyValueDatabase,
    );
    NumberSystemConverterDataStore.setBaseNumberSystemIndex(
      numberSystemConverter.baseNumberSystemIndex,
      keyValueDatabase,
    );

    listOfNumberSystems.value = [...numberSystemConverter.listOfNumberSystems];
    baseNumberSystemIndex.value = numberSystemConverter.baseNumberSystemIndex;
  }
}
