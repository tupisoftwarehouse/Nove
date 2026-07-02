import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";

class TestTemperatureUnitEntity extends TemperatureUnitEntity {
  final void Function(MeasureUnitEntity<TemperatureUnit>) _convertTo;

  TestTemperatureUnitEntity(super.value, super.measureUnit, this._convertTo);

  @override
  void convertTo(MeasureUnitEntity<TemperatureUnit> measureUnit) {
    _convertTo(measureUnit);
  }
}
