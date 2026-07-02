import "package:nove/data/currency/currency_gateway.dart";
import "package:nove/data/currency/currency_repository.dart";
import "package:http/http.dart";

class CurrencyRepositoryFactory {
  static CurrencyRepository? instance;

  CurrencyRepositoryFactory._();

  static CurrencyRepository getInstance() {
    final httpClient = Client();
    final currencyGateway = CurrencyGateway(httpClient);

    return instance ?? CurrencyRepository(currencyGateway);
  }
}
