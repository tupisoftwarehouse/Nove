import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

void main() {
  group("Test \"LengthUnitConverter\" Component", () {
    late bool isLengthUnitConverted;
    final lengthUnitToBeConvertedImplementation = LENGTH_UNIT_TO_CONVERT_TO((
      _,
    ) {
      isLengthUnitConverted = true;
    });
    late LengthUnitConverter lengthUnitConverter;
    late MeasureUnitConverter<LengthUnit> measureUnitConverter;

    setUp(() {
      isLengthUnitConverted = false;

      measureUnitConverter = MeasureUnitConverter<LengthUnit>(
        ZEROED_LENGTH_UNIT,
        [lengthUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<LengthUnit>>,
        0,
      );

      lengthUnitConverter = LengthUnitConverter(measureUnitConverter);
    });

    test("Test Adding Base Length Unit To List Of Length Units", () {
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
    });

    test(
      "Test Adding Length Unit At A Given Index To List Of Length Units",
      () {
        lengthUnitConverter.addLengthUnitAt(1);

        expect(lengthUnitConverter.listOfLengthUnits.length, 2);

        expect(
          lengthUnitConverter.listOfLengthUnits[1].value,
          lengthUnitToBeConvertedImplementation.value,
        );
        expect(
          lengthUnitConverter.listOfLengthUnits[1].measureUnit,
          lengthUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );

    test(
      "Test Updating Base Length Unit Index And Converts All Length Units",
      () {
        measureUnitConverter = MeasureUnitConverter<LengthUnit>(
          ZEROED_LENGTH_UNIT,
          [
                lengthUnitToBeConvertedImplementation,
                lengthUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<LengthUnit>>,
          0,
        );

        lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

        lengthUnitConverter.updateBaseLengthUnitIndex(1);

        expect(lengthUnitConverter.baseLengthUnitIndex, 1);

        expect(isLengthUnitConverted, true);
      },
    );

    test(
      "Test Updating Length Unit At A Given Index And Converts All Length Units",
      () {
        bool isMeasureUnitUpdated = false;

        final updatedLengthUnitImplementation = UPDATED_LENGTH_UNIT((_) {
          isMeasureUnitUpdated = true;
        });

        measureUnitConverter = MeasureUnitConverter<LengthUnit>(
          ZEROED_LENGTH_UNIT,
          [
                lengthUnitToBeConvertedImplementation,
                lengthUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<LengthUnit>>,
          0,
        );

        lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

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
      },
    );

    test(
      "Test Removing Length Unit At A Given Index From List Of Length Units",
      () {
        measureUnitConverter = MeasureUnitConverter<LengthUnit>(
          ZEROED_LENGTH_UNIT,
          [
                lengthUnitToBeConvertedImplementation,
                lengthUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<LengthUnit>>,
          0,
        );

        lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

        lengthUnitConverter.removeLengthUnit(1);

        expect(lengthUnitConverter.listOfLengthUnits.length, 1);
      },
    );

    test(
      "Test Resetting List Of Length Units To One Base Length Unit Element",
      () {
        measureUnitConverter = MeasureUnitConverter<LengthUnit>(
          ZEROED_LENGTH_UNIT,
          [lengthUnitToBeConvertedImplementation]
              as List<MeasureUnitEntity<LengthUnit>>,
          0,
        );

        lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

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
