import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/time_unit_converter_data_synchronizing_transaction_script.dart";

class TimeUnitConverterViewModel {
  final TimeUnitConverter _timeUnitConverter;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<List<TimeUnitEntity>> listOfTimeUnits;
  final ValueNotifier<int> baseTimeUnitIndex;
  List<TimeUnitEntity>? _listOfTimeUnitsRecovery;
  int? _baseTimeUnitIndexRecovery;

  TimeUnitConverterViewModel(this._timeUnitConverter, this._keyValueDatabase)
    : listOfTimeUnits = ValueNotifier<List<TimeUnitEntity>>(
        _timeUnitConverter.listOfTimeUnits,
      ),
      baseTimeUnitIndex = ValueNotifier<int>(
        _timeUnitConverter.baseTimeUnitIndex,
      );

  void addTimeUnit() {
    _timeUnitConverter.addTimeUnit();

    TimeUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTimeUnitsAndBaseTimeUnitIndex(
      _timeUnitConverter,
      _keyValueDatabase,
      listOfTimeUnits,
      baseTimeUnitIndex,
    );
  }

  void addTimeUnitAt(int indexOfTimeUnitToBeAdded) {
    _timeUnitConverter.addTimeUnitAt(indexOfTimeUnitToBeAdded);

    TimeUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTimeUnitsAndBaseTimeUnitIndex(
      _timeUnitConverter,
      _keyValueDatabase,
      listOfTimeUnits,
      baseTimeUnitIndex,
    );
  }

  void updateBaseTimeUnitIndex(int updatedBaseTimeUnitElementIndex) {
    _timeUnitConverter.updateBaseTimeUnitIndex(updatedBaseTimeUnitElementIndex);

    TimeUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTimeUnitsAndBaseTimeUnitIndex(
      _timeUnitConverter,
      _keyValueDatabase,
      listOfTimeUnits,
      baseTimeUnitIndex,
    );
  }

  void updateTimeUnitAt(
    TimeUnitEntity updatedTimeUnit,
    int updatedTimeUnitIndex,
  ) {
    _timeUnitConverter.updateTimeUnitAt(updatedTimeUnit, updatedTimeUnitIndex);

    TimeUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTimeUnitsAndBaseTimeUnitIndex(
      _timeUnitConverter,
      _keyValueDatabase,
      listOfTimeUnits,
      baseTimeUnitIndex,
    );
  }

  void removeTimeUnit(int indexOfTimeUnitToBeRemoved) {
    _timeUnitConverter.removeTimeUnit(indexOfTimeUnitToBeRemoved);

    TimeUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTimeUnitsAndBaseTimeUnitIndex(
      _timeUnitConverter,
      _keyValueDatabase,
      listOfTimeUnits,
      baseTimeUnitIndex,
    );
  }

  void reset() {
    _listOfTimeUnitsRecovery = _timeUnitConverter.listOfTimeUnits;
    _baseTimeUnitIndexRecovery = _timeUnitConverter.baseTimeUnitIndex;

    _timeUnitConverter.reset();

    TimeUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTimeUnitsAndBaseTimeUnitIndex(
      _timeUnitConverter,
      _keyValueDatabase,
      listOfTimeUnits,
      baseTimeUnitIndex,
    );
  }

  void restore() {
    _timeUnitConverter.listOfTimeUnits = _listOfTimeUnitsRecovery!;
    _timeUnitConverter.baseTimeUnitIndex = _baseTimeUnitIndexRecovery!;

    TimeUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTimeUnitsAndBaseTimeUnitIndex(
      _timeUnitConverter,
      _keyValueDatabase,
      listOfTimeUnits,
      baseTimeUnitIndex,
    );

    _listOfTimeUnitsRecovery = null;
    _baseTimeUnitIndexRecovery = null;
  }

  void dismissRecovery() {
    _listOfTimeUnitsRecovery = null;
    _baseTimeUnitIndexRecovery = null;
  }
}
