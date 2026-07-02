import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/number_system_converter_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"NumberSystemConverterDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfNumberSystems\" Returns List Of Number Systems From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_NUMBER_SYSTEMS_KEY, () {
          return NumberSystemEntity.marshalledListData([ZEROED_NUMBER_SYSTEM]);
        });

        final listOfNumberSystemsFromKeyValueDatabase =
            NumberSystemConverterDataStore.getListOfNumberSystems(
              keyValueDatabase,
            );

        expect(
          listOfNumberSystemsFromKeyValueDatabase[0].value,
          ZEROED_NUMBER_SYSTEM.value,
        );
        expect(
          listOfNumberSystemsFromKeyValueDatabase[0].measureUnit,
          ZEROED_NUMBER_SYSTEM.measureUnit,
        );

        expect(listOfNumberSystemsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfNumberSystems\" Sets List Of Number Systems On Key-Value Database",
      () {
        NumberSystemConverterDataStore.setListOfNumberSystems([
          ZEROED_NUMBER_SYSTEM,
        ], keyValueDatabase);

        final listOfNumberSystemsFromKeyValueDatabase = keyValueDatabase
            .getItem(LIST_OF_NUMBER_SYSTEMS_KEY, (marshalledData) {
              return NumberSystemEntity.fromMarshalledListData(marshalledData);
            });

        expect(
          listOfNumberSystemsFromKeyValueDatabase[0].value,
          ZEROED_NUMBER_SYSTEM.value,
        );
        expect(
          listOfNumberSystemsFromKeyValueDatabase[0].measureUnit,
          ZEROED_NUMBER_SYSTEM.measureUnit,
        );

        expect(listOfNumberSystemsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"getBaseNumberSystemIndex\" Returns Base Number System Index From Key-Value Database",
      () {
        keyValueDatabase.setItem(BASE_NUMBER_SYSTEM_ELEMENT_INDEX_KEY, () {
          return "0";
        });

        final baseNumberSystemIndexFromKeyValueDatabase =
            NumberSystemConverterDataStore.getBaseNumberSystemIndex(
              keyValueDatabase,
            );

        expect(baseNumberSystemIndexFromKeyValueDatabase, 0);
      },
    );

    test(
      "Test If Method \"setBaseNumberSystemIndex\" Sets Base Number System Index On Key-Value Database",
      () {
        NumberSystemConverterDataStore.setBaseNumberSystemIndex(
          0,
          keyValueDatabase,
        );

        final baseNumberSystemIndexFromKeyValueDatabase = keyValueDatabase
            .getItem(BASE_NUMBER_SYSTEM_ELEMENT_INDEX_KEY, (marshalledData) {
              return int.parse(marshalledData);
            });

        expect(baseNumberSystemIndexFromKeyValueDatabase, 0);
      },
    );
  });
}
