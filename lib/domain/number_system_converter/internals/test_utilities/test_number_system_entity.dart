import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";

class TestNumberSystemEntity extends NumberSystemEntity {
  final void Function(MeasureUnitEntity<NumberSystem>) _convertTo;

  TestNumberSystemEntity(super.value, super.measureUnit, this._convertTo);

  @override
  void convertTo(MeasureUnitEntity<NumberSystem> measureUnit) {
    _convertTo(measureUnit);
  }
}
