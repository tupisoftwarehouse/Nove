import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

void main() {
  group("Test \"MassUnitConverter\" Component", () {
    late bool isMassUnitConverted;
    final massUnitToBeConvertedImplementation = MASS_UNIT_TO_CONVERT_TO((_) {
      isMassUnitConverted = true;
    });
    late MassUnitConverter massUnitConverter;
    late MeasureUnitConverter<MassUnit> measureUnitConverter;

    setUp(() {
      isMassUnitConverted = false;

      measureUnitConverter = MeasureUnitConverter<MassUnit>(
        ZEROED_MASS_UNIT,
        [massUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<MassUnit>>,
        0,
      );

      massUnitConverter = MassUnitConverter(measureUnitConverter);
    });

    test("Test Adding Base Mass Unit To List Of Mass Units", () {
      massUnitConverter.addMassUnit();

      expect(massUnitConverter.listOfMassUnits.length, 2);

      expect(
        massUnitConverter.listOfMassUnits[1].value,
        massUnitToBeConvertedImplementation.value,
      );
      expect(
        massUnitConverter.listOfMassUnits[1].measureUnit,
        massUnitToBeConvertedImplementation.measureUnit,
      );
    });

    test("Test Adding Mass Unit At A Given Index To List Of Mass Units", () {
      massUnitConverter.addMassUnitAt(1);

      expect(massUnitConverter.listOfMassUnits.length, 2);

      expect(
        massUnitConverter.listOfMassUnits[1].value,
        massUnitToBeConvertedImplementation.value,
      );
      expect(
        massUnitConverter.listOfMassUnits[1].measureUnit,
        massUnitToBeConvertedImplementation.measureUnit,
      );
    });

    test("Test Updating Base Mass Unit Index And Converts All Mass Units", () {
      measureUnitConverter = MeasureUnitConverter<MassUnit>(
        ZEROED_MASS_UNIT,
        [
              massUnitToBeConvertedImplementation,
              massUnitToBeConvertedImplementation,
            ]
            as List<MeasureUnitEntity<MassUnit>>,
        0,
      );

      massUnitConverter = MassUnitConverter(measureUnitConverter);

      massUnitConverter.updateBaseMassUnitIndex(1);

      expect(massUnitConverter.baseMassUnitIndex, 1);

      expect(isMassUnitConverted, true);
    });

    test(
      "Test Updating Mass Unit At A Given Index And Converts All Mass Units",
      () {
        bool isMeasureUnitUpdated = false;

        final updatedMassUnitImplementation = UPDATED_MASS_UNIT((_) {
          isMeasureUnitUpdated = true;
        });

        measureUnitConverter = MeasureUnitConverter<MassUnit>(
          ZEROED_MASS_UNIT,
          [
                massUnitToBeConvertedImplementation,
                massUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<MassUnit>>,
          0,
        );

        massUnitConverter = MassUnitConverter(measureUnitConverter);

        massUnitConverter.updateMassUnitAt(updatedMassUnitImplementation, 1);

        expect(isMeasureUnitUpdated, true);

        expect(massUnitConverter.baseMassUnitIndex, 1);

        expect(
          massUnitConverter.listOfMassUnits[1].value,
          updatedMassUnitImplementation.value,
        );
        expect(
          massUnitConverter.listOfMassUnits[1].measureUnit,
          updatedMassUnitImplementation.measureUnit,
        );
      },
    );

    test(
      "Test Removing Mass Unit At A Given Index From List Of Mass Units",
      () {
        measureUnitConverter = MeasureUnitConverter<MassUnit>(
          ZEROED_MASS_UNIT,
          [
                massUnitToBeConvertedImplementation,
                massUnitToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<MassUnit>>,
          0,
        );

        massUnitConverter = MassUnitConverter(measureUnitConverter);

        massUnitConverter.removeMassUnit(1);

        expect(massUnitConverter.listOfMassUnits.length, 1);
      },
    );

    test("Test Resetting List Of Mass Units To One Base Mass Unit Element", () {
      measureUnitConverter = MeasureUnitConverter<MassUnit>(
        ZEROED_MASS_UNIT,
        [massUnitToBeConvertedImplementation]
            as List<MeasureUnitEntity<MassUnit>>,
        0,
      );

      massUnitConverter = MassUnitConverter(measureUnitConverter);

      massUnitConverter.reset();

      expect(massUnitConverter.listOfMassUnits.length, 1);

      expect(massUnitConverter.baseMassUnitIndex, 0);

      expect(
        massUnitConverter.listOfMassUnits[0].value,
        ZEROED_MASS_UNIT_VALUE,
      );

      expect(
        massUnitConverter.listOfMassUnits[0].measureUnit,
        massUnitToBeConvertedImplementation.measureUnit,
      );
    });
  });
}
