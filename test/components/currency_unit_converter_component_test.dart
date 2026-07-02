import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

void main() {
  group("Test \"CurrencyUnitConverter\" Component", () {
    late bool isCurrencyUnitConverted;
    late CurrencyUnitEntity currencyUnitToBeConvertedImplementation;
    late CurrencyUnitConverter currencyUnitConverter;
    late MeasureUnitConverter<CurrencyUnit> measureUnitConverter;

    setUp(() {
      isCurrencyUnitConverted = false;

      currencyUnitToBeConvertedImplementation = CURRENCY_UNIT_TO_CONVERT_TO((
        _,
      ) {
        isCurrencyUnitConverted = true;
      });

      measureUnitConverter = MeasureUnitConverter<CurrencyUnit>(
        ZEROED_CURRENCY_UNIT,
        [currencyUnitToBeConvertedImplementation],
        0,
      );

      currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        CURRENCY_VALUES,
      );
    });

    test("Test Adding Base Currency Unit To List Of Currency Units", () {
      currencyUnitConverter.addCurrencyUnit();

      expect(currencyUnitConverter.listOfCurrencyUnits.length, 2);
      expect(
        currencyUnitConverter.listOfCurrencyUnits[1].value,
        currencyUnitToBeConvertedImplementation.value,
      );
      expect(
        currencyUnitConverter.listOfCurrencyUnits[1].measureUnit,
        currencyUnitToBeConvertedImplementation.measureUnit,
      );
    });

    test(
      "Test Adding Currency Unit At A Given Index To List Of Currency Units",
      () {
        currencyUnitConverter.addCurrencyUnitAt(1);

        expect(currencyUnitConverter.listOfCurrencyUnits.length, 2);
        expect(
          currencyUnitConverter.listOfCurrencyUnits[1].value,
          currencyUnitToBeConvertedImplementation.value,
        );
        expect(
          currencyUnitConverter.listOfCurrencyUnits[1].measureUnit,
          currencyUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );

    test(
      "Test Updating Base Currency Unit Index And Converts All Currency Units",
      () {
        measureUnitConverter =
            MeasureUnitConverter<CurrencyUnit>(ZEROED_CURRENCY_UNIT, [
              currencyUnitToBeConvertedImplementation,
              currencyUnitToBeConvertedImplementation,
            ], 0);

        currencyUnitConverter = CurrencyUnitConverter(
          measureUnitConverter,
          CURRENCY_VALUES,
        );

        currencyUnitConverter.updateBaseCurrencyUnitIndex(1);

        expect(currencyUnitConverter.baseCurrencyUnitIndex, 1);
        expect(isCurrencyUnitConverted, true);
      },
    );

    test(
      "Test Updating Currency Unit At A Given Index And Converts All Currency Units",
      () {
        bool isMeasureUnitUpdated = false;

        final updatedCurrencyUnitImplementation = UPDATED_CURRENCY_UNIT((_) {
          isMeasureUnitUpdated = true;
        });

        measureUnitConverter =
            MeasureUnitConverter<CurrencyUnit>(ZEROED_CURRENCY_UNIT, [
              currencyUnitToBeConvertedImplementation,
              currencyUnitToBeConvertedImplementation,
            ], 0);

        currencyUnitConverter = CurrencyUnitConverter(
          measureUnitConverter,
          CURRENCY_VALUES,
        );

        currencyUnitConverter.updateCurrencyUnitAt(
          updatedCurrencyUnitImplementation,
          1,
        );

        expect(isMeasureUnitUpdated, true);
        expect(currencyUnitConverter.baseCurrencyUnitIndex, 1);
        expect(
          currencyUnitConverter.listOfCurrencyUnits[1].value,
          updatedCurrencyUnitImplementation.value,
        );
        expect(
          currencyUnitConverter.listOfCurrencyUnits[1].measureUnit,
          updatedCurrencyUnitImplementation.measureUnit,
        );
      },
    );

    test(
      "Test Removing Currency Unit At A Given Index From List Of Currency Units",
      () {
        measureUnitConverter =
            MeasureUnitConverter<CurrencyUnit>(ZEROED_CURRENCY_UNIT, [
              currencyUnitToBeConvertedImplementation,
              currencyUnitToBeConvertedImplementation,
            ], 0);

        currencyUnitConverter = CurrencyUnitConverter(
          measureUnitConverter,
          CURRENCY_VALUES,
        );

        currencyUnitConverter.removeCurrencyUnit(1);

        expect(currencyUnitConverter.listOfCurrencyUnits.length, 1);
      },
    );

    test(
      "Test Resetting List Of Currency Units To One Base Currency Unit Element",
      () {
        measureUnitConverter =
            MeasureUnitConverter<CurrencyUnit>(ZEROED_CURRENCY_UNIT, [
              currencyUnitToBeConvertedImplementation,
              currencyUnitToBeConvertedImplementation,
            ], 0);

        currencyUnitConverter = CurrencyUnitConverter(
          measureUnitConverter,
          CURRENCY_VALUES,
        );

        currencyUnitConverter.reset();

        expect(currencyUnitConverter.listOfCurrencyUnits.length, 1);
        expect(currencyUnitConverter.baseCurrencyUnitIndex, 0);
        expect(
          currencyUnitConverter.listOfCurrencyUnits[0].value,
          ZEROED_CURRENCY_UNIT.value,
        );
        expect(
          currencyUnitConverter.listOfCurrencyUnits[0].measureUnit,
          currencyUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );

    test("Test Disposing Of Currency Values", () {
      currencyUnitConverter.disposeCurrencyValues();

      try {
        CurrencyValuesMediator.currencyValues;
      } catch (error) {
        expect(error, isA<TypeError>());
      }
    });
  });
}
