import "package:nove/data/currency/current_currency_values_value_object.dart";
import "package:nove/dependency_injection/currency_repository_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/current_currency_values_data_store.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class CurrentCurrencyValuesFactory {
  CurrentCurrencyValuesFactory._();

  static Future<CurrentCurrencyValuesValueObject> getInstance() async {
    final currencyRepository = CurrencyRepositoryFactory.getInstance();
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();
    final currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    late final CurrentCurrencyValuesValueObject
    currentCurrencyValuesFromKeyValueDatabase;
    late final CurrentCurrencyValuesValueObject
    currentCurrencyValuesFromService;

    try {
      currentCurrencyValuesFromKeyValueDatabase =
          CurrentCurrencyValuesDataStore.getCurrentCurrencyValues(
            keyValueDatabase,
          );

      if (isCurrencyValuesUpdatable(
        currentTimestamp,
        currentCurrencyValuesFromKeyValueDatabase.updatableAt,
      )) {
        try {
          currentCurrencyValuesFromService = await currencyRepository
              .getCurrentCurrencyValues();

          CurrentCurrencyValuesDataStore.setCurrentCurrencyValues(
            currentCurrencyValuesFromService,
            keyValueDatabase,
          );

          return currentCurrencyValuesFromService;
        } catch (_) {
          return currentCurrencyValuesFromKeyValueDatabase;
        }
      } else {
        return currentCurrencyValuesFromKeyValueDatabase;
      }
    } catch (_) {
      currentCurrencyValuesFromService = await currencyRepository
          .getCurrentCurrencyValues();

      CurrentCurrencyValuesDataStore.setCurrentCurrencyValues(
        currentCurrencyValuesFromService,
        keyValueDatabase,
      );

      return currentCurrencyValuesFromService;
    }
  }
}
