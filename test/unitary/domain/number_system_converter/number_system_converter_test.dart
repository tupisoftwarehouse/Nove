import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";

void main() {
  group("Test \"NumberSystemConverter\" Class", () {
    late bool isNumberSystemConverted;

    final numberSystemToBeConvertedImplementation = NUMBER_SYSTEM_TO_CONVERT_TO(
      (_) {
        isNumberSystemConverted = true;
      },
    );

    late NumberSystemConverter numberSystemConverter;
    late MeasureUnitConverter<NumberSystem> measureUnitConverter;

    setUp(() {
      isNumberSystemConverted = false;

      measureUnitConverter = MeasureUnitConverter<NumberSystem>(
        ZEROED_NUMBER_SYSTEM,
        [numberSystemToBeConvertedImplementation]
            as List<MeasureUnitEntity<NumberSystem>>,
        0,
      );

      numberSystemConverter = NumberSystemConverter(measureUnitConverter);
    });

    test(
      "Test If Method \"addNumberSystem\" Adds Base Number System To List Of Number Systems",
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
      },
    );

    test(
      "Test If Method \"addNumberSystemAt\" Adds Number System At A Given Index To List Of Number Systems",
      () {
        numberSystemConverter.addNumberSystemAt(1);

        expect(numberSystemConverter.listOfNumberSystems.length, 2);

        expect(
          numberSystemConverter.listOfNumberSystems[1].value,
          numberSystemToBeConvertedImplementation.value,
        );
        expect(
          numberSystemConverter.listOfNumberSystems[1].measureUnit,
          numberSystemToBeConvertedImplementation.measureUnit,
        );
      },
    );

    test(
      "Test If Method \"updateBaseNumberSystemIndex\" Updates Base Number System Index And Converts All Number Systems",
      () {
        measureUnitConverter = MeasureUnitConverter<NumberSystem>(
          ZEROED_NUMBER_SYSTEM,
          [
                numberSystemToBeConvertedImplementation,
                numberSystemToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<NumberSystem>>,
          0,
        );

        numberSystemConverter = NumberSystemConverter(measureUnitConverter);

        numberSystemConverter.updateBaseNumberSystemIndex(1);

        expect(numberSystemConverter.baseNumberSystemIndex, 1);

        expect(isNumberSystemConverted, true);
      },
    );

    test(
      "Test If Method \"updateNumberSystemAt\" Updates Number System At A Given Index And Converts All Number Systems",
      () {
        bool isMeasureUnitUpdated = false;

        final updatedNumberSystemImplementation = UPDATED_NUMBER_SYSTEM((_) {
          isMeasureUnitUpdated = true;
        });

        measureUnitConverter = MeasureUnitConverter<NumberSystem>(
          ZEROED_NUMBER_SYSTEM,
          [
                numberSystemToBeConvertedImplementation,
                numberSystemToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<NumberSystem>>,
          0,
        );

        numberSystemConverter = NumberSystemConverter(measureUnitConverter);

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
      },
    );

    test(
      "Test If Method \"removeNumberSystem\" Removes Number System At A Given Index From List Of Number Systems",
      () {
        measureUnitConverter = MeasureUnitConverter<NumberSystem>(
          ZEROED_NUMBER_SYSTEM,
          [
                numberSystemToBeConvertedImplementation,
                numberSystemToBeConvertedImplementation,
              ]
              as List<MeasureUnitEntity<NumberSystem>>,
          0,
        );

        numberSystemConverter = NumberSystemConverter(measureUnitConverter);

        numberSystemConverter.removeNumberSystem(1);

        expect(numberSystemConverter.listOfNumberSystems.length, 1);
      },
    );

    test(
      "Test If Method \"reset\" Resets List Of Number Systems To One Base Number System Element",
      () {
        measureUnitConverter = MeasureUnitConverter<NumberSystem>(
          ZEROED_NUMBER_SYSTEM,
          [numberSystemToBeConvertedImplementation]
              as List<MeasureUnitEntity<NumberSystem>>,
          0,
        );

        numberSystemConverter = NumberSystemConverter(measureUnitConverter);

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
