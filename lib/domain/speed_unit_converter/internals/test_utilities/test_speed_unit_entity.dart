import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";

class TestSpeedUnitEntity extends SpeedUnitEntity {
  final void Function(MeasureUnitEntity<SpeedUnit>) _convertTo;

  TestSpeedUnitEntity(super.value, super.measureUnit, this._convertTo);

  @override
  void convertTo(MeasureUnitEntity<SpeedUnit> measureUnit) {
    _convertTo(measureUnit);
  }
}
