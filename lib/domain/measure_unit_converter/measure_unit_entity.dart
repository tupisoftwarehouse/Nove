import "package:nove/domain/measure_unit_converter/internals/formatter/measure_unit_converter_formatter.dart";

abstract class MeasureUnitEntity<T> {
  String _value;
  final T measureUnit;

  MeasureUnitEntity(this._value, this.measureUnit);

  void convertTo(MeasureUnitEntity<T> measureUnit);

  String get value {
    return _value;
  }

  set value(String value) {
    final valueWithFixedTruncation =
        MeasureUnitConverterFormatter.getValueWithFixedTruncation(value);

    _value = MeasureUnitConverterFormatter.getRoundNumberValue(
      valueWithFixedTruncation,
    );
  }
}
