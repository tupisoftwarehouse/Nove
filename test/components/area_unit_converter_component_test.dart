import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

void main() {
  group("Test \"AreaUnitConverter\" Component", () {
    late bool isAreaUnitConverted;
    final areaUnitToBeConvertedImplementation = AREA_UNIT_TO_CONVERT_TO((_) {
      isAreaUnitConverted = true;
    });
    late AreaUnitConverter areaUnitConverter;
    late MeasureUnitConverter<AreaUnit> measureUnitConverter;

    setUp(() {
      isAreaUnitConverted = false;

      measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        ZEROED_AREA_UNIT,
        [areaUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<AreaUnit>>,
        0,
      );

      areaUnitConverter = AreaUnitConverter(measureUnitConverter);
    });

    test("Test Adding Base Area Unit To List Of Area Units", () {
      areaUnitConverter.addAreaUnit();

      expect(areaUnitConverter.listOfAreaUnits.length, 2);

      expect(
        areaUnitConverter.listOfAreaUnits[1].value,
        areaUnitToBeConvertedImplementation.value,
      );
      expect(
        areaUnitConverter.listOfAreaUnits[1].measureUnit,
        areaUnitToBeConvertedImplementation.measureUnit,
      );
    });

    test("Test Adding Area Unit At A Given Index To List Of Area Units", () {
      areaUnitConverter.addAreaUnitAt(1);

      expect(areaUnitConverter.listOfAreaUnits.length, 2);

      expect(
        areaUnitConverter.listOfAreaUnits[1].value,
        areaUnitToBeConvertedImplementation.value,
      );
      expect(
        areaUnitConverter.listOfAreaUnits[1].measureUnit,
        areaUnitToBeConvertedImplementation.measureUnit,
      );
    });

    test("Test Updating Base Area Unit Index And Converts All Area Units", () {
      measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        ZEROED_AREA_UNIT,
        [
              areaUnitToBeConvertedImplementation,
              areaUnitToBeConvertedImplementation,
            ]
            as List<MeasureUnitEntity<AreaUnit>>,
        0,
      );

      areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      areaUnitConverter.updateBaseAreaUnitIndex(1);

      expect(areaUnitConverter.baseAreaUnitIndex, 1);

      expect(isAreaUnitConverted, true);
    });

    test(
      "Test Updating Area Unit At A Given Index And Converts All Area Units",
      () {
        bool isMeasureUnitUpdated = false;

        final updatedAreaUnitImplementation = UPDATED_AREA_UNIT((_) {
          isMeasureUnitUpdated = true;
        });

        measureUnitConverter = MeasureUnitConverter<AreaUnit>(
          ZEROED_AREA_UNIT,
          [
                areaUnitToBeConvertedImplementation,
                areaUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<AreaUnit>>,
          0,
        );

        areaUnitConverter = AreaUnitConverter(measureUnitConverter);

        areaUnitConverter.updateAreaUnitAt(updatedAreaUnitImplementation, 1);

        expect(isMeasureUnitUpdated, true);

        expect(areaUnitConverter.baseAreaUnitIndex, 1);

        expect(
          areaUnitConverter.listOfAreaUnits[1].value,
          updatedAreaUnitImplementation.value,
        );
        expect(
          areaUnitConverter.listOfAreaUnits[1].measureUnit,
          updatedAreaUnitImplementation.measureUnit,
        );
      },
    );

    test(
      "Test Removing Area Unit At A Given Index From List Of Area Units",
      () {
        measureUnitConverter = MeasureUnitConverter<AreaUnit>(
          ZEROED_AREA_UNIT,
          [
                areaUnitToBeConvertedImplementation,
                areaUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<AreaUnit>>,
          0,
        );

        areaUnitConverter = AreaUnitConverter(measureUnitConverter);

        areaUnitConverter.removeAreaUnit(1);

        expect(areaUnitConverter.listOfAreaUnits.length, 1);
      },
    );

    test("Test Resetting List Of Area Units To One Base Area Unit Element", () {
      measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        ZEROED_AREA_UNIT,
        [areaUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<AreaUnit>>,
        0,
      );

      areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      areaUnitConverter.reset();

      expect(areaUnitConverter.listOfAreaUnits.length, 1);

      expect(areaUnitConverter.baseAreaUnitIndex, 0);

      expect(
        areaUnitConverter.listOfAreaUnits[0].value,
        ZEROED_AREA_UNIT_VALUE,
      );

      expect(
        areaUnitConverter.listOfAreaUnits[0].measureUnit,
        areaUnitToBeConvertedImplementation.measureUnit,
      );
    });
  });
}
