import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";

class NumberSystemConverter {
  final MeasureUnitConverter<NumberSystem> _measureUnitConverter;

  NumberSystemConverter(this._measureUnitConverter);

  void addNumberSystem() {
    _measureUnitConverter.addMeasureUnit();
  }

  void addNumberSystemAt(int indexOfNumberSystemToBeAdded) {
    _measureUnitConverter.addMeasureUnitAt(indexOfNumberSystemToBeAdded);
  }

  void updateBaseNumberSystemIndex(int updatedBaseNumberSystemElementIndex) {
    _measureUnitConverter.updateBaseMeasureUnitIndex(
      updatedBaseNumberSystemElementIndex,
    );
  }

  void updateNumberSystemAt(
    NumberSystemEntity updatedNumberSystem,
    int updatedNumberSystemIndex,
  ) {
    _measureUnitConverter.updateMeasureUnitAt(
      updatedNumberSystem,
      updatedNumberSystemIndex,
    );
  }

  void removeNumberSystem(int indexOfNumberSystemToBeRemoved) {
    _measureUnitConverter.removeMeasureUnitAt(indexOfNumberSystemToBeRemoved);
  }

  void reset() {
    _measureUnitConverter.reset();
  }

  int get baseNumberSystemIndex {
    return _measureUnitConverter.baseMeasureUnitIndex;
  }

  set baseNumberSystemIndex(int baseNumberSystemIndex) {
    _measureUnitConverter.baseMeasureUnitIndex = baseNumberSystemIndex;
  }

  List<NumberSystemEntity> get listOfNumberSystems {
    return _measureUnitConverter.listOfMeasureUnits.cast<NumberSystemEntity>();
  }

  set listOfNumberSystems(List<NumberSystemEntity> listOfNumberSystems) {
    _measureUnitConverter.listOfMeasureUnits = listOfNumberSystems;
  }
}
