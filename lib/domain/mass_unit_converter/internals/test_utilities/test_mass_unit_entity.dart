import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class TestMassUnitEntity extends MassUnitEntity {
  final void Function(MeasureUnitEntity<MassUnit>) _convertTo;

  TestMassUnitEntity(super.value, super.measureUnit, this._convertTo);

  @override
  void convertTo(MeasureUnitEntity<MassUnit> measureUnit) {
    _convertTo(measureUnit);
  }
}
