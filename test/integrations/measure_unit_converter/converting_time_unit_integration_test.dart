import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

void main() {
  group("Test \"Converting Time Unit\" Integration", () {
    late bool isTimeUnitConverted;
    late bool isMeasureUnitUpdated;
    final timeUnitToBeConvertedImplementation = TIME_UNIT_TO_CONVERT_TO((_) {
      isTimeUnitConverted = true;
    });
    final updatedTimeUnitImplementation = UPDATED_TIME_UNIT((_) {
      isMeasureUnitUpdated = true;
    });
    late TimeUnitConverter timeUnitConverter;
    late MeasureUnitConverter<TimeUnit> measureUnitConverter;

    setUpAll(() {
      isTimeUnitConverted = false;
      isMeasureUnitUpdated = false;

      measureUnitConverter = MeasureUnitConverter<TimeUnit>(
        ZEROED_TIME_UNIT,
        [timeUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<TimeUnit>>,
        0,
      );

      timeUnitConverter = TimeUnitConverter(measureUnitConverter);
    });

    test(
      "Test Measure Unit Being Converted By \"MeasureUnitConverter\" On \"TimeUnitConverter\"",
      () {
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

        timeUnitConverter.addTimeUnitAt(2);

        expect(timeUnitConverter.listOfTimeUnits.length, 3);

        expect(
          timeUnitConverter.listOfTimeUnits[2].value,
          timeUnitToBeConvertedImplementation.value,
        );
        expect(
          timeUnitConverter.listOfTimeUnits[2].measureUnit,
          timeUnitToBeConvertedImplementation.measureUnit,
        );

        timeUnitConverter.updateBaseTimeUnitIndex(1);

        expect(timeUnitConverter.baseTimeUnitIndex, 1);

        expect(isTimeUnitConverted, true);

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

        timeUnitConverter.removeTimeUnit(1);

        expect(timeUnitConverter.listOfTimeUnits.length, 2);

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
      },
    );
  });
}
