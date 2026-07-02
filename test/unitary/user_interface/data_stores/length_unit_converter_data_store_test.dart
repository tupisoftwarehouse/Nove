import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/length_unit_converter_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"LengthUnitConverterDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfLengthUnits\" Returns List Of Length Units From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_LENGTH_UNITS_KEY, () {
          return LengthUnitEntity.marshalledListData([ZEROED_LENGTH_UNIT]);
        });

        final listOfLengthUnitsFromKeyValueDatabase =
            LengthUnitConverterDataStore.getListOfLengthUnits(keyValueDatabase);

        expect(
          listOfLengthUnitsFromKeyValueDatabase[0].value,
          ZEROED_LENGTH_UNIT.value,
        );
        expect(
          listOfLengthUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_LENGTH_UNIT.measureUnit,
        );

        expect(listOfLengthUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfLengthUnits\" Sets List Of Length Units On Key-Value Database",
      () {
        LengthUnitConverterDataStore.setListOfLengthUnits([
          ZEROED_LENGTH_UNIT,
        ], keyValueDatabase);

        final listOfLengthUnitsFromKeyValueDatabase = keyValueDatabase.getItem(
          LIST_OF_LENGTH_UNITS_KEY,
          (marshalledData) {
            return LengthUnitEntity.fromMarshalledListData(marshalledData);
          },
        );

        expect(
          listOfLengthUnitsFromKeyValueDatabase[0].value,
          ZEROED_LENGTH_UNIT.value,
        );
        expect(
          listOfLengthUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_LENGTH_UNIT.measureUnit,
        );

        expect(listOfLengthUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"getBaseLengthUnitIndex\" Returns Base Length Unit Index From Key-Value Database",
      () {
        keyValueDatabase.setItem(BASE_LENGTH_UNIT_ELEMENT_INDEX_KEY, () {
          return "0";
        });

        final baseLengthUnitIndexFromKeyValueDatabase =
            LengthUnitConverterDataStore.getBaseLengthUnitIndex(
              keyValueDatabase,
            );

        expect(baseLengthUnitIndexFromKeyValueDatabase, 0);
      },
    );

    test(
      "Test If Method \"setBaseLengthUnitIndex\" Sets Base Length Unit Index On Key-Value Database",
      () {
        LengthUnitConverterDataStore.setBaseLengthUnitIndex(
          0,
          keyValueDatabase,
        );

        final baseLengthUnitIndexFromKeyValueDatabase = keyValueDatabase
            .getItem(BASE_LENGTH_UNIT_ELEMENT_INDEX_KEY, (marshalledData) {
              return int.parse(marshalledData);
            });

        expect(baseLengthUnitIndexFromKeyValueDatabase, 0);
      },
    );
  });
}
