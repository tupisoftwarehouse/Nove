import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/measure_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/internals/formatter/measure_unit_converter_formatter.dart";

void main() {
  group("Test \"MeasureUnitConverterFormatter\" Class", () {
    test(
      "Test If Method \"getValueWithFixedTruncation\" Returns Value With Fixed Truncation",
      () {
        final formattedValue =
            MeasureUnitConverterFormatter.getValueWithFixedTruncation(
              NOT_FIXED_POINT_VALUE,
            );

        expect(formattedValue, FIXED_POINT_VALUE);
      },
    );

    test(
      "Test If Method \"getValueWithFixedTruncation\" Returns Not Changed Value If Formatting Fails",
      () {
        final valueWithFixedTruncation =
            MeasureUnitConverterFormatter.getValueWithFixedTruncation("");

        expect(valueWithFixedTruncation, "");
      },
    );

    test(
      "Test If Method \"getRoundNumberValue\" Returns Round String Value Integer",
      () {
        final formattedValue =
            MeasureUnitConverterFormatter.getRoundNumberValue(NOT_ROUND_VALUE);

        expect(formattedValue, ROUND_VALUE);
      },
    );
  });
}
