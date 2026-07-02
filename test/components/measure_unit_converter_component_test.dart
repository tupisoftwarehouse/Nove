import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/measure_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

void main() {
  group("Test \"MeasureUnitConverter\" Component", () {
    late bool isMeasureUnitConverted;
    late var measureUnitToBeConvertedImplementation =
        MEASURE_UNIT_TO_BE_CONVERTED<String>((_) {
          isMeasureUnitConverted = true;
        });
    late MeasureUnitConverter<String> measureUnitConverter;

    setUp(() {
      isMeasureUnitConverted = false;

      measureUnitConverter = MeasureUnitConverter<String>(
        ZEROED_MEASURE_UNIT(),
        [measureUnitToBeConvertedImplementation],
        0,
      );
    });

    test("Test Adding Base Measure Unit To List Of Measure Units", () {
      measureUnitConverter.addMeasureUnit();

      expect(measureUnitConverter.listOfMeasureUnits.length, 2);

      expect(
        measureUnitConverter.listOfMeasureUnits[1].value,
        measureUnitToBeConvertedImplementation.value,
      );
      expect(
        measureUnitConverter.listOfMeasureUnits[1].measureUnit,
        measureUnitToBeConvertedImplementation.measureUnit,
      );
    });

    test(
      "Test Adding Measure Unit At A Given Index To List Of Measure Units",
      () {
        measureUnitConverter.addMeasureUnitAt(1);

        expect(measureUnitConverter.listOfMeasureUnits.length, 2);

        expect(
          measureUnitConverter.listOfMeasureUnits[1].value,
          measureUnitToBeConvertedImplementation.value,
        );
        expect(
          measureUnitConverter.listOfMeasureUnits[1].measureUnit,
          measureUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );

    test(
      "Test Updating Base Measure Unit Index And Convert All Measure Units To Updated Measure Unit",
      () {
        measureUnitConverter =
            MeasureUnitConverter<String>(ZEROED_MEASURE_UNIT(), [
              measureUnitToBeConvertedImplementation,
              measureUnitToBeConvertedImplementation,
            ], 0);

        measureUnitConverter.updateBaseMeasureUnitIndex(1);

        expect(measureUnitConverter.baseMeasureUnitIndex, 1);
        expect(isMeasureUnitConverted, true);
      },
    );

    test(
      "Test Updating Measure Unit At A Given Index And Convert All Measure Units To Updated Measure Unit",
      () {
        bool isMeasureUnitUpdated = false;

        final updatedMeasureUnitImplementation = UPDATED_MEASURE_UNIT<String>((
          _,
        ) {
          isMeasureUnitUpdated = true;
        });

        measureUnitConverter =
            MeasureUnitConverter<String>(ZEROED_MEASURE_UNIT(), [
              measureUnitToBeConvertedImplementation,
              measureUnitToBeConvertedImplementation,
            ], 0);

        measureUnitConverter.updateMeasureUnitAt(
          updatedMeasureUnitImplementation,
          1,
        );

        expect(isMeasureUnitUpdated, true);
        expect(measureUnitConverter.baseMeasureUnitIndex, 1);

        expect(
          measureUnitConverter.listOfMeasureUnits[1].value,
          updatedMeasureUnitImplementation.value,
        );
        expect(
          measureUnitConverter.listOfMeasureUnits[1].measureUnit,
          updatedMeasureUnitImplementation.measureUnit,
        );
      },
    );

    test(
      "Test Removing Measure Unit At A Given Index From List Of Measure Units",
      () {
        measureUnitConverter =
            MeasureUnitConverter<String>(ZEROED_MEASURE_UNIT(), [
              measureUnitToBeConvertedImplementation,
              measureUnitToBeConvertedImplementation,
            ], 0);

        measureUnitConverter.removeMeasureUnitAt(1);

        expect(measureUnitConverter.listOfMeasureUnits.length, 1);
      },
    );

    test(
      "Test Resetting List Of Measure Units To One Base Measure Unit Element",
      () {
        measureUnitConverter =
            MeasureUnitConverter<String>(ZEROED_MEASURE_UNIT(), [
              measureUnitToBeConvertedImplementation,
              measureUnitToBeConvertedImplementation,
            ], 0);

        measureUnitConverter.reset();

        expect(measureUnitConverter.listOfMeasureUnits.length, 1);
        expect(measureUnitConverter.baseMeasureUnitIndex, 0);

        expect(
          measureUnitConverter.listOfMeasureUnits[0].value,
          measureUnitToBeConvertedImplementation.value,
        );
        expect(
          measureUnitConverter.listOfMeasureUnits[0].measureUnit,
          measureUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );
  });
}
