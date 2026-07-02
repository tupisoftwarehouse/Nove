import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/area_unit_converter_data_synchronizing_transaction_script.dart";

class AreaUnitConverterViewModel {
  final AreaUnitConverter _areaUnitConverter;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<List<AreaUnitEntity>> listOfAreaUnits;
  final ValueNotifier<int> baseAreaUnitIndex;
  List<AreaUnitEntity>? _listOfAreaUnitsRecovery;
  int? _baseAreaUnitIndexRecovery;

  AreaUnitConverterViewModel(this._areaUnitConverter, this._keyValueDatabase)
    : listOfAreaUnits = ValueNotifier<List<AreaUnitEntity>>(
        _areaUnitConverter.listOfAreaUnits,
      ),
      baseAreaUnitIndex = ValueNotifier<int>(
        _areaUnitConverter.baseAreaUnitIndex,
      );

  void addAreaUnit() {
    _areaUnitConverter.addAreaUnit();

    AreaUnitConverterDataSynchronizingTransactionScript.synchronizeListOfAreaUnitsAndBaseAreaUnitIndex(
      _areaUnitConverter,
      _keyValueDatabase,
      listOfAreaUnits,
      baseAreaUnitIndex,
    );
  }

  void addAreaUnitAt(int indexOfAreaUnitToBeAdded) {
    _areaUnitConverter.addAreaUnitAt(indexOfAreaUnitToBeAdded);

    AreaUnitConverterDataSynchronizingTransactionScript.synchronizeListOfAreaUnitsAndBaseAreaUnitIndex(
      _areaUnitConverter,
      _keyValueDatabase,
      listOfAreaUnits,
      baseAreaUnitIndex,
    );
  }

  void updateBaseAreaUnitIndex(int updatedBaseAreaUnitElementIndex) {
    _areaUnitConverter.updateBaseAreaUnitIndex(updatedBaseAreaUnitElementIndex);

    AreaUnitConverterDataSynchronizingTransactionScript.synchronizeListOfAreaUnitsAndBaseAreaUnitIndex(
      _areaUnitConverter,
      _keyValueDatabase,
      listOfAreaUnits,
      baseAreaUnitIndex,
    );
  }

  void updateAreaUnitAt(
    AreaUnitEntity updatedAreaUnit,
    int updatedAreaUnitIndex,
  ) {
    _areaUnitConverter.updateAreaUnitAt(updatedAreaUnit, updatedAreaUnitIndex);

    AreaUnitConverterDataSynchronizingTransactionScript.synchronizeListOfAreaUnitsAndBaseAreaUnitIndex(
      _areaUnitConverter,
      _keyValueDatabase,
      listOfAreaUnits,
      baseAreaUnitIndex,
    );
  }

  void removeAreaUnit(int indexOfAreaUnitToBeRemoved) {
    _areaUnitConverter.removeAreaUnit(indexOfAreaUnitToBeRemoved);

    AreaUnitConverterDataSynchronizingTransactionScript.synchronizeListOfAreaUnitsAndBaseAreaUnitIndex(
      _areaUnitConverter,
      _keyValueDatabase,
      listOfAreaUnits,
      baseAreaUnitIndex,
    );
  }

  void reset() {
    _listOfAreaUnitsRecovery = _areaUnitConverter.listOfAreaUnits;
    _baseAreaUnitIndexRecovery = _areaUnitConverter.baseAreaUnitIndex;

    _areaUnitConverter.reset();

    AreaUnitConverterDataSynchronizingTransactionScript.synchronizeListOfAreaUnitsAndBaseAreaUnitIndex(
      _areaUnitConverter,
      _keyValueDatabase,
      listOfAreaUnits,
      baseAreaUnitIndex,
    );
  }

  void restore() {
    _areaUnitConverter.listOfAreaUnits = _listOfAreaUnitsRecovery!;
    _areaUnitConverter.baseAreaUnitIndex = _baseAreaUnitIndexRecovery!;

    AreaUnitConverterDataSynchronizingTransactionScript.synchronizeListOfAreaUnitsAndBaseAreaUnitIndex(
      _areaUnitConverter,
      _keyValueDatabase,
      listOfAreaUnits,
      baseAreaUnitIndex,
    );

    _listOfAreaUnitsRecovery = null;
    _baseAreaUnitIndexRecovery = null;
  }

  void dismissRecovery() {
    _listOfAreaUnitsRecovery = null;
    _baseAreaUnitIndexRecovery = null;
  }
}
