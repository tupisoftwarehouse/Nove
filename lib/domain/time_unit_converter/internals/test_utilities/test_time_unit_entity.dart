import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";

class TestTimeUnitEntity extends TimeUnitEntity {
  final void Function(MeasureUnitEntity<TimeUnit>) _convertTo;

  TestTimeUnitEntity(super.value, super.measureUnit, this._convertTo);

  @override
  void convertTo(MeasureUnitEntity<TimeUnit> measureUnit) {
    _convertTo(measureUnit);
  }
}
