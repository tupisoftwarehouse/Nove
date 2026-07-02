import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_unit_converter_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeUnitConverterDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfTimeUnits\" Returns List Of Time Units From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_TIME_UNITS_KEY, () {
          return TimeUnitEntity.marshalledListData([ZEROED_TIME_UNIT]);
        });

        final listOfTimeUnitsFromKeyValueDatabase =
            TimeUnitConverterDataStore.getListOfTimeUnits(keyValueDatabase);

        expect(
          listOfTimeUnitsFromKeyValueDatabase[0].value,
          ZEROED_TIME_UNIT.value,
        );
        expect(
          listOfTimeUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_TIME_UNIT.measureUnit,
        );

        expect(listOfTimeUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfTimeUnits\" Sets List Of Time Units On Key-Value Database",
      () {
        TimeUnitConverterDataStore.setListOfTimeUnits([
          ZEROED_TIME_UNIT,
        ], keyValueDatabase);

        final listOfTimeUnitsFromKeyValueDatabase = keyValueDatabase.getItem(
          LIST_OF_TIME_UNITS_KEY,
          (marshalledData) {
            return TimeUnitEntity.fromMarshalledListData(marshalledData);
          },
        );

        expect(
          listOfTimeUnitsFromKeyValueDatabase[0].value,
          ZEROED_TIME_UNIT.value,
        );
        expect(
          listOfTimeUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_TIME_UNIT.measureUnit,
        );

        expect(listOfTimeUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"getBaseTimeUnitIndex\" Returns Base Time Unit Index From Key-Value Database",
      () {
        keyValueDatabase.setItem(BASE_TIME_UNIT_ELEMENT_INDEX_KEY, () {
          return "0";
        });

        final baseTimeUnitIndexFromKeyValueDatabase =
            TimeUnitConverterDataStore.getBaseTimeUnitIndex(keyValueDatabase);

        expect(baseTimeUnitIndexFromKeyValueDatabase, 0);
      },
    );
    test(
      "Test If Method \"setBaseTimeUnitIndex\" Sets Base Time Unit Index On Key-Value Database",
      () {
        TimeUnitConverterDataStore.setBaseTimeUnitIndex(0, keyValueDatabase);

        final baseTimeUnitIndexFromKeyValueDatabase = keyValueDatabase.getItem(
          BASE_TIME_UNIT_ELEMENT_INDEX_KEY,
          (marshalledData) {
            return int.parse(marshalledData);
          },
        );

        expect(baseTimeUnitIndexFromKeyValueDatabase, 0);
      },
    );
  });
}
