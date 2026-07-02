import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/measure_unit_converter_constants.dart";

void main() {
  group("Test \"MeasureUnitEntity\" Entity", () {
    test(
      "Test If Value Is Fixed If Value Is A Long Floating Point Precision",
      () {
        final instance = MEASURE_UNIT_TO_CONVERT_TO((_) {});

        instance.value = NOT_FIXED_POINT_VALUE;

        expect(instance.value, FIXED_POINT_VALUE);
      },
    );

    test(
      "Test If Value Is Round Integer String If Value Ands With Round Floating String Point",
      () {
        final instance = MEASURE_UNIT_TO_CONVERT_TO((_) {});

        instance.value = NOT_ROUND_VALUE;

        expect(instance.value, ROUND_VALUE);
      },
    );
  });
}
