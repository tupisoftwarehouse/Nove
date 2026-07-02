import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/currency_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CurrencyUnitConverterViewModelFactory\" Class", () {
    late CurrencyUnitConverterViewModel instance;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"CurrencyUnitConverterViewModel\" With Stored Data From Key-Value Database With Updated Currency Values If Currency Values Are Updated",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_CURRENCY_UNITS_KEY] =
            MARSHALLED_LIST_OF_CURRENCY_UNIT_WITH_OUTDATED_CURRENCY_VALUES;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[BASE_CURRENCY_UNIT_ELEMENT_INDEX_KEY] = 0
            .toString();

        instance = CurrencyUnitConverterViewModelFactory.getInstance(
          CURRENT_CURRENCY_VALUES,
        );

        expect(
          instance.listOfCurrencyUnits.value.first.measureUnit,
          ZEROED_CURRENCY_UNIT.measureUnit,
        );
        expect(
          instance.listOfCurrencyUnits.value.first.value,
          ZEROED_CURRENCY_UNIT.value,
        );

        expect(instance.baseCurrencyUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"CurrencyUnitConverterViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = CurrencyUnitConverterViewModelFactory.getInstance(
          CURRENT_CURRENCY_VALUES,
        );

        expect(
          instance.listOfCurrencyUnits.value.first.measureUnit,
          ZEROED_CURRENCY_UNIT.measureUnit,
        );
        expect(
          instance.listOfCurrencyUnits.value.first.value,
          ZEROED_CURRENCY_UNIT.value,
        );

        expect(instance.baseCurrencyUnitIndex.value, 0);
      },
    );
  });
}
