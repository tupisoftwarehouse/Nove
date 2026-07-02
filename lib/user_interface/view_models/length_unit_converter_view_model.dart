import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/length_unit_converter_data_synchronizing_transaction_script.dart";

class LengthUnitConverterViewModel {
  final LengthUnitConverter _lengthUnitConverter;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<List<LengthUnitEntity>> listOfLengthUnits;
  final ValueNotifier<int> baseLengthUnitIndex;
  List<LengthUnitEntity>? _listOfLengthUnitsRecovery;
  int? _baseLengthUnitIndexRecovery;

  LengthUnitConverterViewModel(
    this._lengthUnitConverter,
    this._keyValueDatabase,
  ) : listOfLengthUnits = ValueNotifier<List<LengthUnitEntity>>(
        _lengthUnitConverter.listOfLengthUnits,
      ),
      baseLengthUnitIndex = ValueNotifier<int>(
        _lengthUnitConverter.baseLengthUnitIndex,
      );

  void addLengthUnit() {
    _lengthUnitConverter.addLengthUnit();

    LengthUnitConverterDataSynchronizingTransactionScript.synchronizeListOfLengthUnitsAndBaseLengthUnitIndex(
      _lengthUnitConverter,
      _keyValueDatabase,
      listOfLengthUnits,
      baseLengthUnitIndex,
    );
  }

  void addLengthUnitAt(int indexOfLengthUnitToBeAdded) {
    _lengthUnitConverter.addLengthUnitAt(indexOfLengthUnitToBeAdded);

    LengthUnitConverterDataSynchronizingTransactionScript.synchronizeListOfLengthUnitsAndBaseLengthUnitIndex(
      _lengthUnitConverter,
      _keyValueDatabase,
      listOfLengthUnits,
      baseLengthUnitIndex,
    );
  }

  void updateBaseLengthUnitIndex(int updatedBaseLengthUnitElementIndex) {
    _lengthUnitConverter.updateBaseLengthUnitIndex(
      updatedBaseLengthUnitElementIndex,
    );

    LengthUnitConverterDataSynchronizingTransactionScript.synchronizeListOfLengthUnitsAndBaseLengthUnitIndex(
      _lengthUnitConverter,
      _keyValueDatabase,
      listOfLengthUnits,
      baseLengthUnitIndex,
    );
  }

  void updateLengthUnitAt(
    LengthUnitEntity updatedLengthUnit,
    int updatedLengthUnitIndex,
  ) {
    _lengthUnitConverter.updateLengthUnitAt(
      updatedLengthUnit,
      updatedLengthUnitIndex,
    );

    LengthUnitConverterDataSynchronizingTransactionScript.synchronizeListOfLengthUnitsAndBaseLengthUnitIndex(
      _lengthUnitConverter,
      _keyValueDatabase,
      listOfLengthUnits,
      baseLengthUnitIndex,
    );
  }

  void removeLengthUnit(int indexOfLengthUnitToBeRemoved) {
    _lengthUnitConverter.removeLengthUnit(indexOfLengthUnitToBeRemoved);

    LengthUnitConverterDataSynchronizingTransactionScript.synchronizeListOfLengthUnitsAndBaseLengthUnitIndex(
      _lengthUnitConverter,
      _keyValueDatabase,
      listOfLengthUnits,
      baseLengthUnitIndex,
    );
  }

  void reset() {
    _listOfLengthUnitsRecovery = _lengthUnitConverter.listOfLengthUnits;

    _baseLengthUnitIndexRecovery = _lengthUnitConverter.baseLengthUnitIndex;

    _lengthUnitConverter.reset();

    LengthUnitConverterDataSynchronizingTransactionScript.synchronizeListOfLengthUnitsAndBaseLengthUnitIndex(
      _lengthUnitConverter,
      _keyValueDatabase,
      listOfLengthUnits,
      baseLengthUnitIndex,
    );
  }

  void restore() {
    _lengthUnitConverter.listOfLengthUnits = _listOfLengthUnitsRecovery!;
    _lengthUnitConverter.baseLengthUnitIndex = _baseLengthUnitIndexRecovery!;

    LengthUnitConverterDataSynchronizingTransactionScript.synchronizeListOfLengthUnitsAndBaseLengthUnitIndex(
      _lengthUnitConverter,
      _keyValueDatabase,
      listOfLengthUnits,
      baseLengthUnitIndex,
    );

    _listOfLengthUnitsRecovery = null;
    _baseLengthUnitIndexRecovery = null;
  }

  void dismissRecovery() {
    _listOfLengthUnitsRecovery = null;
    _baseLengthUnitIndexRecovery = null;
  }
}
