import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"KeyValueDatabaseFactory\" Class", () {
    setUpAll(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test("Test If Method \"getInstance\" Returns \"KeyValueDatabase\"", () {
      (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
              .mapOfItems[STORED_DATA_KEY] =
          STORED_DATA;

      final instance = KeyValueDatabaseFactory.getInstance();

      final storedValue = instance.getItem<String>(STORED_DATA_KEY, (
        serializedData,
      ) {
        return serializedData;
      });

      expect(storedValue, STORED_DATA);
    });
  });
}
