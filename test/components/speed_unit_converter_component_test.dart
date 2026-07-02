import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";

void main() {
  group("Test \"SpeedUnitConverter\" Component", () {
    late bool isSpeedUnitConverted;
    final speedUnitToBeConvertedImplementation = SPEED_UNIT_TO_CONVERT_TO((_) {
      isSpeedUnitConverted = true;
    });
    late SpeedUnitConverter speedUnitConverter;
    late MeasureUnitConverter<SpeedUnit> measureUnitConverter;

    setUp(() {
      isSpeedUnitConverted = false;

      measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
        ZEROED_SPEED_UNIT,
        [speedUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<SpeedUnit>>,
        0,
      );

      speedUnitConverter = SpeedUnitConverter(measureUnitConverter);
    });

    test("Test Adding Base Speed Unit To List Of Speed Units", () {
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
    });

    test("Test Adding Speed Unit At A Given Index To List Of Speed Units", () {
      speedUnitConverter.addSpeedUnitAt(1);

      expect(speedUnitConverter.listOfSpeedUnits.length, 2);

      expect(
        speedUnitConverter.listOfSpeedUnits[1].value,
        speedUnitToBeConvertedImplementation.value,
      );
      expect(
        speedUnitConverter.listOfSpeedUnits[1].measureUnit,
        speedUnitToBeConvertedImplementation.measureUnit,
      );
    });

    test(
      "Test Updating Base Speed Unit Index And Converts All Speed Units",
      () {
        measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
          ZEROED_SPEED_UNIT,
          [
                speedUnitToBeConvertedImplementation,
                speedUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<SpeedUnit>>,
          0,
        );

        speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

        speedUnitConverter.updateBaseSpeedUnitIndex(1);

        expect(speedUnitConverter.baseSpeedUnitIndex, 1);

        expect(isSpeedUnitConverted, true);
      },
    );

    test(
      "Test Updating Speed Unit At A Given Index And Converts All Speed Units",
      () {
        bool isMeasureUnitUpdated = false;

        final updatedSpeedUnitImplementation = UPDATED_SPEED_UNIT((_) {
          isMeasureUnitUpdated = true;
        });

        measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
          ZEROED_SPEED_UNIT,
          [
                speedUnitToBeConvertedImplementation,
                speedUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<SpeedUnit>>,
          0,
        );

        speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

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
      },
    );

    test(
      "Test Removing Speed Unit At A Given Index From List Of Speed Units",
      () {
        measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
          ZEROED_SPEED_UNIT,
          [
                speedUnitToBeConvertedImplementation,
                speedUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<SpeedUnit>>,
          0,
        );

        speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

        speedUnitConverter.removeSpeedUnit(1);

        expect(speedUnitConverter.listOfSpeedUnits.length, 1);
      },
    );

    test(
      "Test Resetting List Of Speed Units To One Base Speed Unit Element",
      () {
        measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
          ZEROED_SPEED_UNIT,
          [speedUnitToBeConvertedImplementation]
              as List<MeasureUnitEntity<SpeedUnit>>,
          0,
        );

        speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

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
