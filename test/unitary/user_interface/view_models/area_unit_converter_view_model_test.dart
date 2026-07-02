import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/area_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"AreaUnitConverterViewModel\" Class", () {
    late bool isAreaUnitConverted;
    final areaUnitToBeConvertedImplementation = AREA_UNIT_TO_CONVERT_TO((_) {
      isAreaUnitConverted = true;
    });
    late AreaUnitConverter areaUnitConverter;
    late MeasureUnitConverter<AreaUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late AreaUnitConverterViewModel areaUnitConverterViewModel;

    setUp(() {
      isAreaUnitConverted = false;

      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<AreaUnit>(ZEROED_AREA_UNIT, [
        areaUnitToBeConvertedImplementation,
      ], 0);

      areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      areaUnitConverterViewModel = AreaUnitConverterViewModel(
        areaUnitConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With \"AreaUnitConverter\" Data",
      () {
        expect(
          areaUnitConverterViewModel.listOfAreaUnits.value[0].value,
          AREA_UNIT_VALUE,
        );
        expect(
          areaUnitConverterViewModel.listOfAreaUnits.value[0].measureUnit,
          areaUnitToBeConvertedImplementation.measureUnit,
        );

        expect(areaUnitConverterViewModel.baseAreaUnitIndex.value, 0);
      },
    );

    test("Test If Method \"addAreaUnit\" Adds Area Unit And Stores Values", () {
      areaUnitConverterViewModel.addAreaUnit();

      final listOfAreaUnitsFromKeyValueDatabase =
          AreaUnitConverterDataStore.getListOfAreaUnits(keyValueDatabase);

      expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 2);
      expect(listOfAreaUnitsFromKeyValueDatabase.length, 2);
    });

    test("Test If Method \"addAreaUnitAt\" Adds Area Unit At Given Index", () {
      areaUnitConverterViewModel.addAreaUnitAt(1);

      final listOfAreaUnitsFromKeyValueDatabase =
          AreaUnitConverterDataStore.getListOfAreaUnits(keyValueDatabase);

      expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 2);
      expect(listOfAreaUnitsFromKeyValueDatabase.length, 2);
    });

    test(
      "Test If Method \"updateBaseAreaUnitIndex\" Updates Base Index And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<AreaUnit>(ZEROED_AREA_UNIT, [
              areaUnitToBeConvertedImplementation,
              areaUnitToBeConvertedImplementation,
            ], 0);

        areaUnitConverter = AreaUnitConverter(measureUnitConverter);
        areaUnitConverterViewModel = AreaUnitConverterViewModel(
          areaUnitConverter,
          keyValueDatabase,
        );

        areaUnitConverterViewModel.updateBaseAreaUnitIndex(1);

        final baseAreaUnitIndexFromKeyValueDatabase =
            AreaUnitConverterDataStore.getBaseAreaUnitIndex(keyValueDatabase);

        expect(areaUnitConverterViewModel.baseAreaUnitIndex.value, 1);
        expect(baseAreaUnitIndexFromKeyValueDatabase, 1);
        expect(isAreaUnitConverted, true);
      },
    );

    test("Test If Method \"updateAreaUnitAt\" Updates Unit At Given Index", () {
      bool isAreaUnitUpdated = false;

      final updatedAreaUnitImplementation = UPDATED_AREA_UNIT((_) {
        isAreaUnitUpdated = true;
      });

      measureUnitConverter = MeasureUnitConverter<AreaUnit>(ZEROED_AREA_UNIT, [
        areaUnitToBeConvertedImplementation,
        areaUnitToBeConvertedImplementation,
      ], 0);

      areaUnitConverter = AreaUnitConverter(measureUnitConverter);
      areaUnitConverterViewModel = AreaUnitConverterViewModel(
        areaUnitConverter,
        keyValueDatabase,
      );

      areaUnitConverterViewModel.updateAreaUnitAt(
        updatedAreaUnitImplementation,
        1,
      );

      final listOfAreaUnitsFromKeyValueDatabase =
          AreaUnitConverterDataStore.getListOfAreaUnits(keyValueDatabase);

      final baseAreaUnitIndexFromKeyValueDatabase =
          AreaUnitConverterDataStore.getBaseAreaUnitIndex(keyValueDatabase);

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value[1].value,
        updatedAreaUnitImplementation.value,
      );
      expect(
        listOfAreaUnitsFromKeyValueDatabase[1].value,
        updatedAreaUnitImplementation.value,
      );

      expect(areaUnitConverterViewModel.baseAreaUnitIndex.value, 1);
      expect(baseAreaUnitIndexFromKeyValueDatabase, 1);

      expect(isAreaUnitConverted, true);
      expect(isAreaUnitUpdated, true);
    });

    test(
      "Test If Method \"removeAreaUnit\" Removes Unit And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<AreaUnit>(ZEROED_AREA_UNIT, [
              areaUnitToBeConvertedImplementation,
              areaUnitToBeConvertedImplementation,
            ], 0);

        areaUnitConverter = AreaUnitConverter(measureUnitConverter);
        areaUnitConverterViewModel = AreaUnitConverterViewModel(
          areaUnitConverter,
          keyValueDatabase,
        );

        areaUnitConverterViewModel.removeAreaUnit(1);

        final listOfAreaUnitsFromKeyValueDatabase =
            AreaUnitConverterDataStore.getListOfAreaUnits(keyValueDatabase);

        expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 1);
        expect(listOfAreaUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test("Test If Method \"reset\" Resets Area Unit Converter", () {
      measureUnitConverter = MeasureUnitConverter<AreaUnit>(ZEROED_AREA_UNIT, [
        areaUnitToBeConvertedImplementation,
        areaUnitToBeConvertedImplementation,
      ], 0);

      areaUnitConverter = AreaUnitConverter(measureUnitConverter);
      areaUnitConverterViewModel = AreaUnitConverterViewModel(
        areaUnitConverter,
        keyValueDatabase,
      );

      areaUnitConverterViewModel.reset();

      final listOfAreaUnitsFromKeyValueDatabase =
          AreaUnitConverterDataStore.getListOfAreaUnits(keyValueDatabase);

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value[0].value,
        ZEROED_AREA_UNIT.value,
      );
      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value[0].measureUnit,
        ZEROED_AREA_UNIT.measureUnit,
      );
      expect(
        listOfAreaUnitsFromKeyValueDatabase[0].value,
        ZEROED_AREA_UNIT.value,
      );
      expect(
        listOfAreaUnitsFromKeyValueDatabase[0].measureUnit,
        ZEROED_AREA_UNIT.measureUnit,
      );

      expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 1);
      expect(listOfAreaUnitsFromKeyValueDatabase.length, 1);
    });

    test(
      "Test If Method \"restore\" Restores Deleted Area Units And Stores Values On Key-Value Database",
      () {
        measureUnitConverter =
            MeasureUnitConverter<AreaUnit>(ZEROED_AREA_UNIT, [
              areaUnitToBeConvertedImplementation,
              areaUnitToBeConvertedImplementation,
            ], 0);

        areaUnitConverter = AreaUnitConverter(measureUnitConverter);
        areaUnitConverterViewModel = AreaUnitConverterViewModel(
          areaUnitConverter,
          keyValueDatabase,
        );

        areaUnitConverterViewModel.reset();

        areaUnitConverterViewModel.restore();

        final listOfAreaUnitsFromKeyValueDatabase =
            AreaUnitConverterDataStore.getListOfAreaUnits(keyValueDatabase);

        expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 2);
        expect(listOfAreaUnitsFromKeyValueDatabase.length, 2);
        expect(areaUnitConverter.listOfAreaUnits.length, 2);
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      measureUnitConverter = MeasureUnitConverter<AreaUnit>(ZEROED_AREA_UNIT, [
        areaUnitToBeConvertedImplementation,
        areaUnitToBeConvertedImplementation,
      ], 0);

      areaUnitConverter = AreaUnitConverter(measureUnitConverter);
      areaUnitConverterViewModel = AreaUnitConverterViewModel(
        areaUnitConverter,
        keyValueDatabase,
      );

      areaUnitConverterViewModel.reset();

      areaUnitConverterViewModel.dismissRecovery();

      try {
        areaUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });
  });
}
