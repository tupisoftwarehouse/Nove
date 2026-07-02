import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/temperature_unit_converter_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TemperatureUnitConverterDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfTemperatureUnits\" Returns List Of Temperature Units From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_TEMPERATURE_UNITS_KEY, () {
          return TemperatureUnitEntity.marshalledListData([
            ZEROED_TEMPERATURE_UNIT,
          ]);
        });

        final listOfTemperatureUnitsFromKeyValueDatabase =
            TemperatureUnitConverterDataStore.getListOfTemperatureUnits(
              keyValueDatabase,
            );

        expect(
          listOfTemperatureUnitsFromKeyValueDatabase[0].value,
          ZEROED_TEMPERATURE_UNIT.value,
        );
        expect(
          listOfTemperatureUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_TEMPERATURE_UNIT.measureUnit,
        );

        expect(listOfTemperatureUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfTemperatureUnits\" Sets List Of Temperature Units On Key-Value Database",
      () {
        TemperatureUnitConverterDataStore.setListOfTemperatureUnits([
          ZEROED_TEMPERATURE_UNIT,
        ], keyValueDatabase);

        final listOfTemperatureUnitsFromKeyValueDatabase = keyValueDatabase
            .getItem(LIST_OF_TEMPERATURE_UNITS_KEY, (marshalledData) {
              return TemperatureUnitEntity.fromMarshalledListData(
                marshalledData,
              );
            });

        expect(
          listOfTemperatureUnitsFromKeyValueDatabase[0].value,
          ZEROED_TEMPERATURE_UNIT.value,
        );
        expect(
          listOfTemperatureUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_TEMPERATURE_UNIT.measureUnit,
        );

        expect(listOfTemperatureUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"getBaseTemperatureUnitIndex\" Returns Base Temperature Unit Index From Key-Value Database",
      () {
        keyValueDatabase.setItem(BASE_TEMPERATURE_UNIT_ELEMENT_INDEX_KEY, () {
          return "0";
        });

        final baseTemperatureUnitIndexFromKeyValueDatabase =
            TemperatureUnitConverterDataStore.getBaseTemperatureUnitIndex(
              keyValueDatabase,
            );

        expect(baseTemperatureUnitIndexFromKeyValueDatabase, 0);
      },
    );

    test(
      "Test If Method \"setBaseTemperatureUnitIndex\" Sets Base Temperature Unit Index On Key-Value Database",
      () {
        TemperatureUnitConverterDataStore.setBaseTemperatureUnitIndex(
          0,
          keyValueDatabase,
        );

        final baseTemperatureUnitIndexFromKeyValueDatabase = keyValueDatabase
            .getItem(BASE_TEMPERATURE_UNIT_ELEMENT_INDEX_KEY, (marshalledData) {
              return int.parse(marshalledData);
            });

        expect(baseTemperatureUnitIndexFromKeyValueDatabase, 0);
      },
    );
  });
}
