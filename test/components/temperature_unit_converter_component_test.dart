import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";

void main() {
  group("Test \"TemperatureUnitConverter\" Component", () {
    late bool isTemperatureUnitConverted;
    final temperatureUnitToBeConvertedImplementation =
        TEMPERATURE_UNIT_TO_CONVERT_TO((_) {
          isTemperatureUnitConverted = true;
        });
    late TemperatureUnitConverter temperatureUnitConverter;
    late MeasureUnitConverter<TemperatureUnit> measureUnitConverter;

    setUp(() {
      isTemperatureUnitConverted = false;

      measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
        ZEROED_TEMPERATURE_UNIT,
        [temperatureUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<TemperatureUnit>>,
        0,
      );

      temperatureUnitConverter = TemperatureUnitConverter(measureUnitConverter);
    });

    test("Test Adding Base Temperature Unit To List Of Temperature Units", () {
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
    });

    test(
      "Test Adding Temperature Unit At A Given Index To List Of Temperature Units",
      () {
        temperatureUnitConverter.addTemperatureUnitAt(1);

        expect(temperatureUnitConverter.listOfTemperatureUnits.length, 2);

        expect(
          temperatureUnitConverter.listOfTemperatureUnits[1].value,
          temperatureUnitToBeConvertedImplementation.value,
        );
        expect(
          temperatureUnitConverter.listOfTemperatureUnits[1].measureUnit,
          temperatureUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );

    test(
      "Test Updating Base Temperature Unit Index And Converts All Temperature Units",
      () {
        measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
          ZEROED_TEMPERATURE_UNIT,
          [
                temperatureUnitToBeConvertedImplementation,
                temperatureUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<TemperatureUnit>>,
          0,
        );

        temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );

        temperatureUnitConverter.updateBaseTemperatureUnitIndex(1);

        expect(temperatureUnitConverter.baseTemperatureUnitIndex, 1);

        expect(isTemperatureUnitConverted, true);
      },
    );

    test(
      "Test Updating Temperature Unit At A Given Index And Converts All Temperature Units",
      () {
        bool isMeasureUnitUpdated = false;

        final updatedTemperatureUnitImplementation = UPDATED_TEMPERATURE_UNIT((
          _,
        ) {
          isMeasureUnitUpdated = true;
        });

        measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
          ZEROED_TEMPERATURE_UNIT,
          [
                temperatureUnitToBeConvertedImplementation,
                temperatureUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<TemperatureUnit>>,
          0,
        );

        temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );

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
      },
    );

    test(
      "Test Removing Temperature Unit At A Given Index From List Of Temperature Units",
      () {
        measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
          ZEROED_TEMPERATURE_UNIT,
          [
                temperatureUnitToBeConvertedImplementation,
                temperatureUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<TemperatureUnit>>,
          0,
        );

        temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );

        temperatureUnitConverter.removeTemperatureUnit(1);

        expect(temperatureUnitConverter.listOfTemperatureUnits.length, 1);
      },
    );

    test(
      "Test Resetting List Of Temperature Units To One Base Temperature Unit Element",
      () {
        measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
          ZEROED_TEMPERATURE_UNIT,
          [temperatureUnitToBeConvertedImplementation]
              as List<MeasureUnitEntity<TemperatureUnit>>,
          0,
        );

        temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );

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
