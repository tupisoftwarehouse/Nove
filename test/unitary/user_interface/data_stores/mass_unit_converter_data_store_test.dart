import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/mass_unit_converter_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"MassUnitConverterDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfMassUnits\" Returns List Of Mass Units From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_MASS_UNITS_KEY, () {
          return MassUnitEntity.marshalledListData([ZEROED_MASS_UNIT]);
        });

        final listOfMassUnitsFromKeyValueDatabase =
            MassUnitConverterDataStore.getListOfMassUnits(keyValueDatabase);

        expect(
          listOfMassUnitsFromKeyValueDatabase[0].value,
          ZEROED_MASS_UNIT.value,
        );
        expect(
          listOfMassUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_MASS_UNIT.measureUnit,
        );

        expect(listOfMassUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfMassUnits\" Sets List Of Mass Units On Key-Value Database",
      () {
        MassUnitConverterDataStore.setListOfMassUnits([
          ZEROED_MASS_UNIT,
        ], keyValueDatabase);

        final listOfMassUnitsFromKeyValueDatabase = keyValueDatabase.getItem(
          LIST_OF_MASS_UNITS_KEY,
          (marshalledData) {
            return MassUnitEntity.fromMarshalledListData(marshalledData);
          },
        );

        expect(
          listOfMassUnitsFromKeyValueDatabase[0].value,
          ZEROED_MASS_UNIT.value,
        );
        expect(
          listOfMassUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_MASS_UNIT.measureUnit,
        );

        expect(listOfMassUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"getBaseMassUnitIndex\" Returns Base Mass Unit Index From Key-Value Database",
      () {
        keyValueDatabase.setItem(BASE_MASS_UNIT_ELEMENT_INDEX_KEY, () {
          return "0";
        });

        final baseMassUnitIndexFromKeyValueDatabase =
            MassUnitConverterDataStore.getBaseMassUnitIndex(keyValueDatabase);

        expect(baseMassUnitIndexFromKeyValueDatabase, 0);
      },
    );

    test(
      "Test If Method \"setBaseMassUnitIndex\" Sets Base Mass Unit Index On Key-Value Database",
      () {
        MassUnitConverterDataStore.setBaseMassUnitIndex(0, keyValueDatabase);

        final baseMassUnitIndexFromKeyValueDatabase = keyValueDatabase.getItem(
          BASE_MASS_UNIT_ELEMENT_INDEX_KEY,
          (marshalledData) {
            return int.parse(marshalledData);
          },
        );

        expect(baseMassUnitIndexFromKeyValueDatabase, 0);
      },
    );
  });
}
