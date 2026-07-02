import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";

class TimeUnitConverter {
  final MeasureUnitConverter<TimeUnit> _measureUnitConverter;

  TimeUnitConverter(this._measureUnitConverter);

  void addTimeUnit() {
    _measureUnitConverter.addMeasureUnit();
  }

  void addTimeUnitAt(int index) {
    _measureUnitConverter.addMeasureUnitAt(index);
  }

  void updateBaseTimeUnitIndex(int updatedBaseTimeUnitElementIndex) {
    _measureUnitConverter.updateBaseMeasureUnitIndex(
      updatedBaseTimeUnitElementIndex,
    );
  }

  void updateTimeUnitAt(
    TimeUnitEntity updatedTimeUnit,
    int updatedTimeUnitIndex,
  ) {
    _measureUnitConverter.updateMeasureUnitAt(
      updatedTimeUnit,
      updatedTimeUnitIndex,
    );
  }

  void removeTimeUnit(int indexOfTimeUnitToBeRemoved) {
    _measureUnitConverter.removeMeasureUnitAt(indexOfTimeUnitToBeRemoved);
  }

  void reset() {
    _measureUnitConverter.reset();
  }

  int get baseTimeUnitIndex {
    return _measureUnitConverter.baseMeasureUnitIndex;
  }

  set baseTimeUnitIndex(int baseTimeUnitIndex) {
    _measureUnitConverter.baseMeasureUnitIndex = baseTimeUnitIndex;
  }

  List<TimeUnitEntity> get listOfTimeUnits {
    return _measureUnitConverter.listOfMeasureUnits.cast<TimeUnitEntity>();
  }

  set listOfTimeUnits(List<TimeUnitEntity> listOfTimeUnits) {
    _measureUnitConverter.listOfMeasureUnits = listOfTimeUnits;
  }
}
