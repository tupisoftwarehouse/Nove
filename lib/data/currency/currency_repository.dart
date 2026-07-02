import "package:nove/data/currency/currency_gateway.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";

class CurrencyRepository {
  final CurrencyGateway currencyGateway;

  CurrencyRepository(this.currencyGateway);

  Future<CurrentCurrencyValuesValueObject> getCurrentCurrencyValues() async {
    return currencyGateway.getCurrentCurrencyValues();
  }
}
