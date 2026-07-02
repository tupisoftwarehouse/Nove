import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/not_existing_item_error.dart";

class KeyValueDatabaseMock implements AbstractKeyValueDatabase {
  final mapOfItems = <String, String>{};

  @override
  T getItem<T>(
    String itemKeyName,
    T Function(String serializedData) getDeserializedData,
  ) {
    try {
      final serializedData = mapOfItems[itemKeyName] ?? "";

      return getDeserializedData(serializedData);
    } catch (_) {
      throw NotExistingItemError();
    }
  }

  @override
  void setItem<T>(String itemKeyName, String Function() getSerializedData) {
    final serializedData = getSerializedData();

    mapOfItems[itemKeyName] = serializedData;
  }
}
