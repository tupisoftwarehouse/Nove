import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/number_system_converter_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/number_system_converter_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group(
    "Test \"NumberSystemConverterDataSynchronizingTransactionScript\" Class",
    () {
      late NumberSystemConverter numberSystemConverter;
      late MeasureUnitConverter<NumberSystem> measureUnitConverter;
      late AbstractKeyValueDatabase keyValueDatabase;
      late ValueNotifier<List<NumberSystemEntity>> listOfNumberSystemsState;
      late ValueNotifier<int> baseNumberSystemIndexState;

      setUpAll(() {
        keyValueDatabase = KeyValueDatabaseMock();

        measureUnitConverter = MeasureUnitConverter<NumberSystem>(
          ZEROED_NUMBER_SYSTEM,
          [NUMBER_SYSTEM_TO_CONVERT_TO((_) {})],
          0,
        );

        numberSystemConverter = NumberSystemConverter(measureUnitConverter);

        listOfNumberSystemsState = ValueNotifier([]);
        baseNumberSystemIndexState = ValueNotifier(-1);
      });

      test(
        "Test If Method \"synchronizeListOfNumberSystemsAndBaseNumberSystemIndex\" Stores List And Base Index And Updates State",
        () {
          NumberSystemConverterDataSynchronizingTransactionScript.synchronizeListOfNumberSystemsAndBaseNumberSystemIndex(
            numberSystemConverter,
            keyValueDatabase,
            listOfNumberSystemsState,
            baseNumberSystemIndexState,
          );

          final listOfNumberSystemsFromKeyValueDatabase =
              NumberSystemConverterDataStore.getListOfNumberSystems(
                keyValueDatabase,
              );

          final baseNumberSystemIndexFromKeyValueDatabase =
              NumberSystemConverterDataStore.getBaseNumberSystemIndex(
                keyValueDatabase,
              );

          expect(listOfNumberSystemsState.value.length, 1);
          expect(listOfNumberSystemsFromKeyValueDatabase.length, 1);

          expect(baseNumberSystemIndexState.value, 0);
          expect(baseNumberSystemIndexFromKeyValueDatabase, 0);

          expect(
            listOfNumberSystemsState.value[0].measureUnit,
            listOfNumberSystemsFromKeyValueDatabase[0].measureUnit,
          );
        },
      );
    },
  );
}
