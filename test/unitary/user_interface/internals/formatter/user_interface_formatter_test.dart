import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/measure_unit_converter_constants.dart"
    as measure_unit_converter_constants;
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/formatter/user_interface_formatter.dart";

void main() {
  group("Test \"UserInterfaceFormatter\" Class", () {
    test(
      "Test If Method \"getRoundNumberValue\" Returns Round String Value Integer If Value Ands With Round Floating String Point ",
      () {
        final formattedValue = UserInterfaceFormatter.getRoundNumberValue(
          measure_unit_converter_constants.NOT_ROUND_VALUE,
        );

        expect(formattedValue, measure_unit_converter_constants.ROUND_VALUE);
      },
    );

    test(
      "Test If Method \"getPaddedValue\" Returns String Value Padded With Leading Zeros Based On Defined Padding Constants",
      () {
        final paddedValue = UserInterfaceFormatter.getPaddedValue(
          UNPADDED_VALUE,
        );

        expect(paddedValue, PADDED_VALUE);
      },
    );
  });
}
