import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/speed_unit_converter_data_synchronizing_transaction_script.dart";

class SpeedUnitConverterViewModel {
  final SpeedUnitConverter _speedUnitConverter;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<List<SpeedUnitEntity>> listOfSpeedUnits;
  final ValueNotifier<int> baseSpeedUnitIndex;
  List<SpeedUnitEntity>? _listOfSpeedUnitsRecovery;
  int? _baseSpeedUnitIndexRecovery;

  SpeedUnitConverterViewModel(this._speedUnitConverter, this._keyValueDatabase)
    : listOfSpeedUnits = ValueNotifier<List<SpeedUnitEntity>>(
        _speedUnitConverter.listOfSpeedUnits,
      ),
      baseSpeedUnitIndex = ValueNotifier<int>(
        _speedUnitConverter.baseSpeedUnitIndex,
      );

  void addSpeedUnit() {
    _speedUnitConverter.addSpeedUnit();

    SpeedUnitConverterDataSynchronizingTransactionScript.synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex(
      _speedUnitConverter,
      _keyValueDatabase,
      listOfSpeedUnits,
      baseSpeedUnitIndex,
    );
  }

  void addSpeedUnitAt(int indexOfSpeedUnitToBeAdded) {
    _speedUnitConverter.addSpeedUnitAt(indexOfSpeedUnitToBeAdded);

    SpeedUnitConverterDataSynchronizingTransactionScript.synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex(
      _speedUnitConverter,
      _keyValueDatabase,
      listOfSpeedUnits,
      baseSpeedUnitIndex,
    );
  }

  void updateBaseSpeedUnitIndex(int updatedBaseSpeedUnitElementIndex) {
    _speedUnitConverter.updateBaseSpeedUnitIndex(
      updatedBaseSpeedUnitElementIndex,
    );

    SpeedUnitConverterDataSynchronizingTransactionScript.synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex(
      _speedUnitConverter,
      _keyValueDatabase,
      listOfSpeedUnits,
      baseSpeedUnitIndex,
    );
  }

  void updateSpeedUnitAt(
    SpeedUnitEntity updatedSpeedUnit,
    int updatedSpeedUnitIndex,
  ) {
    _speedUnitConverter.updateSpeedUnitAt(
      updatedSpeedUnit,
      updatedSpeedUnitIndex,
    );

    SpeedUnitConverterDataSynchronizingTransactionScript.synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex(
      _speedUnitConverter,
      _keyValueDatabase,
      listOfSpeedUnits,
      baseSpeedUnitIndex,
    );
  }

  void removeSpeedUnit(int indexOfSpeedUnitToBeRemoved) {
    _speedUnitConverter.removeSpeedUnit(indexOfSpeedUnitToBeRemoved);

    SpeedUnitConverterDataSynchronizingTransactionScript.synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex(
      _speedUnitConverter,
      _keyValueDatabase,
      listOfSpeedUnits,
      baseSpeedUnitIndex,
    );
  }

  void reset() {
    _listOfSpeedUnitsRecovery = _speedUnitConverter.listOfSpeedUnits;

    _baseSpeedUnitIndexRecovery = _speedUnitConverter.baseSpeedUnitIndex;

    _speedUnitConverter.reset();

    SpeedUnitConverterDataSynchronizingTransactionScript.synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex(
      _speedUnitConverter,
      _keyValueDatabase,
      listOfSpeedUnits,
      baseSpeedUnitIndex,
    );
  }

  void restore() {
    _speedUnitConverter.listOfSpeedUnits = _listOfSpeedUnitsRecovery!;
    _speedUnitConverter.baseSpeedUnitIndex = _baseSpeedUnitIndexRecovery!;

    SpeedUnitConverterDataSynchronizingTransactionScript.synchronizeListOfSpeedUnitsAndBaseSpeedUnitIndex(
      _speedUnitConverter,
      _keyValueDatabase,
      listOfSpeedUnits,
      baseSpeedUnitIndex,
    );

    _listOfSpeedUnitsRecovery = null;
    _baseSpeedUnitIndexRecovery = null;
  }

  void dismissRecovery() {
    _listOfSpeedUnitsRecovery = null;
    _baseSpeedUnitIndexRecovery = null;
  }
}
