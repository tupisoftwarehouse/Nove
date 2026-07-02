import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/measure_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/convert_measure_unit_command.dart";
import "package:nove/domain/measure_unit_converter/internals/test_utilities/test_measure_unit_entity.dart";

void main() {
  group("Test \"ConvertMeasureUnitCommand\" Class", () {
    test(
      "Test If Method \"execute\" Converts All Measure Units From List Of Measure Units To Measure Unit To Convert To",
      () {
        bool isMeasureUnitConverted = false;

        final measureUnitToBeConverted = TestMeasureUnitEntity(
          MEASURE_UNIT_VALUE,
          MEASURE_UNIT_NAME,
          (_) {
            isMeasureUnitConverted = true;
          },
        );

        final measureUnitToConvertTo = TestMeasureUnitEntity(
          "1",
          MEASURE_UNIT_NAME,
          (_) {},
        );

        ConvertMeasureUnitCommand.execute([
          measureUnitToBeConverted,
        ], measureUnitToConvertTo);

        expect(isMeasureUnitConverted, true);
      },
    );
  });
}
