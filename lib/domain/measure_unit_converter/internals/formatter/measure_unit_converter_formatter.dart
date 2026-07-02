import "package:nove/constants/domains/measure_unit_converter_constants.dart";

class MeasureUnitConverterFormatter {
  MeasureUnitConverterFormatter._();

  static String getValueWithFixedTruncation(String value) {
    try {
      return double.parse(value).toStringAsFixed(
        MEASURE_UNITE_VALUE_FLOATING_POINT_FIXED_TRUNCATION_LENGTH,
      );
    } catch (_) {
      return value;
    }
  }

  static String getRoundNumberValue(String value) {
    return value
        .replaceAllMapped(
          REMOVE_UNNECESSARY_TRAILING_ZEROES_FROM_VALUE_REGULAR_EXPRESSION,
          (match) {
            return match.group(
              VALUE_WITHOUT_UNNECESSARY_TRAILING_ZEROES_GROUP,
            )!;
          },
        )
        .replaceAll(REMOVE_UNNECESSARY_ZEROS_FROM_VALUE_REGEX, "")
        .replaceAll(
          REMOVE_UNNECESSARY_TRAILING_DOTS_FROM_VALUE_REGULAR_EXPRESSION,
          "",
        );
  }
}
