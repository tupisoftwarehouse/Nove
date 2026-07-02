import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/speed_unit_converter_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/speed_unit_converter_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"SpeedUnitConverterDataSynchronizingTransactionScript\" Class", () {
    late SpeedUnitConverter speedUnitConverter;
    late MeasureUnitConverter<SpeedUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late ValueNotifier<List<SpeedUnitEntity>> listOfSpeedUnitsState;
    late ValueNotifier<int> baseSpeedUnitIndexState;

    setUpAll(() {
      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
        ZEROED_SPEED_UNIT,
        [SPEED_UNIT_TO_CONVERT_TO((_) {})],
        0,
      );

      speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

      listOfSpeedUnitsState = ValueNotifier([]);
      baseSpeedUnitIndexState = ValueNotifier(-1);
    });

    test(
      "Test If Method \"synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex\" Stores List And Base Index And Updates State",
      () {
        SpeedUnitConverterDataSynchronizingTransactionScript.synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex(
          speedUnitConverter,
          keyValueDatabase,
          listOfSpeedUnitsState,
          baseSpeedUnitIndexState,
        );

        final listOfSpeedUnitsFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getListOfSpeedUnits(keyValueDatabase);

        final baseSpeedUnitIndexFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getBaseSpeedUnitIndex(keyValueDatabase);

        expect(listOfSpeedUnitsState.value.length, 1);
        expect(listOfSpeedUnitsFromKeyValueDatabase.length, 1);

        expect(baseSpeedUnitIndexState.value, 0);
        expect(baseSpeedUnitIndexFromKeyValueDatabase, 0);

        expect(
          listOfSpeedUnitsState.value[0].measureUnit,
          listOfSpeedUnitsFromKeyValueDatabase[0].measureUnit,
        );
      },
    );
  });
}
