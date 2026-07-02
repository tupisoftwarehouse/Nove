import "package:flutter_test/flutter_test.dart";
import "package:nove/domain/measure_unit_converter/internals/checker/measure_unit_converter_checker.dart";

void main() {
  group("Test \"MeasureUnitConverterChecker\" Module", () {
    test(
      "Test If Function \"isBaseUnitValueDeleted\" Returns True If Base Unit Value Is Deleted",
      () {
        final baseUnitValueIsDeleted = isBaseUnitValueDeleted(0, 0);

        final baseUnitValueIsNotDeleted = isBaseUnitValueDeleted(0, 1);

        expect(baseUnitValueIsDeleted, true);
        expect(baseUnitValueIsNotDeleted, false);
      },
    );
  });
}
