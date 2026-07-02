import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

class MassUnitConverter {
  final MeasureUnitConverter<MassUnit> _measureUnitConverter;

  MassUnitConverter(this._measureUnitConverter);

  void addMassUnit() {
    _measureUnitConverter.addMeasureUnit();
  }

  void addMassUnitAt(int indexOfMassUnitToBeAdded) {
    _measureUnitConverter.addMeasureUnitAt(indexOfMassUnitToBeAdded);
  }

  void updateBaseMassUnitIndex(int updatedBaseMassUnitElementIndex) {
    _measureUnitConverter.updateBaseMeasureUnitIndex(
      updatedBaseMassUnitElementIndex,
    );
  }

  void updateMassUnitAt(
    MassUnitEntity updatedMassUnit,
    int updatedMassUnitIndex,
  ) {
    _measureUnitConverter.updateMeasureUnitAt(
      updatedMassUnit,
      updatedMassUnitIndex,
    );
  }

  void removeMassUnit(int indexOfMassUnitToBeRemoved) {
    _measureUnitConverter.removeMeasureUnitAt(indexOfMassUnitToBeRemoved);
  }

  void reset() {
    _measureUnitConverter.reset();
  }

  int get baseMassUnitIndex {
    return _measureUnitConverter.baseMeasureUnitIndex;
  }

  set baseMassUnitIndex(int baseMassUnitIndex) {
    _measureUnitConverter.baseMeasureUnitIndex = baseMassUnitIndex;
  }

  List<MassUnitEntity> get listOfMassUnits {
    return _measureUnitConverter.listOfMeasureUnits.cast<MassUnitEntity>();
  }

  set listOfMassUnits(List<MassUnitEntity> listOfMassUnits) {
    _measureUnitConverter.listOfMeasureUnits = listOfMassUnits;
  }
}
