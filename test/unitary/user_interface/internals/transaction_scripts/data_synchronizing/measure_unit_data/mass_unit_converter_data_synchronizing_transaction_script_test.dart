import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/mass_unit_converter_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/mass_unit_converter_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"MassUnitConverterDataSynchronizingTransactionScript\" Class", () {
    late MassUnitConverter massUnitConverter;
    late MeasureUnitConverter<MassUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late ValueNotifier<List<MassUnitEntity>> listOfMassUnitsState;
    late ValueNotifier<int> baseMassUnitIndexState;

    setUpAll(() {
      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<MassUnit>(ZEROED_MASS_UNIT, [
        MASS_UNIT_TO_CONVERT_TO((_) {}),
      ], 0);

      massUnitConverter = MassUnitConverter(measureUnitConverter);

      listOfMassUnitsState = ValueNotifier([]);
      baseMassUnitIndexState = ValueNotifier(-1);
    });

    test(
      "Test If Method \"synchronizeListOfMassUnitsAndBaseMassUnitIndex\" Stores List And Base Index And Updates State",
      () {
        MassUnitConverterDataSynchronizingTransactionScript.synchronizeListOfMassUnitsAndBaseMassUnitIndex(
          massUnitConverter,
          keyValueDatabase,
          listOfMassUnitsState,
          baseMassUnitIndexState,
        );

        final listOfMassUnitsFromKeyValueDatabase =
            MassUnitConverterDataStore.getListOfMassUnits(keyValueDatabase);

        final baseMassUnitIndexFromKeyValueDatabase =
            MassUnitConverterDataStore.getBaseMassUnitIndex(keyValueDatabase);

        expect(listOfMassUnitsState.value.length, 1);
        expect(listOfMassUnitsFromKeyValueDatabase.length, 1);

        expect(baseMassUnitIndexState.value, 0);
        expect(baseMassUnitIndexFromKeyValueDatabase, 0);

        expect(
          listOfMassUnitsState.value[0].measureUnit,
          listOfMassUnitsFromKeyValueDatabase[0].measureUnit,
        );
      },
    );
  });
}
