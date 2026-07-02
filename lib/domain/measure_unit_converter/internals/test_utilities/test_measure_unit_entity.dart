import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class TestMeasureUnitEntity<T> extends MeasureUnitEntity<T> {
  final void Function(MeasureUnitEntity<T>) _convertTo;

  TestMeasureUnitEntity(super.value, super.measureUnit, this._convertTo);

  @override
  void convertTo(MeasureUnitEntity<T> measureUnit) {
    _convertTo(measureUnit);
  }
}
