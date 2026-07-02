import "package:nove/domain/measure_unit_converter/convert_measure_unit_command.dart";
import "package:nove/domain/measure_unit_converter/internals/checker/measure_unit_converter_checker.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class MeasureUnitConverter<T> {
  final MeasureUnitEntity<T> _zeroedMeasureUnitInstance;
  List<MeasureUnitEntity<T>> listOfMeasureUnits;
  int baseMeasureUnitIndex;

  MeasureUnitConverter(
    this._zeroedMeasureUnitInstance,
    this.listOfMeasureUnits,
    this.baseMeasureUnitIndex,
  );

  void addMeasureUnit() {
    final baseMeasureUnitElement = listOfMeasureUnits[baseMeasureUnitIndex];

    listOfMeasureUnits.add(baseMeasureUnitElement);
  }

  void addMeasureUnitAt(int indexOfMeasureUnitToBeAdded) {
    final baseMeasureUnitElement = listOfMeasureUnits[baseMeasureUnitIndex];

    listOfMeasureUnits.insert(
      indexOfMeasureUnitToBeAdded,
      baseMeasureUnitElement,
    );
  }

  void updateBaseMeasureUnitIndex(int updatedBaseMeasureUnitElementIndex) {
    final updatedBaseMeasureUnitElement =
        listOfMeasureUnits[updatedBaseMeasureUnitElementIndex];

    baseMeasureUnitIndex = updatedBaseMeasureUnitElementIndex;

    ConvertMeasureUnitCommand.execute(
      listOfMeasureUnits,
      updatedBaseMeasureUnitElement,
    );
  }

  void updateMeasureUnitAt(
    MeasureUnitEntity<T> updatedMeasureUnit,
    int updatedMeasureUnitIndex,
  ) {
    listOfMeasureUnits[updatedMeasureUnitIndex] = updatedMeasureUnit;

    baseMeasureUnitIndex = updatedMeasureUnitIndex;

    ConvertMeasureUnitCommand.execute(listOfMeasureUnits, updatedMeasureUnit);
  }

  void removeMeasureUnitAt(int indexOfMeasureUnitToBeRemoved) {
    listOfMeasureUnits.removeAt(indexOfMeasureUnitToBeRemoved);

    if (isBaseUnitValueDeleted(
      indexOfMeasureUnitToBeRemoved,
      baseMeasureUnitIndex,
    )) {
      baseMeasureUnitIndex = baseMeasureUnitIndex - 1;
    }
  }

  void reset() {
    listOfMeasureUnits = [_zeroedMeasureUnitInstance];

    baseMeasureUnitIndex = 0;
  }
}
