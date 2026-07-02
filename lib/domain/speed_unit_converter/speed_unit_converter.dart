import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";

class SpeedUnitConverter {
  final MeasureUnitConverter<SpeedUnit> _measureUnitConverter;

  SpeedUnitConverter(this._measureUnitConverter);

  void addSpeedUnit() {
    _measureUnitConverter.addMeasureUnit();
  }

  void addSpeedUnitAt(int indexOfSpeedUnitToBeAdded) {
    _measureUnitConverter.addMeasureUnitAt(indexOfSpeedUnitToBeAdded);
  }

  void updateBaseSpeedUnitIndex(int updatedBaseSpeedUnitElementIndex) {
    _measureUnitConverter.updateBaseMeasureUnitIndex(
      updatedBaseSpeedUnitElementIndex,
    );
  }

  void updateSpeedUnitAt(
    SpeedUnitEntity updatedSpeedUnit,
    int updatedSpeedUnitIndex,
  ) {
    _measureUnitConverter.updateMeasureUnitAt(
      updatedSpeedUnit,
      updatedSpeedUnitIndex,
    );
  }

  void removeSpeedUnit(int indexOfSpeedUnitToBeRemoved) {
    _measureUnitConverter.removeMeasureUnitAt(indexOfSpeedUnitToBeRemoved);
  }

  void reset() {
    _measureUnitConverter.reset();
  }

  int get baseSpeedUnitIndex {
    return _measureUnitConverter.baseMeasureUnitIndex;
  }

  set baseSpeedUnitIndex(int baseSpeedUnitIndex) {
    _measureUnitConverter.baseMeasureUnitIndex = baseSpeedUnitIndex;
  }

  List<SpeedUnitEntity> get listOfSpeedUnits {
    return _measureUnitConverter.listOfMeasureUnits.cast<SpeedUnitEntity>();
  }

  set listOfSpeedUnits(List<SpeedUnitEntity> listOfSpeedUnits) {
    _measureUnitConverter.listOfMeasureUnits = listOfSpeedUnits;
  }
}
