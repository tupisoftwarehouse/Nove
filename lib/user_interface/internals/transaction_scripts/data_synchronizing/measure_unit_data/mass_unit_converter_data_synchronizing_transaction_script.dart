import "package:flutter/foundation.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/mass_unit_converter_data_store.dart";

class MassUnitConverterDataSynchronizingTransactionScript {
  MassUnitConverterDataSynchronizingTransactionScript._();

  static void synchronizeListOfMassUnitsAndBaseMassUnitIndex(
    MassUnitConverter massUnitConverter,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<List<MassUnitEntity>> listOfMassUnits,
    ValueNotifier<int> baseMassUnitIndex,
  ) {
    MassUnitConverterDataStore.setListOfMassUnits(
      massUnitConverter.listOfMassUnits,
      keyValueDatabase,
    );
    MassUnitConverterDataStore.setBaseMassUnitIndex(
      massUnitConverter.baseMassUnitIndex,
      keyValueDatabase,
    );

    listOfMassUnits.value = [...massUnitConverter.listOfMassUnits];
    baseMassUnitIndex.value = massUnitConverter.baseMassUnitIndex;
  }
}
