import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/area_unit_converter_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"AreaUnitConverterDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfAreaUnits\" Returns List Of Area Units From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_AREA_UNITS_KEY, () {
          return AreaUnitEntity.marshalledListData([ZEROED_AREA_UNIT]);
        });

        final listOfAreaUnitsFromKeyValueDatabase =
            AreaUnitConverterDataStore.getListOfAreaUnits(keyValueDatabase);

        expect(
          listOfAreaUnitsFromKeyValueDatabase[0].value,
          ZEROED_AREA_UNIT.value,
        );
        expect(
          listOfAreaUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_AREA_UNIT.measureUnit,
        );

        expect(listOfAreaUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfAreaUnits\" Sets List Of Area Units On Key-Value Database",
      () {
        AreaUnitConverterDataStore.setListOfAreaUnits([
          ZEROED_AREA_UNIT,
        ], keyValueDatabase);

        final listOfAreaUnitsFromKeyValueDatabase = keyValueDatabase.getItem(
          LIST_OF_AREA_UNITS_KEY,
          (marshalledData) {
            return AreaUnitEntity.fromMarshalledListData(marshalledData);
          },
        );

        expect(
          listOfAreaUnitsFromKeyValueDatabase[0].value,
          ZEROED_AREA_UNIT.value,
        );
        expect(
          listOfAreaUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_AREA_UNIT.measureUnit,
        );

        expect(listOfAreaUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"getBaseAreaUnitIndex\" Returns Base Area Unit Index From Key-Value Database",
      () {
        keyValueDatabase.setItem(BASE_AREA_UNIT_ELEMENT_INDEX_KEY, () {
          return "0";
        });

        final baseAreaUnitIndexFromKeyValueDatabase =
            AreaUnitConverterDataStore.getBaseAreaUnitIndex(keyValueDatabase);

        expect(baseAreaUnitIndexFromKeyValueDatabase, 0);
      },
    );

    test(
      "Test If Method \"setBaseAreaUnitIndex\" Sets Base Area Unit Index On Key-Value Database",
      () {
        AreaUnitConverterDataStore.setBaseAreaUnitIndex(0, keyValueDatabase);

        final baseAreaUnitIndexFromKeyValueDatabase = keyValueDatabase.getItem(
          BASE_AREA_UNIT_ELEMENT_INDEX_KEY,
          (marshalledData) {
            return int.parse(marshalledData);
          },
        );

        expect(baseAreaUnitIndexFromKeyValueDatabase, 0);
      },
    );
  });
}
