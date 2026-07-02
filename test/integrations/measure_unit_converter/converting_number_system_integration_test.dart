import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";

void main() {
  group("Test \"Converting Number System\" Integration", () {
    late bool isNumberSystemConverted;
    late bool isMeasureUnitUpdated;
    final numberSystemToBeConvertedImplementation = NUMBER_SYSTEM_TO_CONVERT_TO(
      (_) {
        isNumberSystemConverted = true;
      },
    );
    final updatedNumberSystemImplementation = UPDATED_NUMBER_SYSTEM((_) {
      isMeasureUnitUpdated = true;
    });
    late NumberSystemConverter numberSystemConverter;
    late MeasureUnitConverter<NumberSystem> measureUnitConverter;

    setUpAll(() {
      isNumberSystemConverted = false;
      isMeasureUnitUpdated = false;

      measureUnitConverter = MeasureUnitConverter<NumberSystem>(
        ZEROED_NUMBER_SYSTEM,
        [numberSystemToBeConvertedImplementation]
            as List<MeasureUnitEntity<NumberSystem>>,
        0,
      );

      numberSystemConverter = NumberSystemConverter(measureUnitConverter);
    });

    test(
      "Test Measure Unit Being Converted By \"MeasureUnitConverter\" On \"NumberSystemConverter\"",
      () {
        numberSystemConverter.addNumberSystem();

        expect(numberSystemConverter.listOfNumberSystems.length, 2);

        expect(
          numberSystemConverter.listOfNumberSystems[1].value,
          numberSystemToBeConvertedImplementation.value,
        );
        expect(
          numberSystemConverter.listOfNumberSystems[1].measureUnit,
          numberSystemToBeConvertedImplementation.measureUnit,
        );

        numberSystemConverter.addNumberSystemAt(2);

        expect(numberSystemConverter.listOfNumberSystems.length, 3);

        expect(
          numberSystemConverter.listOfNumberSystems[2].value,
          numberSystemToBeConvertedImplementation.value,
        );
        expect(
          numberSystemConverter.listOfNumberSystems[2].measureUnit,
          numberSystemToBeConvertedImplementation.measureUnit,
        );

        numberSystemConverter.updateBaseNumberSystemIndex(1);

        expect(numberSystemConverter.baseNumberSystemIndex, 1);

        expect(isNumberSystemConverted, true);

        numberSystemConverter.updateNumberSystemAt(
          updatedNumberSystemImplementation,
          1,
        );

        expect(isMeasureUnitUpdated, true);

        expect(numberSystemConverter.baseNumberSystemIndex, 1);

        expect(
          numberSystemConverter.listOfNumberSystems[1].value,
          updatedNumberSystemImplementation.value,
        );
        expect(
          numberSystemConverter.listOfNumberSystems[1].measureUnit,
          updatedNumberSystemImplementation.measureUnit,
        );

        numberSystemConverter.removeNumberSystem(1);

        expect(numberSystemConverter.listOfNumberSystems.length, 2);

        numberSystemConverter.reset();

        expect(numberSystemConverter.listOfNumberSystems.length, 1);

        expect(numberSystemConverter.baseNumberSystemIndex, 0);

        expect(
          numberSystemConverter.listOfNumberSystems[0].value,
          ZEROED_NUMBER_SYSTEM_VALUE,
        );

        expect(
          numberSystemConverter.listOfNumberSystems[0].measureUnit,
          numberSystemToBeConvertedImplementation.measureUnit,
        );
      },
    );
  });
}
