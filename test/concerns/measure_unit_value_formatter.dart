import "package:nove/domain/measure_unit_converter/internals/formatter/measure_unit_converter_formatter.dart";

class MeasureUnitValueFormatter {
  MeasureUnitValueFormatter._();

  static String getFormattedValue(String value, double conversionMultiplier) {
    final valueToBeFormatted = double.parse(value) * conversionMultiplier;
    final valueWithFixedTruncation =
        MeasureUnitConverterFormatter.getValueWithFixedTruncation(
          valueToBeFormatted.toString(),
        );

    return MeasureUnitConverterFormatter.getRoundNumberValue(
      valueWithFixedTruncation,
    );
  }
}
