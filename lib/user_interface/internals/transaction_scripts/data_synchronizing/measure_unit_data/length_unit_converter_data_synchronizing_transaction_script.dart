import "package:flutter/foundation.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/length_unit_converter_data_store.dart";

class LengthUnitConverterDataSynchronizingTransactionScript {
  LengthUnitConverterDataSynchronizingTransactionScript._();

  static void synchronizeListOfLengthUnitsAndBaseLengthUnitIndex(
    LengthUnitConverter lengthUnitConverter,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<List<LengthUnitEntity>> listOfLengthUnits,
    ValueNotifier<int> baseLengthUnitIndex,
  ) {
    LengthUnitConverterDataStore.setListOfLengthUnits(
      lengthUnitConverter.listOfLengthUnits,
      keyValueDatabase,
    );
    LengthUnitConverterDataStore.setBaseLengthUnitIndex(
      lengthUnitConverter.baseLengthUnitIndex,
      keyValueDatabase,
    );

    listOfLengthUnits.value = [...lengthUnitConverter.listOfLengthUnits];
    baseLengthUnitIndex.value = lengthUnitConverter.baseLengthUnitIndex;
  }
}
