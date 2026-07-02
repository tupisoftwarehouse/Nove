import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

void main() {
  group("Test \"Converting Area Unit\" Integration", () {
    late bool isAreaUnitConverted;
    final areaUnitToBeConvertedImplementation = AREA_UNIT_TO_CONVERT_TO((_) {
      isAreaUnitConverted = true;
    });
    late bool isMeasureUnitUpdated;
    late AreaUnitConverter areaUnitConverter;
    late MeasureUnitConverter<AreaUnit> measureUnitConverter;

    setUpAll(() {
      isAreaUnitConverted = false;
      isMeasureUnitUpdated = false;

      measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        ZEROED_AREA_UNIT,
        [areaUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<AreaUnit>>,
        0,
      );

      areaUnitConverter = AreaUnitConverter(measureUnitConverter);
    });

    test(
      "Test Measure Unit Being Converted By \"MeasureUnitConverter\" On \"AreaUnitConverter\"",
      () {
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

        areaUnitConverter.addAreaUnitAt(2);

        expect(areaUnitConverter.listOfAreaUnits.length, 3);
        expect(
          areaUnitConverter.listOfAreaUnits[2].value,
          areaUnitToBeConvertedImplementation.value,
        );
        expect(
          areaUnitConverter.listOfAreaUnits[2].measureUnit,
          areaUnitToBeConvertedImplementation.measureUnit,
        );

        areaUnitConverter.updateBaseAreaUnitIndex(1);

        expect(areaUnitConverter.baseAreaUnitIndex, 1);
        expect(isAreaUnitConverted, true);

        final updatedAreaUnitImplementation = UPDATED_AREA_UNIT((_) {
          isMeasureUnitUpdated = true;
        });

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

        areaUnitConverter.removeAreaUnit(1);

        expect(areaUnitConverter.listOfAreaUnits.length, 2);

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
      },
    );
  });
}
