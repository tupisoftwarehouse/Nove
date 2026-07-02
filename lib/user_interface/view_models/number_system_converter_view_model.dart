import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/number_system_converter_data_synchronizing_transaction_script.dart";

class NumberSystemConverterViewModel {
  final NumberSystemConverter _numberSystemConverter;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<List<NumberSystemEntity>> listOfNumberSystems;
  final ValueNotifier<int> baseNumberSystemIndex;
  List<NumberSystemEntity>? _listOfNumberSystemsRecovery;
  int? _baseNumberSystemIndexRecovery;

  NumberSystemConverterViewModel(
    this._numberSystemConverter,
    this._keyValueDatabase,
  ) : listOfNumberSystems = ValueNotifier<List<NumberSystemEntity>>(
        _numberSystemConverter.listOfNumberSystems,
      ),
      baseNumberSystemIndex = ValueNotifier<int>(
        _numberSystemConverter.baseNumberSystemIndex,
      );

  void addNumberSystem() {
    _numberSystemConverter.addNumberSystem();

    NumberSystemConverterDataSynchronizingTransactionScript.synchronizeListOfNumberSystemsAndBaseNumberSystemIndex(
      _numberSystemConverter,
      _keyValueDatabase,
      listOfNumberSystems,
      baseNumberSystemIndex,
    );
  }

  void addNumberSystemAt(int indexOfNumberSystemToBeAdded) {
    _numberSystemConverter.addNumberSystemAt(indexOfNumberSystemToBeAdded);

    NumberSystemConverterDataSynchronizingTransactionScript.synchronizeListOfNumberSystemsAndBaseNumberSystemIndex(
      _numberSystemConverter,
      _keyValueDatabase,
      listOfNumberSystems,
      baseNumberSystemIndex,
    );
  }

  void updateBaseNumberSystemIndex(int updatedBaseNumberSystemElementIndex) {
    _numberSystemConverter.updateBaseNumberSystemIndex(
      updatedBaseNumberSystemElementIndex,
    );

    NumberSystemConverterDataSynchronizingTransactionScript.synchronizeListOfNumberSystemsAndBaseNumberSystemIndex(
      _numberSystemConverter,
      _keyValueDatabase,
      listOfNumberSystems,
      baseNumberSystemIndex,
    );
  }

  void updateNumberSystemAt(
    NumberSystemEntity updatedNumberSystem,
    int updatedNumberSystemIndex,
  ) {
    _numberSystemConverter.updateNumberSystemAt(
      updatedNumberSystem,
      updatedNumberSystemIndex,
    );

    NumberSystemConverterDataSynchronizingTransactionScript.synchronizeListOfNumberSystemsAndBaseNumberSystemIndex(
      _numberSystemConverter,
      _keyValueDatabase,
      listOfNumberSystems,
      baseNumberSystemIndex,
    );
  }

  void removeNumberSystem(int indexOfNumberSystemToBeRemoved) {
    _numberSystemConverter.removeNumberSystem(indexOfNumberSystemToBeRemoved);

    NumberSystemConverterDataSynchronizingTransactionScript.synchronizeListOfNumberSystemsAndBaseNumberSystemIndex(
      _numberSystemConverter,
      _keyValueDatabase,
      listOfNumberSystems,
      baseNumberSystemIndex,
    );
  }

  void reset() {
    _listOfNumberSystemsRecovery = _numberSystemConverter.listOfNumberSystems;

    _baseNumberSystemIndexRecovery =
        _numberSystemConverter.baseNumberSystemIndex;

    _numberSystemConverter.reset();

    NumberSystemConverterDataSynchronizingTransactionScript.synchronizeListOfNumberSystemsAndBaseNumberSystemIndex(
      _numberSystemConverter,
      _keyValueDatabase,
      listOfNumberSystems,
      baseNumberSystemIndex,
    );
  }

  void restore() {
    _numberSystemConverter.listOfNumberSystems = _listOfNumberSystemsRecovery!;
    _numberSystemConverter.baseNumberSystemIndex =
        _baseNumberSystemIndexRecovery!;

    NumberSystemConverterDataSynchronizingTransactionScript.synchronizeListOfNumberSystemsAndBaseNumberSystemIndex(
      _numberSystemConverter,
      _keyValueDatabase,
      listOfNumberSystems,
      baseNumberSystemIndex,
    );

    _listOfNumberSystemsRecovery = null;
    _baseNumberSystemIndexRecovery = null;
  }

  void dismissRecovery() {
    _listOfNumberSystemsRecovery = null;
    _baseNumberSystemIndexRecovery = null;
  }
}
