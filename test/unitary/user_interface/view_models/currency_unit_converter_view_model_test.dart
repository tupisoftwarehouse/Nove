import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/currency_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CurrencyUnitConverterViewModel\" Class", () {
    late bool isCurrencyUnitConverted;
    final currencyUnitToBeConvertedImplementation = CURRENCY_UNIT_TO_CONVERT_TO(
      (_) {
        isCurrencyUnitConverted = true;
      },
    );
    late CurrencyUnitConverter currencyUnitConverter;
    late MeasureUnitConverter<CurrencyUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late CurrencyUnitConverterViewModel currencyUnitConverterViewModel;

    setUp(() {
      isCurrencyUnitConverted = false;

      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<CurrencyUnit>(
        ZEROED_CURRENCY_UNIT,
        [currencyUnitToBeConvertedImplementation],
        0,
      );

      currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        CURRENCY_VALUES,
      );

      currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        CURRENT_CURRENCY_VALUES,
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With \"CurrencyUnitConverter\" Data",
      () {
        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value[0].value,
          CURRENCY_UNIT_VALUE,
        );
        expect(
          currencyUnitConverterViewModel
              .listOfCurrencyUnits
              .value[0]
              .measureUnit,
          currencyUnitToBeConvertedImplementation.measureUnit,
        );

        expect(currencyUnitConverterViewModel.baseCurrencyUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"addCurrencyUnit\" Adds Currency Unit And Stores Values",
      () {
        currencyUnitConverterViewModel.addCurrencyUnit();

        final listOfCurrencyUnitsFromKeyValueDatabase =
            CurrencyUnitConverterDataStore.getListOfCurrencyUnits(
              keyValueDatabase,
            );

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
          2,
        );
        expect(listOfCurrencyUnitsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"addCurrencyUnitAt\" Adds Currency Unit At Given Index",
      () {
        currencyUnitConverterViewModel.addCurrencyUnitAt(1);

        final listOfCurrencyUnitsFromKeyValueDatabase =
            CurrencyUnitConverterDataStore.getListOfCurrencyUnits(
              keyValueDatabase,
            );

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
          2,
        );
        expect(listOfCurrencyUnitsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"updateBaseCurrencyUnitIndex\" Updates Base Index And Stores Values",
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
        currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
          currencyUnitConverter,
          CURRENT_CURRENCY_VALUES,
          keyValueDatabase,
        );

        currencyUnitConverterViewModel.updateBaseCurrencyUnitIndex(1);

        final baseCurrencyUnitIndexFromKeyValueDatabase =
            CurrencyUnitConverterDataStore.getBaseCurrencyUnitIndex(
              keyValueDatabase,
            );

        expect(currencyUnitConverterViewModel.baseCurrencyUnitIndex.value, 1);
        expect(baseCurrencyUnitIndexFromKeyValueDatabase, 1);
        expect(isCurrencyUnitConverted, true);
      },
    );

    test(
      "Test If Method \"updateCurrencyUnitAt\" Updates Unit At Given Index",
      () {
        bool isCurrencyUnitUpdated = false;

        final updatedCurrencyUnitImplementation = UPDATED_CURRENCY_UNIT((_) {
          isCurrencyUnitUpdated = true;
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
        currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
          currencyUnitConverter,
          CURRENT_CURRENCY_VALUES,
          keyValueDatabase,
        );

        currencyUnitConverterViewModel.updateCurrencyUnitAt(
          updatedCurrencyUnitImplementation,
          1,
        );

        final listOfCurrencyUnitsFromKeyValueDatabase =
            CurrencyUnitConverterDataStore.getListOfCurrencyUnits(
              keyValueDatabase,
            );

        final baseCurrencyUnitIndexFromKeyValueDatabase =
            CurrencyUnitConverterDataStore.getBaseCurrencyUnitIndex(
              keyValueDatabase,
            );

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value[1].value,
          updatedCurrencyUnitImplementation.value,
        );
        expect(
          listOfCurrencyUnitsFromKeyValueDatabase[1].value,
          updatedCurrencyUnitImplementation.value,
        );

        expect(currencyUnitConverterViewModel.baseCurrencyUnitIndex.value, 1);
        expect(baseCurrencyUnitIndexFromKeyValueDatabase, 1);

        expect(isCurrencyUnitConverted, true);
        expect(isCurrencyUnitUpdated, true);
      },
    );

    test(
      "Test If Method \"removeCurrencyUnit\" Removes Unit And Stores Values",
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
        currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
          currencyUnitConverter,
          CURRENT_CURRENCY_VALUES,
          keyValueDatabase,
        );

        currencyUnitConverterViewModel.removeCurrencyUnit(1);

        final listOfCurrencyUnitsFromKeyValueDatabase =
            CurrencyUnitConverterDataStore.getListOfCurrencyUnits(
              keyValueDatabase,
            );

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
          1,
        );
        expect(listOfCurrencyUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test("Test If Method \"reset\" Resets Currency Unit Converter", () {
      measureUnitConverter =
          MeasureUnitConverter<CurrencyUnit>(ZEROED_CURRENCY_UNIT, [
            currencyUnitToBeConvertedImplementation,
            currencyUnitToBeConvertedImplementation,
          ], 0);

      currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        CURRENCY_VALUES,
      );
      currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        CURRENT_CURRENCY_VALUES,
        keyValueDatabase,
      );

      currencyUnitConverterViewModel.reset();

      final listOfCurrencyUnitsFromKeyValueDatabase =
          CurrencyUnitConverterDataStore.getListOfCurrencyUnits(
            keyValueDatabase,
          );

      expect(
        currencyUnitConverterViewModel.listOfCurrencyUnits.value[0].value,
        ZEROED_CURRENCY_UNIT.value,
      );
      expect(
        currencyUnitConverterViewModel.listOfCurrencyUnits.value[0].measureUnit,
        ZEROED_CURRENCY_UNIT.measureUnit,
      );
      expect(
        listOfCurrencyUnitsFromKeyValueDatabase[0].value,
        ZEROED_CURRENCY_UNIT.value,
      );
      expect(
        listOfCurrencyUnitsFromKeyValueDatabase[0].measureUnit,
        ZEROED_CURRENCY_UNIT.measureUnit,
      );

      expect(
        currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
        1,
      );
      expect(listOfCurrencyUnitsFromKeyValueDatabase.length, 1);
    });

    test(
      "Test If Method \"disposeConverterCurrencyValues\" Disposes Of Currency Values From Currency Unit Converter",
      () {
        currencyUnitConverterViewModel.disposeConverterCurrencyValues();

        try {
          CurrencyValuesMediator.currencyValues;
        } catch (error) {
          expect(error, isA<Error>());
        }
      },
    );

    test(
      "Test If Method \"restore\" Restores Deleted Currency Units And Stores Values On Key-Value Database",
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
        currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
          currencyUnitConverter,
          CURRENT_CURRENCY_VALUES,
          keyValueDatabase,
        );

        currencyUnitConverterViewModel.reset();

        currencyUnitConverterViewModel.restore();

        final listOfCurrencyUnitsFromKeyValueDatabase =
            CurrencyUnitConverterDataStore.getListOfCurrencyUnits(
              keyValueDatabase,
            );

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
          2,
        );
        expect(listOfCurrencyUnitsFromKeyValueDatabase.length, 2);
        expect(currencyUnitConverter.listOfCurrencyUnits.length, 2);
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      measureUnitConverter =
          MeasureUnitConverter<CurrencyUnit>(ZEROED_CURRENCY_UNIT, [
            currencyUnitToBeConvertedImplementation,
            currencyUnitToBeConvertedImplementation,
          ], 0);

      currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        CURRENCY_VALUES,
      );
      currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        CURRENT_CURRENCY_VALUES,
        keyValueDatabase,
      );

      currencyUnitConverterViewModel.reset();

      currencyUnitConverterViewModel.dismissRecovery();

      try {
        currencyUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });
  });
}
