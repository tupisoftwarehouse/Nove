import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

class AreaUnitConverter {
  final MeasureUnitConverter<AreaUnit> _measureUnitConverter;

  AreaUnitConverter(this._measureUnitConverter);

  void addAreaUnit() {
    _measureUnitConverter.addMeasureUnit();
  }

  void addAreaUnitAt(int indexOfAreaUnitToBeAdded) {
    _measureUnitConverter.addMeasureUnitAt(indexOfAreaUnitToBeAdded);
  }

  void updateBaseAreaUnitIndex(int updatedBaseAreaUnitElementIndex) {
    _measureUnitConverter.updateBaseMeasureUnitIndex(
      updatedBaseAreaUnitElementIndex,
    );
  }

  void updateAreaUnitAt(
    AreaUnitEntity updatedAreaUnit,
    int updatedAreaUnitIndex,
  ) {
    _measureUnitConverter.updateMeasureUnitAt(
      updatedAreaUnit,
      updatedAreaUnitIndex,
    );
  }

  void removeAreaUnit(int indexOfAreaUnitToBeRemoved) {
    _measureUnitConverter.removeMeasureUnitAt(indexOfAreaUnitToBeRemoved);
  }

  void reset() {
    _measureUnitConverter.reset();
  }

  int get baseAreaUnitIndex {
    return _measureUnitConverter.baseMeasureUnitIndex;
  }

  List<AreaUnitEntity> get listOfAreaUnits {
    return _measureUnitConverter.listOfMeasureUnits.cast<AreaUnitEntity>();
  }

  set listOfAreaUnits(List<AreaUnitEntity> listOfAreaUnits) {
    _measureUnitConverter.listOfMeasureUnits = listOfAreaUnits;
  }

  set baseAreaUnitIndex(int baseAreaUnitIndex) {
    _measureUnitConverter.baseMeasureUnitIndex = baseAreaUnitIndex;
  }
}
