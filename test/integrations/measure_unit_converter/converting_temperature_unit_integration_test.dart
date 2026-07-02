import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";

void main() {
  group("Test \"Converting Temperature Unit\" Integration", () {
    late bool isTemperatureUnitConverted;
    late bool isMeasureUnitUpdated;
    final temperatureUnitToBeConvertedImplementation =
        TEMPERATURE_UNIT_TO_CONVERT_TO((_) {
          isTemperatureUnitConverted = true;
        });
    final updatedTemperatureUnitImplementation = UPDATED_TEMPERATURE_UNIT((_) {
      isMeasureUnitUpdated = true;
    });
    late TemperatureUnitConverter temperatureUnitConverter;
    late MeasureUnitConverter<TemperatureUnit> measureUnitConverter;

    setUpAll(() {
      isTemperatureUnitConverted = false;
      isMeasureUnitUpdated = false;

      measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
        ZEROED_TEMPERATURE_UNIT,
        [temperatureUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<TemperatureUnit>>,
        0,
      );

      temperatureUnitConverter = TemperatureUnitConverter(measureUnitConverter);
    });

    test(
      "Test Measure Unit Being Converted By \"MeasureUnitConverter\" On \"TemperatureUnitConverter\"",
      () {
        temperatureUnitConverter.addTemperatureUnit();

        expect(temperatureUnitConverter.listOfTemperatureUnits.length, 2);

        expect(
          temperatureUnitConverter.listOfTemperatureUnits[1].value,
          temperatureUnitToBeConvertedImplementation.value,
        );
        expect(
          temperatureUnitConverter.listOfTemperatureUnits[1].measureUnit,
          temperatureUnitToBeConvertedImplementation.measureUnit,
        );

        temperatureUnitConverter.addTemperatureUnitAt(2);

        expect(temperatureUnitConverter.listOfTemperatureUnits.length, 3);

        expect(
          temperatureUnitConverter.listOfTemperatureUnits[2].value,
          temperatureUnitToBeConvertedImplementation.value,
        );
        expect(
          temperatureUnitConverter.listOfTemperatureUnits[2].measureUnit,
          temperatureUnitToBeConvertedImplementation.measureUnit,
        );

        temperatureUnitConverter.updateBaseTemperatureUnitIndex(1);

        expect(temperatureUnitConverter.baseTemperatureUnitIndex, 1);

        expect(isTemperatureUnitConverted, true);

        temperatureUnitConverter.updateTemperatureUnitAt(
          updatedTemperatureUnitImplementation,
          1,
        );

        expect(isMeasureUnitUpdated, true);

        expect(temperatureUnitConverter.baseTemperatureUnitIndex, 1);

        expect(
          temperatureUnitConverter.listOfTemperatureUnits[1].value,
          updatedTemperatureUnitImplementation.value,
        );
        expect(
          temperatureUnitConverter.listOfTemperatureUnits[1].measureUnit,
          updatedTemperatureUnitImplementation.measureUnit,
        );

        temperatureUnitConverter.removeTemperatureUnit(1);

        expect(temperatureUnitConverter.listOfTemperatureUnits.length, 2);

        temperatureUnitConverter.reset();

        expect(temperatureUnitConverter.listOfTemperatureUnits.length, 1);

        expect(temperatureUnitConverter.baseTemperatureUnitIndex, 0);

        expect(
          temperatureUnitConverter.listOfTemperatureUnits[0].value,
          ZEROED_TEMPERATURE_UNIT_VALUE,
        );

        expect(
          temperatureUnitConverter.listOfTemperatureUnits[0].measureUnit,
          temperatureUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );
  });
}
