import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/not_existing_item_error.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"KeyValueDatabase\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getItem\" Returns Deserialized Stored Item From Database",
      () {
        (keyValueDatabase as KeyValueDatabaseMock).mapOfItems[STORED_DATA_KEY] =
            STRING_OF_ITEM_TO_BE_STORED;

        final storedData = keyValueDatabase.getItem<String>(STORED_DATA_KEY, (
          serializedData,
        ) {
          return serializedData;
        });

        expect(storedData, STRING_OF_ITEM_TO_BE_STORED);
      },
    );

    test(
      "Test If Method \"getItem\" Throws \"NotExistingItemError\" If Item Does Not Exist In Database",
      () {
        try {
          keyValueDatabase.getItem<String>(STORED_DATA_KEY, (_) {
            throw NotExistingItemError();
          });
        } catch (error) {
          expect(error.toString(), NOT_EXISTING_ITEM_ERROR_MESSAGE);
        }
      },
    );

    test("Test If Method \"setItem\" Stores Serialized Item In Database", () {
      keyValueDatabase.setItem<String>(STORED_DATA_KEY, () {
        return STRING_OF_ITEM_TO_BE_STORED;
      });

      final storedData = (keyValueDatabase as KeyValueDatabaseMock)
          .mapOfItems[STORED_DATA_KEY];

      expect(storedData, STRING_OF_ITEM_TO_BE_STORED);
    });
  });
}
