import "package:flutter/foundation.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/currency_unit_converter_data_synchronizing_transaction_script.dart";

class CurrencyUnitConverterViewModel {
  final CurrencyUnitConverter _currencyUnitConverter;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<List<CurrencyUnitEntity>> listOfCurrencyUnits;
  final ValueNotifier<int> baseCurrencyUnitIndex;
  final ValueNotifier<CurrentCurrencyValuesValueObject> currentCurrencyValues;
  List<CurrencyUnitEntity>? _listOfCurrencyUnitsRecovery;
  int? _baseCurrencyUnitIndexRecovery;

  CurrencyUnitConverterViewModel(
    this._currencyUnitConverter,
    CurrentCurrencyValuesValueObject currentCurrencyValues,
    this._keyValueDatabase,
  ) : listOfCurrencyUnits = ValueNotifier<List<CurrencyUnitEntity>>(
        _currencyUnitConverter.listOfCurrencyUnits,
      ),
      baseCurrencyUnitIndex = ValueNotifier<int>(
        _currencyUnitConverter.baseCurrencyUnitIndex,
      ),
      currentCurrencyValues = ValueNotifier<CurrentCurrencyValuesValueObject>(
        currentCurrencyValues,
      );

  void addCurrencyUnit() {
    _currencyUnitConverter.addCurrencyUnit();

    CurrencyUnitConverterDataSynchronizingTransactionScript.synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex(
      _currencyUnitConverter,
      _keyValueDatabase,
      listOfCurrencyUnits,
      baseCurrencyUnitIndex,
    );
  }

  void addCurrencyUnitAt(int indexOfCurrencyUnitToBeAdded) {
    _currencyUnitConverter.addCurrencyUnitAt(indexOfCurrencyUnitToBeAdded);

    CurrencyUnitConverterDataSynchronizingTransactionScript.synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex(
      _currencyUnitConverter,
      _keyValueDatabase,
      listOfCurrencyUnits,
      baseCurrencyUnitIndex,
    );
  }

  void updateBaseCurrencyUnitIndex(int updatedBaseCurrencyUnitElementIndex) {
    _currencyUnitConverter.updateBaseCurrencyUnitIndex(
      updatedBaseCurrencyUnitElementIndex,
    );

    CurrencyUnitConverterDataSynchronizingTransactionScript.synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex(
      _currencyUnitConverter,
      _keyValueDatabase,
      listOfCurrencyUnits,
      baseCurrencyUnitIndex,
    );
  }

  void updateCurrencyUnitAt(
    CurrencyUnitEntity updatedCurrencyUnit,
    int updatedCurrencyUnitIndex,
  ) {
    _currencyUnitConverter.updateCurrencyUnitAt(
      updatedCurrencyUnit,
      updatedCurrencyUnitIndex,
    );

    CurrencyUnitConverterDataSynchronizingTransactionScript.synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex(
      _currencyUnitConverter,
      _keyValueDatabase,
      listOfCurrencyUnits,
      baseCurrencyUnitIndex,
    );
  }

  void removeCurrencyUnit(int indexOfCurrencyUnitToBeRemoved) {
    _currencyUnitConverter.removeCurrencyUnit(indexOfCurrencyUnitToBeRemoved);

    CurrencyUnitConverterDataSynchronizingTransactionScript.synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex(
      _currencyUnitConverter,
      _keyValueDatabase,
      listOfCurrencyUnits,
      baseCurrencyUnitIndex,
    );
  }

  void reset() {
    _listOfCurrencyUnitsRecovery = _currencyUnitConverter.listOfCurrencyUnits;

    _baseCurrencyUnitIndexRecovery =
        _currencyUnitConverter.baseCurrencyUnitIndex;

    _currencyUnitConverter.reset();

    CurrencyUnitConverterDataSynchronizingTransactionScript.synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex(
      _currencyUnitConverter,
      _keyValueDatabase,
      listOfCurrencyUnits,
      baseCurrencyUnitIndex,
    );
  }

  void disposeConverterCurrencyValues() {
    _currencyUnitConverter.disposeCurrencyValues();
  }

  void restore() {
    _currencyUnitConverter.listOfCurrencyUnits = _listOfCurrencyUnitsRecovery!;
    _currencyUnitConverter.baseCurrencyUnitIndex =
        _baseCurrencyUnitIndexRecovery!;

    CurrencyUnitConverterDataSynchronizingTransactionScript.synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex(
      _currencyUnitConverter,
      _keyValueDatabase,
      listOfCurrencyUnits,
      baseCurrencyUnitIndex,
    );

    _listOfCurrencyUnitsRecovery = null;
    _baseCurrencyUnitIndexRecovery = null;
  }

  void dismissRecovery() {
    _listOfCurrencyUnitsRecovery = null;
    _baseCurrencyUnitIndexRecovery = null;
  }
}
