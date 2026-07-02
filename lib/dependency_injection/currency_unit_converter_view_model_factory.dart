import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/currency_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";

class CurrencyUnitConverterViewModelFactory {
  CurrencyUnitConverterViewModelFactory._();

  static CurrencyUnitConverterViewModel getInstance(
    CurrentCurrencyValuesValueObject currencyValues,
  ) {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    try {
      final List<CurrencyUnitEntity> listOfCurrencyUnitsFromKeyValueDatabase =
          CurrencyUnitConverterDataStore.getListOfCurrencyUnits(
            keyValueDatabase,
          );
      final baseCurrencyUnitIndexFromKeyValueDatabase =
          CurrencyUnitConverterDataStore.getBaseCurrencyUnitIndex(
            keyValueDatabase,
          );
      late final MeasureUnitConverter<CurrencyUnit> measureUnitConverter;
      late final CurrencyUnitConverter currencyUnitConverter;

      measureUnitConverter = MeasureUnitConverter<CurrencyUnit>(
        ZEROED_CURRENCY_UNIT,
        listOfCurrencyUnitsFromKeyValueDatabase,
        baseCurrencyUnitIndexFromKeyValueDatabase,
      );

      currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        currencyValues.currencyValues,
      );

      return CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        currencyValues,
        keyValueDatabase,
      );
    } catch (_) {
      final measureUnitConverter = MeasureUnitConverter<CurrencyUnit>(
        ZEROED_CURRENCY_UNIT,
        [ZEROED_CURRENCY_UNIT],
        0,
      );
      final currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        currencyValues.currencyValues,
      );

      return CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        currencyValues,
        keyValueDatabase,
      );
    }
  }
}
