import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class TestAreaUnitEntity extends AreaUnitEntity {
  final void Function(MeasureUnitEntity<AreaUnit>) _convertTo;

  TestAreaUnitEntity(super.value, super.measureUnit, this._convertTo);

  @override
  void convertTo(MeasureUnitEntity<AreaUnit> measureUnit) {
    _convertTo(measureUnit);
  }
}
