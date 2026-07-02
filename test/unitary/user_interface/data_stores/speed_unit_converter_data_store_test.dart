import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/speed_unit_converter_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"SpeedUnitConverterDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfSpeedUnits\" Returns List Of Speed Units From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_SPEED_UNITS_KEY, () {
          return SpeedUnitEntity.marshalledListData([ZEROED_SPEED_UNIT]);
        });

        final listOfSpeedUnitsFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getListOfSpeedUnits(keyValueDatabase);

        expect(
          listOfSpeedUnitsFromKeyValueDatabase[0].value,
          ZEROED_SPEED_UNIT.value,
        );
        expect(
          listOfSpeedUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_SPEED_UNIT.measureUnit,
        );

        expect(listOfSpeedUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfSpeedUnits\" Sets List Of Speed Units On Key-Value Database",
      () {
        SpeedUnitConverterDataStore.setListOfSpeedUnits([
          ZEROED_SPEED_UNIT,
        ], keyValueDatabase);

        final listOfSpeedUnitsFromKeyValueDatabase = keyValueDatabase.getItem(
          LIST_OF_SPEED_UNITS_KEY,
          (marshalledData) {
            return SpeedUnitEntity.fromMarshalledListData(marshalledData);
          },
        );

        expect(
          listOfSpeedUnitsFromKeyValueDatabase[0].value,
          ZEROED_SPEED_UNIT.value,
        );
        expect(
          listOfSpeedUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_SPEED_UNIT.measureUnit,
        );

        expect(listOfSpeedUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"getBaseSpeedUnitIndex\" Returns Base Speed Unit Index From Key-Value Database",
      () {
        keyValueDatabase.setItem(BASE_SPEED_UNIT_ELEMENT_INDEX_KEY, () {
          return "0";
        });

        final baseSpeedUnitIndexFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getBaseSpeedUnitIndex(keyValueDatabase);

        expect(baseSpeedUnitIndexFromKeyValueDatabase, 0);
      },
    );

    test(
      "Test If Method \"setBaseSpeedUnitIndex\" Sets Base Speed Unit Index On Key-Value Database",
      () {
        SpeedUnitConverterDataStore.setBaseSpeedUnitIndex(0, keyValueDatabase);

        final baseSpeedUnitIndexFromKeyValueDatabase = keyValueDatabase.getItem(
          BASE_SPEED_UNIT_ELEMENT_INDEX_KEY,
          (marshalledData) {
            return int.parse(marshalledData);
          },
        );

        expect(baseSpeedUnitIndexFromKeyValueDatabase, 0);
      },
    );
  });
}
