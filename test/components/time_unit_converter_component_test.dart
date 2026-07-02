import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";

void main() {
  group("Test \"TimeUnitConverter\" Component", () {
    late bool isTimeUnitConverted;
    final timeUnitToBeConvertedImplementation = TIME_UNIT_TO_CONVERT_TO((_) {
      isTimeUnitConverted = true;
    });
    late TimeUnitConverter timeUnitConverter;
    late MeasureUnitConverter<TimeUnit> measureUnitConverter;

    setUp(() {
      isTimeUnitConverted = false;

      measureUnitConverter = MeasureUnitConverter<TimeUnit>(
        ZEROED_TIME_UNIT,
        [timeUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<TimeUnit>>,
        0,
      );

      timeUnitConverter = TimeUnitConverter(measureUnitConverter);
    });

    test("Test Adding Base Time Unit To List Of Time Units", () {
      timeUnitConverter.addTimeUnit();

      expect(timeUnitConverter.listOfTimeUnits.length, 2);

      expect(
        timeUnitConverter.listOfTimeUnits[1].value,
        timeUnitToBeConvertedImplementation.value,
      );
      expect(
        timeUnitConverter.listOfTimeUnits[1].measureUnit,
        timeUnitToBeConvertedImplementation.measureUnit,
      );
    });

    test("Test Adding Time Unit At A Given Index To List Of Time Units", () {
      timeUnitConverter.addTimeUnitAt(1);

      expect(timeUnitConverter.listOfTimeUnits.length, 2);

      expect(
        timeUnitConverter.listOfTimeUnits[1].value,
        timeUnitToBeConvertedImplementation.value,
      );
      expect(
        timeUnitConverter.listOfTimeUnits[1].measureUnit,
        timeUnitToBeConvertedImplementation.measureUnit,
      );
    });

    test("Test Updating Base Time Unit Index And Converts All Time Units", () {
      measureUnitConverter = MeasureUnitConverter<TimeUnit>(
        ZEROED_TIME_UNIT,
        [
              timeUnitToBeConvertedImplementation,
              timeUnitToBeConvertedImplementation,
            ]
            as List<MeasureUnitEntity<TimeUnit>>,
        0,
      );

      timeUnitConverter = TimeUnitConverter(measureUnitConverter);

      timeUnitConverter.updateBaseTimeUnitIndex(1);

      expect(timeUnitConverter.baseTimeUnitIndex, 1);

      expect(isTimeUnitConverted, true);
    });

    test(
      "Test Updating Time Unit At A Given Index And Converts All Time Units",
      () {
        bool isMeasureUnitUpdated = false;

        final updatedTimeUnitImplementation = UPDATED_TIME_UNIT((_) {
          isMeasureUnitUpdated = true;
        });

        measureUnitConverter = MeasureUnitConverter<TimeUnit>(
          ZEROED_TIME_UNIT,
          [
                timeUnitToBeConvertedImplementation,
                timeUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<TimeUnit>>,
          0,
        );

        timeUnitConverter = TimeUnitConverter(measureUnitConverter);

        timeUnitConverter.updateTimeUnitAt(updatedTimeUnitImplementation, 1);

        expect(isMeasureUnitUpdated, true);

        expect(timeUnitConverter.baseTimeUnitIndex, 1);

        expect(
          timeUnitConverter.listOfTimeUnits[1].value,
          updatedTimeUnitImplementation.value,
        );
        expect(
          timeUnitConverter.listOfTimeUnits[1].measureUnit,
          updatedTimeUnitImplementation.measureUnit,
        );
      },
    );

    test(
      "Test Removing Time Unit At A Given Index From List Of Time Units",
      () {
        measureUnitConverter = MeasureUnitConverter<TimeUnit>(
          ZEROED_TIME_UNIT,
          [
                timeUnitToBeConvertedImplementation,
                timeUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<TimeUnit>>,
          0,
        );

        timeUnitConverter = TimeUnitConverter(measureUnitConverter);

        timeUnitConverter.removeTimeUnit(1);

        expect(timeUnitConverter.listOfTimeUnits.length, 1);
      },
    );

    test("Test Resetting List Of Time Units To One Base Time Unit Element", () {
      measureUnitConverter = MeasureUnitConverter<TimeUnit>(
        ZEROED_TIME_UNIT,
        [timeUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<TimeUnit>>,
        0,
      );

      timeUnitConverter = TimeUnitConverter(measureUnitConverter);

      timeUnitConverter.reset();

      expect(timeUnitConverter.listOfTimeUnits.length, 1);

      expect(timeUnitConverter.baseTimeUnitIndex, 0);

      expect(
        timeUnitConverter.listOfTimeUnits[0].value,
        ZEROED_TIME_UNIT_VALUE,
      );

      expect(
        timeUnitConverter.listOfTimeUnits[0].measureUnit,
        timeUnitToBeConvertedImplementation.measureUnit,
      );
    });
  });
}
