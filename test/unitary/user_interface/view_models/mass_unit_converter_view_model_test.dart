import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/mass_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"MassUnitConverterViewModel\" Class", () {
    late bool isMassUnitConverted;
    final massUnitToBeConvertedImplementation = MASS_UNIT_TO_CONVERT_TO((_) {
      isMassUnitConverted = true;
    });
    late MassUnitConverter massUnitConverter;
    late MeasureUnitConverter<MassUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late MassUnitConverterViewModel massUnitConverterViewModel;

    setUp(() {
      isMassUnitConverted = false;

      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<MassUnit>(ZEROED_MASS_UNIT, [
        massUnitToBeConvertedImplementation,
      ], 0);

      massUnitConverter = MassUnitConverter(measureUnitConverter);

      massUnitConverterViewModel = MassUnitConverterViewModel(
        massUnitConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With \"MassUnitConverter\" Data",
      () {
        expect(
          massUnitConverterViewModel.listOfMassUnits.value[0].value,
          MASS_UNIT_VALUE,
        );
        expect(
          massUnitConverterViewModel.listOfMassUnits.value[0].measureUnit,
          massUnitToBeConvertedImplementation.measureUnit,
        );

        expect(massUnitConverterViewModel.baseMassUnitIndex.value, 0);
      },
    );

    test("Test If Method \"addMassUnit\" Adds Mass Unit And Stores Values", () {
      massUnitConverterViewModel.addMassUnit();

      final listOfMassUnitsFromKeyValueDatabase =
          MassUnitConverterDataStore.getListOfMassUnits(keyValueDatabase);

      expect(massUnitConverterViewModel.listOfMassUnits.value.length, 2);
      expect(listOfMassUnitsFromKeyValueDatabase.length, 2);
    });

    test("Test If Method \"addMassUnitAt\" Adds Mass Unit At Given Index", () {
      massUnitConverterViewModel.addMassUnitAt(1);

      final listOfMassUnitsFromKeyValueDatabase =
          MassUnitConverterDataStore.getListOfMassUnits(keyValueDatabase);

      expect(massUnitConverterViewModel.listOfMassUnits.value.length, 2);
      expect(listOfMassUnitsFromKeyValueDatabase.length, 2);
    });

    test(
      "Test If Method \"updateBaseMassUnitIndex\" Updates Base Index And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<MassUnit>(ZEROED_MASS_UNIT, [
              massUnitToBeConvertedImplementation,
              massUnitToBeConvertedImplementation,
            ], 0);

        massUnitConverter = MassUnitConverter(measureUnitConverter);
        massUnitConverterViewModel = MassUnitConverterViewModel(
          massUnitConverter,
          keyValueDatabase,
        );

        massUnitConverterViewModel.updateBaseMassUnitIndex(1);

        final baseMassUnitIndexFromKeyValueDatabase =
            MassUnitConverterDataStore.getBaseMassUnitIndex(keyValueDatabase);

        expect(massUnitConverterViewModel.baseMassUnitIndex.value, 1);
        expect(baseMassUnitIndexFromKeyValueDatabase, 1);
        expect(isMassUnitConverted, true);
      },
    );

    test("Test If Method \"updateMassUnitAt\" Updates Unit At Given Index", () {
      bool isMassUnitUpdated = false;

      final updatedMassUnitImplementation = UPDATED_MASS_UNIT((_) {
        isMassUnitUpdated = true;
      });

      measureUnitConverter = MeasureUnitConverter<MassUnit>(ZEROED_MASS_UNIT, [
        massUnitToBeConvertedImplementation,
        massUnitToBeConvertedImplementation,
      ], 0);

      massUnitConverter = MassUnitConverter(measureUnitConverter);
      massUnitConverterViewModel = MassUnitConverterViewModel(
        massUnitConverter,
        keyValueDatabase,
      );

      massUnitConverterViewModel.updateMassUnitAt(
        updatedMassUnitImplementation,
        1,
      );

      final listOfMassUnitsFromKeyValueDatabase =
          MassUnitConverterDataStore.getListOfMassUnits(keyValueDatabase);

      final baseMassUnitIndexFromKeyValueDatabase =
          MassUnitConverterDataStore.getBaseMassUnitIndex(keyValueDatabase);

      expect(
        massUnitConverterViewModel.listOfMassUnits.value[1].value,
        updatedMassUnitImplementation.value,
      );
      expect(
        listOfMassUnitsFromKeyValueDatabase[1].value,
        updatedMassUnitImplementation.value,
      );

      expect(massUnitConverterViewModel.baseMassUnitIndex.value, 1);
      expect(baseMassUnitIndexFromKeyValueDatabase, 1);

      expect(isMassUnitConverted, true);
      expect(isMassUnitUpdated, true);
    });

    test(
      "Test If Method \"removeMassUnit\" Removes Unit And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<MassUnit>(ZEROED_MASS_UNIT, [
              massUnitToBeConvertedImplementation,
              massUnitToBeConvertedImplementation,
            ], 0);

        massUnitConverter = MassUnitConverter(measureUnitConverter);
        massUnitConverterViewModel = MassUnitConverterViewModel(
          massUnitConverter,
          keyValueDatabase,
        );

        massUnitConverterViewModel.removeMassUnit(1);

        final listOfMassUnitsFromKeyValueDatabase =
            MassUnitConverterDataStore.getListOfMassUnits(keyValueDatabase);

        expect(massUnitConverterViewModel.listOfMassUnits.value.length, 1);
        expect(listOfMassUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test("Test If Method \"reset\" Resets Mass Unit Converter", () {
      measureUnitConverter = MeasureUnitConverter<MassUnit>(ZEROED_MASS_UNIT, [
        massUnitToBeConvertedImplementation,
        massUnitToBeConvertedImplementation,
      ], 0);

      massUnitConverter = MassUnitConverter(measureUnitConverter);
      massUnitConverterViewModel = MassUnitConverterViewModel(
        massUnitConverter,
        keyValueDatabase,
      );

      massUnitConverterViewModel.reset();

      final listOfMassUnitsFromKeyValueDatabase =
          MassUnitConverterDataStore.getListOfMassUnits(keyValueDatabase);

      expect(
        massUnitConverterViewModel.listOfMassUnits.value[0].value,
        ZEROED_MASS_UNIT.value,
      );
      expect(
        massUnitConverterViewModel.listOfMassUnits.value[0].measureUnit,
        ZEROED_MASS_UNIT.measureUnit,
      );
      expect(
        listOfMassUnitsFromKeyValueDatabase[0].value,
        ZEROED_MASS_UNIT.value,
      );
      expect(
        listOfMassUnitsFromKeyValueDatabase[0].measureUnit,
        ZEROED_MASS_UNIT.measureUnit,
      );

      expect(massUnitConverterViewModel.listOfMassUnits.value.length, 1);
      expect(listOfMassUnitsFromKeyValueDatabase.length, 1);
    });

    test(
      "Test If Method \"restore\" Restores Deleted Mass Units And Stores Values On Key-Value Database",
      () {
        measureUnitConverter =
            MeasureUnitConverter<MassUnit>(ZEROED_MASS_UNIT, [
              massUnitToBeConvertedImplementation,
              massUnitToBeConvertedImplementation,
            ], 0);

        massUnitConverter = MassUnitConverter(measureUnitConverter);
        massUnitConverterViewModel = MassUnitConverterViewModel(
          massUnitConverter,
          keyValueDatabase,
        );

        massUnitConverterViewModel.reset();

        massUnitConverterViewModel.restore();

        final listOfMassUnitsFromKeyValueDatabase =
            MassUnitConverterDataStore.getListOfMassUnits(keyValueDatabase);

        expect(massUnitConverterViewModel.listOfMassUnits.value.length, 2);
        expect(listOfMassUnitsFromKeyValueDatabase.length, 2);
        expect(massUnitConverter.listOfMassUnits.length, 2);
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      measureUnitConverter = MeasureUnitConverter<MassUnit>(ZEROED_MASS_UNIT, [
        massUnitToBeConvertedImplementation,
        massUnitToBeConvertedImplementation,
      ], 0);

      massUnitConverter = MassUnitConverter(measureUnitConverter);
      massUnitConverterViewModel = MassUnitConverterViewModel(
        massUnitConverter,
        keyValueDatabase,
      );

      massUnitConverterViewModel.reset();

      massUnitConverterViewModel.dismissRecovery();

      try {
        massUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });
  });
}
