import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/temperature_unit_converter_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/temperature_unit_converter_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group(
    "Test \"TemperatureUnitConverterDataSynchronizingTransactionScript\" Class",
    () {
      late TemperatureUnitConverter temperatureUnitConverter;
      late MeasureUnitConverter<TemperatureUnit> measureUnitConverter;
      late AbstractKeyValueDatabase keyValueDatabase;
      late ValueNotifier<List<TemperatureUnitEntity>>
      listOfTemperatureUnitsState;
      late ValueNotifier<int> baseTemperatureUnitIndexState;

      setUpAll(() {
        keyValueDatabase = KeyValueDatabaseMock();

        measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
          ZEROED_TEMPERATURE_UNIT,
          [TEMPERATURE_UNIT_TO_CONVERT_TO((_) {})],
          0,
        );

        temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );

        listOfTemperatureUnitsState = ValueNotifier([]);
        baseTemperatureUnitIndexState = ValueNotifier(-1);
      });

      test(
        "Test If Method \"synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex\" Stores List And Base Index And Updates State",
        () {
          TemperatureUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex(
            temperatureUnitConverter,
            keyValueDatabase,
            listOfTemperatureUnitsState,
            baseTemperatureUnitIndexState,
          );

          final listOfTemperatureUnitsFromKeyValueDatabase =
              TemperatureUnitConverterDataStore.getListOfTemperatureUnits(
                keyValueDatabase,
              );

          final baseTemperatureUnitIndexFromKeyValueDatabase =
              TemperatureUnitConverterDataStore.getBaseTemperatureUnitIndex(
                keyValueDatabase,
              );

          expect(listOfTemperatureUnitsState.value.length, 1);
          expect(listOfTemperatureUnitsFromKeyValueDatabase.length, 1);

          expect(baseTemperatureUnitIndexState.value, 0);
          expect(baseTemperatureUnitIndexFromKeyValueDatabase, 0);

          expect(
            listOfTemperatureUnitsState.value[0].measureUnit,
            listOfTemperatureUnitsFromKeyValueDatabase[0].measureUnit,
          );
        },
      );
    },
  );
}
