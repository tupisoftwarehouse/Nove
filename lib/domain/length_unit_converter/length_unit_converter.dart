import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

class LengthUnitConverter {
  final MeasureUnitConverter<LengthUnit> _measureUnitConverter;

  LengthUnitConverter(this._measureUnitConverter);

  void addLengthUnit() {
    _measureUnitConverter.addMeasureUnit();
  }

  void addLengthUnitAt(int indexOfLengthUnitToBeAdded) {
    _measureUnitConverter.addMeasureUnitAt(indexOfLengthUnitToBeAdded);
  }

  void updateBaseLengthUnitIndex(int updatedBaseLengthUnitElementIndex) {
    _measureUnitConverter.updateBaseMeasureUnitIndex(
      updatedBaseLengthUnitElementIndex,
    );
  }

  void updateLengthUnitAt(
    LengthUnitEntity updatedLengthUnit,
    int updatedLengthUnitIndex,
  ) {
    _measureUnitConverter.updateMeasureUnitAt(
      updatedLengthUnit,
      updatedLengthUnitIndex,
    );
  }

  void removeLengthUnit(int indexOfLengthUnitToBeRemoved) {
    _measureUnitConverter.removeMeasureUnitAt(indexOfLengthUnitToBeRemoved);
  }

  void reset() {
    _measureUnitConverter.reset();
  }

  int get baseLengthUnitIndex {
    return _measureUnitConverter.baseMeasureUnitIndex;
  }

  set baseLengthUnitIndex(int baseLengthUnitIndex) {
    _measureUnitConverter.baseMeasureUnitIndex = baseLengthUnitIndex;
  }

  List<LengthUnitEntity> get listOfLengthUnits {
    return _measureUnitConverter.listOfMeasureUnits.cast<LengthUnitEntity>();
  }

  set listOfLengthUnits(List<LengthUnitEntity> listOfLengthUnits) {
    _measureUnitConverter.listOfMeasureUnits = listOfLengthUnits;
  }
}
