import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class TestLengthUnitEntity extends LengthUnitEntity {
  final void Function(MeasureUnitEntity<LengthUnit>) _convertTo;

  TestLengthUnitEntity(super.value, super.measureUnit, this._convertTo);

  @override
  void convertTo(MeasureUnitEntity<LengthUnit> measureUnit) {
    _convertTo(measureUnit);
  }
}
