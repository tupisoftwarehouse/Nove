import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/temperature_unit_converter_data_synchronizing_transaction_script.dart";

class TemperatureUnitConverterViewModel {
  final TemperatureUnitConverter _temperatureUnitConverter;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<List<TemperatureUnitEntity>> listOfTemperatureUnits;
  final ValueNotifier<int> baseTemperatureUnitIndex;
  List<TemperatureUnitEntity>? _listOfTemperatureUnitsRecovery;
  int? _baseTemperatureUnitIndexRecovery;

  TemperatureUnitConverterViewModel(
    this._temperatureUnitConverter,
    this._keyValueDatabase,
  ) : listOfTemperatureUnits = ValueNotifier<List<TemperatureUnitEntity>>(
        _temperatureUnitConverter.listOfTemperatureUnits,
      ),
      baseTemperatureUnitIndex = ValueNotifier<int>(
        _temperatureUnitConverter.baseTemperatureUnitIndex,
      );

  void addTemperatureUnit() {
    _temperatureUnitConverter.addTemperatureUnit();

    TemperatureUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex(
      _temperatureUnitConverter,
      _keyValueDatabase,
      listOfTemperatureUnits,
      baseTemperatureUnitIndex,
    );
  }

  void addTemperatureUnitAt(int indexOfTemperatureUnitToBeAdded) {
    _temperatureUnitConverter.addTemperatureUnitAt(
      indexOfTemperatureUnitToBeAdded,
    );

    TemperatureUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex(
      _temperatureUnitConverter,
      _keyValueDatabase,
      listOfTemperatureUnits,
      baseTemperatureUnitIndex,
    );
  }

  void updateBaseTemperatureUnitIndex(
    int updatedBaseTemperatureUnitElementIndex,
  ) {
    _temperatureUnitConverter.updateBaseTemperatureUnitIndex(
      updatedBaseTemperatureUnitElementIndex,
    );

    TemperatureUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex(
      _temperatureUnitConverter,
      _keyValueDatabase,
      listOfTemperatureUnits,
      baseTemperatureUnitIndex,
    );
  }

  void updateTemperatureUnitAt(
    TemperatureUnitEntity updatedTemperatureUnit,
    int updatedTemperatureUnitIndex,
  ) {
    _temperatureUnitConverter.updateTemperatureUnitAt(
      updatedTemperatureUnit,
      updatedTemperatureUnitIndex,
    );

    TemperatureUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex(
      _temperatureUnitConverter,
      _keyValueDatabase,
      listOfTemperatureUnits,
      baseTemperatureUnitIndex,
    );
  }

  void removeTemperatureUnit(int indexOfTemperatureUnitToBeRemoved) {
    _temperatureUnitConverter.removeTemperatureUnit(
      indexOfTemperatureUnitToBeRemoved,
    );

    TemperatureUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex(
      _temperatureUnitConverter,
      _keyValueDatabase,
      listOfTemperatureUnits,
      baseTemperatureUnitIndex,
    );
  }

  void reset() {
    _listOfTemperatureUnitsRecovery =
        _temperatureUnitConverter.listOfTemperatureUnits;

    _baseTemperatureUnitIndexRecovery =
        _temperatureUnitConverter.baseTemperatureUnitIndex;

    _temperatureUnitConverter.reset();

    TemperatureUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex(
      _temperatureUnitConverter,
      _keyValueDatabase,
      listOfTemperatureUnits,
      baseTemperatureUnitIndex,
    );
  }

  void restore() {
    _temperatureUnitConverter.listOfTemperatureUnits =
        _listOfTemperatureUnitsRecovery!;
    _temperatureUnitConverter.baseTemperatureUnitIndex =
        _baseTemperatureUnitIndexRecovery!;

    TemperatureUnitConverterDataSynchronizingTransactionScript.synchronizeListOfTemperatureUnitsAndBaseTemperatureUnitIndex(
      _temperatureUnitConverter,
      _keyValueDatabase,
      listOfTemperatureUnits,
      baseTemperatureUnitIndex,
    );

    _listOfTemperatureUnitsRecovery = null;
    _baseTemperatureUnitIndexRecovery = null;
  }

  void dismissRecovery() {
    _listOfTemperatureUnitsRecovery = null;
    _baseTemperatureUnitIndexRecovery = null;
  }
}
