import "package:mmkv/mmkv.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/concrete_key_value_database.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class KeyValueDatabaseFactory {
  static AbstractKeyValueDatabase? instance;

  KeyValueDatabaseFactory._();

  static AbstractKeyValueDatabase getInstance() {
    if (isNull(instance)) {
      final keyValueDatabaseImplementation = MMKV.defaultMMKV();

      instance = KeyValueDatabaseConcrete.ConcreteKeyValueDatabase(
        keyValueDatabaseImplementation,
      );
    }

    return instance!;
  }
}
