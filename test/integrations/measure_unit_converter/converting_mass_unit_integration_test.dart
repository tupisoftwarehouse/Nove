import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

void main() {
  group("Test \"Converting Mass Unit\" Integration", () {
    late bool isLengthUnitConverted;
    late bool isMeasureUnitUpdated;
    final lengthUnitToBeConvertedImplementation = LENGTH_UNIT_TO_CONVERT_TO((
      _,
    ) {
      isLengthUnitConverted = true;
    });
    final updatedLengthUnitImplementation = UPDATED_LENGTH_UNIT((_) {
      isMeasureUnitUpdated = true;
    });
    late LengthUnitConverter lengthUnitConverter;
    late MeasureUnitConverter<LengthUnit> measureUnitConverter;

    setUpAll(() {
      isLengthUnitConverted = false;
      isMeasureUnitUpdated = false;

      measureUnitConverter = MeasureUnitConverter<LengthUnit>(
        ZEROED_LENGTH_UNIT,
        [lengthUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<LengthUnit>>,
        0,
      );

      lengthUnitConverter = LengthUnitConverter(measureUnitConverter);
    });

    test(
      "Test Measure Unit Being Converted By \"MeasureUnitConverter\" On \"LengthUnitConverter\"",
      () {
        lengthUnitConverter.addLengthUnit();

        expect(lengthUnitConverter.listOfLengthUnits.length, 2);

        expect(
          lengthUnitConverter.listOfLengthUnits[1].value,
          lengthUnitToBeConvertedImplementation.value,
        );
        expect(
          lengthUnitConverter.listOfLengthUnits[1].measureUnit,
          lengthUnitToBeConvertedImplementation.measureUnit,
        );

        lengthUnitConverter.addLengthUnitAt(2);

        expect(lengthUnitConverter.listOfLengthUnits.length, 3);

        expect(
          lengthUnitConverter.listOfLengthUnits[2].value,
          lengthUnitToBeConvertedImplementation.value,
        );
        expect(
          lengthUnitConverter.listOfLengthUnits[2].measureUnit,
          lengthUnitToBeConvertedImplementation.measureUnit,
        );

        lengthUnitConverter.updateBaseLengthUnitIndex(1);

        expect(lengthUnitConverter.baseLengthUnitIndex, 1);

        expect(isLengthUnitConverted, true);

        lengthUnitConverter.updateLengthUnitAt(
          updatedLengthUnitImplementation,
          1,
        );

        expect(isMeasureUnitUpdated, true);

        expect(lengthUnitConverter.baseLengthUnitIndex, 1);

        expect(
          lengthUnitConverter.listOfLengthUnits[1].value,
          updatedLengthUnitImplementation.value,
        );
        expect(
          lengthUnitConverter.listOfLengthUnits[1].measureUnit,
          updatedLengthUnitImplementation.measureUnit,
        );

        lengthUnitConverter.removeLengthUnit(1);

        expect(lengthUnitConverter.listOfLengthUnits.length, 2);

        lengthUnitConverter.reset();

        expect(lengthUnitConverter.listOfLengthUnits.length, 1);

        expect(lengthUnitConverter.baseLengthUnitIndex, 0);

        expect(
          lengthUnitConverter.listOfLengthUnits[0].value,
          ZEROED_LENGTH_UNIT_VALUE,
        );
        expect(
          lengthUnitConverter.listOfLengthUnits[0].measureUnit,
          lengthUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );
  });
}
