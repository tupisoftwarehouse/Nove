import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

void main() {
  group("Test \"Converting Currency Unit\" Integration", () {
    late bool isCurrencyUnitConverted;
    late bool isMeasureUnitUpdated;
    late CurrencyUnitEntity currencyUnitToBeConvertedImplementation;
    late CurrencyUnitEntity updatedCurrencyUnitImplementation;
    late CurrencyUnitConverter currencyUnitConverter;
    late MeasureUnitConverter<CurrencyUnit> measureUnitConverter;

    setUpAll(() {
      isCurrencyUnitConverted = false;
      isMeasureUnitUpdated = false;

      currencyUnitToBeConvertedImplementation = CURRENCY_UNIT_TO_CONVERT_TO((
        _,
      ) {
        isCurrencyUnitConverted = true;
      });

      updatedCurrencyUnitImplementation = UPDATED_CURRENCY_UNIT((_) {
        isMeasureUnitUpdated = true;
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

    test(
      "Test Measure Unit Being Converted By \"MeasureUnitConverter\" On \"CurrencyUnitConverter\"",
      () {
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

        currencyUnitConverter.addCurrencyUnitAt(2);

        expect(currencyUnitConverter.listOfCurrencyUnits.length, 3);
        expect(
          currencyUnitConverter.listOfCurrencyUnits[2].value,
          currencyUnitToBeConvertedImplementation.value,
        );
        expect(
          currencyUnitConverter.listOfCurrencyUnits[2].measureUnit,
          currencyUnitToBeConvertedImplementation.measureUnit,
        );

        currencyUnitConverter.updateBaseCurrencyUnitIndex(1);

        expect(currencyUnitConverter.baseCurrencyUnitIndex, 1);
        expect(isCurrencyUnitConverted, true);

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

        currencyUnitConverter.removeCurrencyUnit(1);

        expect(currencyUnitConverter.listOfCurrencyUnits.length, 2);

        currencyUnitConverter.reset();

        expect(currencyUnitConverter.listOfCurrencyUnits.length, 1);
        expect(currencyUnitConverter.baseCurrencyUnitIndex, 0);
        expect(
          currencyUnitConverter.listOfCurrencyUnits[0].value,
          ZEROED_CURRENCY_UNIT_VALUE,
        );
        expect(
          currencyUnitConverter.listOfCurrencyUnits[0].measureUnit,
          currencyUnitToBeConvertedImplementation.measureUnit,
        );
      },
    );
  });
}
