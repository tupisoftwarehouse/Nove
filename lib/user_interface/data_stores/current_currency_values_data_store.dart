import "package:nove/constants/user_interface_constants.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class CurrentCurrencyValuesDataStore {
  CurrentCurrencyValuesDataStore._();

  static CurrentCurrencyValuesValueObject getCurrentCurrencyValues(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<CurrentCurrencyValuesValueObject>(
      CURRENT_CURRENCY_VALUES_KEY,
      (marshalledData) {
        return CurrentCurrencyValuesValueObject.fromMarshalledData(
          marshalledData,
        );
      },
    );
  }

  static void setCurrentCurrencyValues(
    CurrentCurrencyValuesValueObject updatedCurrentCurrencyValues,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(CURRENT_CURRENCY_VALUES_KEY, () {
      return updatedCurrentCurrencyValues.marshalledData;
    });
  }
}
