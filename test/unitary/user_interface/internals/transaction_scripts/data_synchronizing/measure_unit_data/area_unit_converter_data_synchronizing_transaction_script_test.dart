import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/area_unit_converter_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/area_unit_converter_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"AreaUnitConverterDataSynchronizingTransactionScript\" Class", () {
    late AreaUnitConverter areaUnitConverter;
    late MeasureUnitConverter<AreaUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late ValueNotifier<List<AreaUnitEntity>> listOfAreaUnitsState;
    late ValueNotifier<int> baseAreaUnitIndexState;

    setUpAll(() {
      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<AreaUnit>(ZEROED_AREA_UNIT, [
        AREA_UNIT_TO_CONVERT_TO((_) {}),
      ], 0);

      areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      listOfAreaUnitsState = ValueNotifier([]);
      baseAreaUnitIndexState = ValueNotifier(-1);
    });

    test(
      "Test If Method \"synchronizeListOfAreaUnitsAndBaseAreaUnitIndex\" Stores List And Base Index And Updates State",
      () {
        AreaUnitConverterDataSynchronizingTransactionScript.synchronizeListOfAreaUnitsAndBaseAreaUnitIndex(
          areaUnitConverter,
          keyValueDatabase,
          listOfAreaUnitsState,
          baseAreaUnitIndexState,
        );

        final listOfAreaUnitsFromKeyValueDatabase =
            AreaUnitConverterDataStore.getListOfAreaUnits(keyValueDatabase);

        final baseAreaUnitIndexFromKeyValueDatabase =
            AreaUnitConverterDataStore.getBaseAreaUnitIndex(keyValueDatabase);

        expect(listOfAreaUnitsState.value.length, 1);
        expect(listOfAreaUnitsFromKeyValueDatabase.length, 1);

        expect(baseAreaUnitIndexState.value, 0);
        expect(baseAreaUnitIndexFromKeyValueDatabase, 0);

        expect(
          listOfAreaUnitsState.value[0].measureUnit,
          listOfAreaUnitsFromKeyValueDatabase[0].measureUnit,
        );
      },
    );
  });
}
