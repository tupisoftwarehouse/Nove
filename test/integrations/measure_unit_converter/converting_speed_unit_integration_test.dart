import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";

void main() {
  group("Test \"Converting Speed Unit\" Integration", () {
    late bool isSpeedUnitConverted;
    late bool isMeasureUnitUpdated;
    final speedUnitToBeConvertedImplementation = SPEED_UNIT_TO_CONVERT_TO((_) {
      isSpeedUnitConverted = true;
    });
    final updatedSpeedUnitImplementation = UPDATED_SPEED_UNIT((_) {
      isMeasureUnitUpdated = true;
    });
    late SpeedUnitConverter speedUnitConverter;
    late MeasureUnitConverter<SpeedUnit> measureUnitConverter;

    setUpAll(() {
      isSpeedUnitConverted = false;
      isMeasureUnitUpdated = false;

      measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
        ZEROED_SPEED_UNIT,
        [speedUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<SpeedUnit>>,
        0,
      );

      speedUnitConverter = SpeedUnitConverter(measureUnitConverter);
    });

    test(
      "Test Measure Unit Being Converted By \"MeasureUnitConverter\" On \"SpeedUnitConverter\"",
      () {
        speedUnitConverter.addSpeedUnit();

        expect(speedUnitConverter.listOfSpeedUnits.length, 2);

        expect(
          speedUnitConverter.listOfSpeedUnits[1].value,
          speedUnitToBeConvertedImplementation.value,
        );
        expect(
          speedUnitConverter.listOfSpeedUnits[1].measureUnit,
          speedUnitToBeConvertedImplementation.measureUnit,
        );

        speedUnitConverter.addSpeedUnitAt(2);

        expect(speedUnitConverter.listOfSpeedUnits.length, 3);

        expect(
          speedUnitConverter.listOfSpeedUnits[2].value,
          speedUnitToBeConvertedImplementation.value,
        );
        expect(
          speedUnitConverter.listOfSpeedUnits[2].measureUnit,
          speedUnitToBeConvertedImplementation.measureUnit,
        );

        speedUnitConverter.updateBaseSpeedUnitIndex(1);

        expect(speedUnitConverter.baseSpeedUnitIndex, 1);

        expect(isSpeedUnitConverted, true);

        speedUnitConverter.updateSpeedUnitAt(updatedSpeedUnitImplementation, 1);

        expect(isMeasureUnitUpdated, true);

        expect(speedUnitConverter.baseSpeedUnitIndex, 1);

        expect(
          speedUnitConverter.listOfSpeedUnits[1].value,
          updatedSpeedUnitImplementation.value,
        );
        expect(
          speedUnitConverter.listOfSpeedUnits[1].measureUnit,
          updatedSpeedUnitImplementation.measureUnit,
        );

        speedUnitConverter.removeSpeedUnit(1);

        expect(speedUnitConverter.listOfSpeedUnits.length, 2);

        speedUnitConverter.reset();

        expect(speedUnitConverter.listOfSpeedUnits.length, 1);

        expect(speedUnitConverter.baseSpeedUnitIndex, 0);

        expect(
          speedUnitConverter.listOfSpeedUnits[0].value,
          ZEROED_SPEED_UNIT_VALUE,
        );

        expect(
          speedUnitConverter.listOfSpeedUnits[0].measureUnit,
          speedUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );
  });
}
