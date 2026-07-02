import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/mass_unit_converter_data_synchronizing_transaction_script.dart";

class MassUnitConverterViewModel {
  final MassUnitConverter _massUnitConverter;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<List<MassUnitEntity>> listOfMassUnits;
  final ValueNotifier<int> baseMassUnitIndex;
  List<MassUnitEntity>? _listOfMassUnitsRecovery;
  int? _baseMassUnitIndexRecovery;

  MassUnitConverterViewModel(this._massUnitConverter, this._keyValueDatabase)
    : listOfMassUnits = ValueNotifier<List<MassUnitEntity>>(
        _massUnitConverter.listOfMassUnits,
      ),
      baseMassUnitIndex = ValueNotifier<int>(
        _massUnitConverter.baseMassUnitIndex,
      );

  void addMassUnit() {
    _massUnitConverter.addMassUnit();

    MassUnitConverterDataSynchronizingTransactionScript.synchronizeListOfMassUnitsAndBaseMassUnitIndex(
      _massUnitConverter,
      _keyValueDatabase,
      listOfMassUnits,
      baseMassUnitIndex,
    );
  }

  void addMassUnitAt(int indexOfMassUnitToBeAdded) {
    _massUnitConverter.addMassUnitAt(indexOfMassUnitToBeAdded);

    MassUnitConverterDataSynchronizingTransactionScript.synchronizeListOfMassUnitsAndBaseMassUnitIndex(
      _massUnitConverter,
      _keyValueDatabase,
      listOfMassUnits,
      baseMassUnitIndex,
    );
  }

  void updateBaseMassUnitIndex(int updatedBaseMassUnitElementIndex) {
    _massUnitConverter.updateBaseMassUnitIndex(updatedBaseMassUnitElementIndex);

    MassUnitConverterDataSynchronizingTransactionScript.synchronizeListOfMassUnitsAndBaseMassUnitIndex(
      _massUnitConverter,
      _keyValueDatabase,
      listOfMassUnits,
      baseMassUnitIndex,
    );
  }

  void updateMassUnitAt(
    MassUnitEntity updatedMassUnit,
    int updatedMassUnitIndex,
  ) {
    _massUnitConverter.updateMassUnitAt(updatedMassUnit, updatedMassUnitIndex);

    MassUnitConverterDataSynchronizingTransactionScript.synchronizeListOfMassUnitsAndBaseMassUnitIndex(
      _massUnitConverter,
      _keyValueDatabase,
      listOfMassUnits,
      baseMassUnitIndex,
    );
  }

  void removeMassUnit(int indexOfMassUnitToBeRemoved) {
    _massUnitConverter.removeMassUnit(indexOfMassUnitToBeRemoved);

    MassUnitConverterDataSynchronizingTransactionScript.synchronizeListOfMassUnitsAndBaseMassUnitIndex(
      _massUnitConverter,
      _keyValueDatabase,
      listOfMassUnits,
      baseMassUnitIndex,
    );
  }

  void reset() {
    _listOfMassUnitsRecovery = _massUnitConverter.listOfMassUnits;

    _baseMassUnitIndexRecovery = _massUnitConverter.baseMassUnitIndex;

    _massUnitConverter.reset();

    MassUnitConverterDataSynchronizingTransactionScript.synchronizeListOfMassUnitsAndBaseMassUnitIndex(
      _massUnitConverter,
      _keyValueDatabase,
      listOfMassUnits,
      baseMassUnitIndex,
    );
  }

  void restore() {
    _massUnitConverter.listOfMassUnits = _listOfMassUnitsRecovery!;
    _massUnitConverter.baseMassUnitIndex = _baseMassUnitIndexRecovery!;

    MassUnitConverterDataSynchronizingTransactionScript.synchronizeListOfMassUnitsAndBaseMassUnitIndex(
      _massUnitConverter,
      _keyValueDatabase,
      listOfMassUnits,
      baseMassUnitIndex,
    );

    _listOfMassUnitsRecovery = null;
    _baseMassUnitIndexRecovery = null;
  }

  void dismissRecovery() {
    _listOfMassUnitsRecovery = null;
    _baseMassUnitIndexRecovery = null;
  }
}
