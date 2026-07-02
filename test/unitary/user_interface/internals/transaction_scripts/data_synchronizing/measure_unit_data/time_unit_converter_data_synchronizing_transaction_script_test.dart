import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_unit_converter_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/time_unit_converter_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeUnitConverterDataSynchronizingTransactionScript\" Class", () {
    late TimeUnitConverter timeUnitConverter;
    late MeasureUnitConverter<TimeUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late ValueNotifier<List<TimeUnitEntity>> listOfTimeUnitsState;
    late ValueNotifier<int> baseTimeUnitIndexState;

    setUpAll(() {
      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<TimeUnit>(ZEROED_TIME_UNIT, [
        TIME_UNIT_TO_CONVERT_TO((_) {}),
      ], 0);

      timeUnitConverter = TimeUnitConverter(measureUnitConverter);

      listOfTimeUnitsState = ValueNotifier([]);
      baseTimeUnitIndexState = ValueNotifier(-1);
    });

    test(
      "Test If Method \"synchronizeListOfTimeUnitsAndBaseTimeUnitIndex\" Stores List And Base Index And Updates State",
      () {
        TimeUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTimeUnitsAndBaseTimeUnitIndex(
          timeUnitConverter,
          keyValueDatabase,
          listOfTimeUnitsState,
          baseTimeUnitIndexState,
        );

        final listOfTimeUnitsFromKeyValueDatabase =
            TimeUnitConverterDataStore.getListOfTimeUnits(keyValueDatabase);

        final baseTimeUnitIndexFromKeyValueDatabase =
            TimeUnitConverterDataStore.getBaseTimeUnitIndex(keyValueDatabase);

        expect(listOfTimeUnitsState.value.length, 1);
        expect(listOfTimeUnitsFromKeyValueDatabase.length, 1);

        expect(baseTimeUnitIndexState.value, 0);
        expect(baseTimeUnitIndexFromKeyValueDatabase, 0);

        expect(
          listOfTimeUnitsState.value[0].measureUnit,
          listOfTimeUnitsFromKeyValueDatabase[0].measureUnit,
        );
      },
    );
  });
}
