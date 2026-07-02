import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";

class TemperatureUnitConverter {
  final MeasureUnitConverter<TemperatureUnit> _measureUnitConverter;

  TemperatureUnitConverter(this._measureUnitConverter);

  void addTemperatureUnit() {
    _measureUnitConverter.addMeasureUnit();
  }

  void addTemperatureUnitAt(int indexOfTemperatureUnitToBeAdded) {
    _measureUnitConverter.addMeasureUnitAt(indexOfTemperatureUnitToBeAdded);
  }

  void updateBaseTemperatureUnitIndex(
    int updatedBaseTemperatureUnitElementIndex,
  ) {
    _measureUnitConverter.updateBaseMeasureUnitIndex(
      updatedBaseTemperatureUnitElementIndex,
    );
  }

  void updateTemperatureUnitAt(
    TemperatureUnitEntity updatedTemperatureUnit,
    int updatedTemperatureUnitIndex,
  ) {
    _measureUnitConverter.updateMeasureUnitAt(
      updatedTemperatureUnit,
      updatedTemperatureUnitIndex,
    );
  }

  void removeTemperatureUnit(int indexOfTemperatureUnitToBeRemoved) {
    _measureUnitConverter.removeMeasureUnitAt(
      indexOfTemperatureUnitToBeRemoved,
    );
  }

  void reset() {
    _measureUnitConverter.reset();
  }

  int get baseTemperatureUnitIndex {
    return _measureUnitConverter.baseMeasureUnitIndex;
  }

  set baseTemperatureUnitIndex(int baseTemperatureUnitIndex) {
    _measureUnitConverter.baseMeasureUnitIndex = baseTemperatureUnitIndex;
  }

  List<TemperatureUnitEntity> get listOfTemperatureUnits {
    return _measureUnitConverter.listOfMeasureUnits
        .cast<TemperatureUnitEntity>();
  }

  set listOfTemperatureUnits(
    List<TemperatureUnitEntity> listOfTemperatureUnits,
  ) {
    _measureUnitConverter.listOfMeasureUnits = listOfTemperatureUnits;
  }
}
