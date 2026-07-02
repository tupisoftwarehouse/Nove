import "package:mmkv/mmkv.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/not_existing_item_error.dart";

class KeyValueDatabaseConcrete implements AbstractKeyValueDatabase {
  final MMKV _keyValueDatabaseImplementation;

  KeyValueDatabaseConcrete.ConcreteKeyValueDatabase(
    this._keyValueDatabaseImplementation,
  );

  @override
  T getItem<T>(
    String itemKeyName,
    T Function(String serializedData) getDeserializedData,
  ) {
    try {
      final serializedData =
          _keyValueDatabaseImplementation.decodeString(itemKeyName) ?? "";

      return getDeserializedData(serializedData);
    } catch (_) {
      throw NotExistingItemError();
    }
  }

  @override
  void setItem<T>(String itemKeyName, String Function() getSerializedData) {
    final serializedData = getSerializedData();

    _keyValueDatabaseImplementation.encodeString(itemKeyName, serializedData);
  }
}
