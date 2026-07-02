import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/length_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"LengthUnitConverterViewModel\" Class", () {
    late bool isLengthUnitConverted;
    final lengthUnitToBeConvertedImplementation = LENGTH_UNIT_TO_CONVERT_TO((
      _,
    ) {
      isLengthUnitConverted = true;
    });
    late LengthUnitConverter lengthUnitConverter;
    late MeasureUnitConverter<LengthUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late LengthUnitConverterViewModel lengthUnitConverterViewModel;

    setUp(() {
      isLengthUnitConverted = false;

      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<LengthUnit>(
        ZEROED_LENGTH_UNIT,
        [lengthUnitToBeConvertedImplementation],
        0,
      );

      lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

      lengthUnitConverterViewModel = LengthUnitConverterViewModel(
        lengthUnitConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With \"LengthUnitConverter\" Data",
      () {
        expect(
          lengthUnitConverterViewModel.listOfLengthUnits.value[0].value,
          LENGTH_UNIT_VALUE,
        );
        expect(
          lengthUnitConverterViewModel.listOfLengthUnits.value[0].measureUnit,
          lengthUnitToBeConvertedImplementation.measureUnit,
        );

        expect(lengthUnitConverterViewModel.baseLengthUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"addLengthUnit\" Adds Length Unit And Stores Values",
      () {
        lengthUnitConverterViewModel.addLengthUnit();

        final listOfLengthUnitsFromKeyValueDatabase =
            LengthUnitConverterDataStore.getListOfLengthUnits(keyValueDatabase);

        expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 2);
        expect(listOfLengthUnitsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"addLengthUnitAt\" Adds Length Unit At Given Index",
      () {
        lengthUnitConverterViewModel.addLengthUnitAt(1);

        final listOfLengthUnitsFromKeyValueDatabase =
            LengthUnitConverterDataStore.getListOfLengthUnits(keyValueDatabase);

        expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 2);
        expect(listOfLengthUnitsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"updateBaseLengthUnitIndex\" Updates Base Index And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<LengthUnit>(ZEROED_LENGTH_UNIT, [
              lengthUnitToBeConvertedImplementation,
              lengthUnitToBeConvertedImplementation,
            ], 0);

        lengthUnitConverter = LengthUnitConverter(measureUnitConverter);
        lengthUnitConverterViewModel = LengthUnitConverterViewModel(
          lengthUnitConverter,
          keyValueDatabase,
        );

        lengthUnitConverterViewModel.updateBaseLengthUnitIndex(1);

        final baseLengthUnitIndexFromKeyValueDatabase =
            LengthUnitConverterDataStore.getBaseLengthUnitIndex(
              keyValueDatabase,
            );

        expect(lengthUnitConverterViewModel.baseLengthUnitIndex.value, 1);
        expect(baseLengthUnitIndexFromKeyValueDatabase, 1);
        expect(isLengthUnitConverted, true);
      },
    );

    test(
      "Test If Method \"updateLengthUnitAt\" Updates Unit At Given Index",
      () {
        bool isLengthUnitUpdated = false;

        final updatedLengthUnitImplementation = UPDATED_LENGTH_UNIT((_) {
          isLengthUnitUpdated = true;
        });

        measureUnitConverter =
            MeasureUnitConverter<LengthUnit>(ZEROED_LENGTH_UNIT, [
              lengthUnitToBeConvertedImplementation,
              lengthUnitToBeConvertedImplementation,
            ], 0);

        lengthUnitConverter = LengthUnitConverter(measureUnitConverter);
        lengthUnitConverterViewModel = LengthUnitConverterViewModel(
          lengthUnitConverter,
          keyValueDatabase,
        );

        lengthUnitConverterViewModel.updateLengthUnitAt(
          updatedLengthUnitImplementation,
          1,
        );

        final listOfLengthUnitsFromKeyValueDatabase =
            LengthUnitConverterDataStore.getListOfLengthUnits(keyValueDatabase);

        final baseLengthUnitIndexFromKeyValueDatabase =
            LengthUnitConverterDataStore.getBaseLengthUnitIndex(
              keyValueDatabase,
            );

        expect(
          lengthUnitConverterViewModel.listOfLengthUnits.value[1].value,
          updatedLengthUnitImplementation.value,
        );
        expect(
          listOfLengthUnitsFromKeyValueDatabase[1].value,
          updatedLengthUnitImplementation.value,
        );

        expect(lengthUnitConverterViewModel.baseLengthUnitIndex.value, 1);
        expect(baseLengthUnitIndexFromKeyValueDatabase, 1);

        expect(isLengthUnitConverted, true);
        expect(isLengthUnitUpdated, true);
      },
    );

    test(
      "Test If Method \"removeLengthUnit\" Removes Unit And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<LengthUnit>(ZEROED_LENGTH_UNIT, [
              lengthUnitToBeConvertedImplementation,
              lengthUnitToBeConvertedImplementation,
            ], 0);

        lengthUnitConverter = LengthUnitConverter(measureUnitConverter);
        lengthUnitConverterViewModel = LengthUnitConverterViewModel(
          lengthUnitConverter,
          keyValueDatabase,
        );

        lengthUnitConverterViewModel.removeLengthUnit(1);

        final listOfLengthUnitsFromKeyValueDatabase =
            LengthUnitConverterDataStore.getListOfLengthUnits(keyValueDatabase);

        expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 1);
        expect(listOfLengthUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test("Test If Method \"reset\" Resets Length Unit Converter", () {
      measureUnitConverter =
          MeasureUnitConverter<LengthUnit>(ZEROED_LENGTH_UNIT, [
            lengthUnitToBeConvertedImplementation,
            lengthUnitToBeConvertedImplementation,
          ], 0);

      lengthUnitConverter = LengthUnitConverter(measureUnitConverter);
      lengthUnitConverterViewModel = LengthUnitConverterViewModel(
        lengthUnitConverter,
        keyValueDatabase,
      );

      lengthUnitConverterViewModel.reset();

      final listOfLengthUnitsFromKeyValueDatabase =
          LengthUnitConverterDataStore.getListOfLengthUnits(keyValueDatabase);

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value[0].value,
        ZEROED_LENGTH_UNIT.value,
      );
      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value[0].measureUnit,
        ZEROED_LENGTH_UNIT.measureUnit,
      );
      expect(
        listOfLengthUnitsFromKeyValueDatabase[0].value,
        ZEROED_LENGTH_UNIT.value,
      );
      expect(
        listOfLengthUnitsFromKeyValueDatabase[0].measureUnit,
        ZEROED_LENGTH_UNIT.measureUnit,
      );

      expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 1);
      expect(listOfLengthUnitsFromKeyValueDatabase.length, 1);
    });

    test(
      "Test If Method \"restore\" Restores Deleted Length Units And Stores Values On Key-Value Database",
      () {
        measureUnitConverter =
            MeasureUnitConverter<LengthUnit>(ZEROED_LENGTH_UNIT, [
              lengthUnitToBeConvertedImplementation,
              lengthUnitToBeConvertedImplementation,
            ], 0);

        lengthUnitConverter = LengthUnitConverter(measureUnitConverter);
        lengthUnitConverterViewModel = LengthUnitConverterViewModel(
          lengthUnitConverter,
          keyValueDatabase,
        );

        lengthUnitConverterViewModel.reset();

        lengthUnitConverterViewModel.restore();

        final listOfLengthUnitsFromKeyValueDatabase =
            LengthUnitConverterDataStore.getListOfLengthUnits(keyValueDatabase);

        expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 2);
        expect(listOfLengthUnitsFromKeyValueDatabase.length, 2);
        expect(lengthUnitConverter.listOfLengthUnits.length, 2);
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      measureUnitConverter =
          MeasureUnitConverter<LengthUnit>(ZEROED_LENGTH_UNIT, [
            lengthUnitToBeConvertedImplementation,
            lengthUnitToBeConvertedImplementation,
          ], 0);

      lengthUnitConverter = LengthUnitConverter(measureUnitConverter);
      lengthUnitConverterViewModel = LengthUnitConverterViewModel(
        lengthUnitConverter,
        keyValueDatabase,
      );

      lengthUnitConverterViewModel.reset();

      lengthUnitConverterViewModel.dismissRecovery();

      try {
        lengthUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });
  });
}
