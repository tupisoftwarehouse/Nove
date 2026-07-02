import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/speed_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"SpeedUnitConverterViewModel\" Class", () {
    late bool isSpeedUnitConverted;
    final speedUnitToBeConvertedImplementation = SPEED_UNIT_TO_CONVERT_TO((_) {
      isSpeedUnitConverted = true;
    });
    late SpeedUnitConverter speedUnitConverter;
    late MeasureUnitConverter<SpeedUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late SpeedUnitConverterViewModel speedUnitConverterViewModel;

    setUp(() {
      isSpeedUnitConverted = false;

      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
        ZEROED_SPEED_UNIT,
        [speedUnitToBeConvertedImplementation],
        0,
      );

      speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

      speedUnitConverterViewModel = SpeedUnitConverterViewModel(
        speedUnitConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With \"SpeedUnitConverter\" Data",
      () {
        expect(
          speedUnitConverterViewModel.listOfSpeedUnits.value[0].value,
          SPEED_UNIT_VALUE,
        );
        expect(
          speedUnitConverterViewModel.listOfSpeedUnits.value[0].measureUnit,
          speedUnitToBeConvertedImplementation.measureUnit,
        );

        expect(speedUnitConverterViewModel.baseSpeedUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"addSpeedUnit\" Adds Speed Unit And Stores Values",
      () {
        speedUnitConverterViewModel.addSpeedUnit();

        final listOfSpeedUnitsFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getListOfSpeedUnits(keyValueDatabase);

        expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 2);
        expect(listOfSpeedUnitsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"addSpeedUnitAt\" Adds Speed Unit At Given Index",
      () {
        speedUnitConverterViewModel.addSpeedUnitAt(1);

        final listOfSpeedUnitsFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getListOfSpeedUnits(keyValueDatabase);

        expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 2);
        expect(listOfSpeedUnitsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"updateBaseSpeedUnitIndex\" Updates Base Index And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<SpeedUnit>(ZEROED_SPEED_UNIT, [
              speedUnitToBeConvertedImplementation,
              speedUnitToBeConvertedImplementation,
            ], 0);

        speedUnitConverter = SpeedUnitConverter(measureUnitConverter);
        speedUnitConverterViewModel = SpeedUnitConverterViewModel(
          speedUnitConverter,
          keyValueDatabase,
        );

        speedUnitConverterViewModel.updateBaseSpeedUnitIndex(1);

        final baseSpeedUnitIndexFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getBaseSpeedUnitIndex(keyValueDatabase);

        expect(speedUnitConverterViewModel.baseSpeedUnitIndex.value, 1);
        expect(baseSpeedUnitIndexFromKeyValueDatabase, 1);
        expect(isSpeedUnitConverted, true);
      },
    );

    test(
      "Test If Method \"updateSpeedUnitAt\" Updates Unit At Given Index",
      () {
        bool isSpeedUnitUpdated = false;

        final updatedSpeedUnitImplementation = UPDATED_SPEED_UNIT((_) {
          isSpeedUnitUpdated = true;
        });

        measureUnitConverter =
            MeasureUnitConverter<SpeedUnit>(ZEROED_SPEED_UNIT, [
              speedUnitToBeConvertedImplementation,
              speedUnitToBeConvertedImplementation,
            ], 0);

        speedUnitConverter = SpeedUnitConverter(measureUnitConverter);
        speedUnitConverterViewModel = SpeedUnitConverterViewModel(
          speedUnitConverter,
          keyValueDatabase,
        );

        speedUnitConverterViewModel.updateSpeedUnitAt(
          updatedSpeedUnitImplementation,
          1,
        );

        final listOfSpeedUnitsFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getListOfSpeedUnits(keyValueDatabase);

        final baseSpeedUnitIndexFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getBaseSpeedUnitIndex(keyValueDatabase);

        expect(
          speedUnitConverterViewModel.listOfSpeedUnits.value[1].value,
          updatedSpeedUnitImplementation.value,
        );
        expect(
          listOfSpeedUnitsFromKeyValueDatabase[1].value,
          updatedSpeedUnitImplementation.value,
        );

        expect(speedUnitConverterViewModel.baseSpeedUnitIndex.value, 1);
        expect(baseSpeedUnitIndexFromKeyValueDatabase, 1);

        expect(isSpeedUnitConverted, true);
        expect(isSpeedUnitUpdated, true);
      },
    );

    test(
      "Test If Method \"removeSpeedUnit\" Removes Unit And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<SpeedUnit>(ZEROED_SPEED_UNIT, [
              speedUnitToBeConvertedImplementation,
              speedUnitToBeConvertedImplementation,
            ], 0);

        speedUnitConverter = SpeedUnitConverter(measureUnitConverter);
        speedUnitConverterViewModel = SpeedUnitConverterViewModel(
          speedUnitConverter,
          keyValueDatabase,
        );

        speedUnitConverterViewModel.removeSpeedUnit(1);

        final listOfSpeedUnitsFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getListOfSpeedUnits(keyValueDatabase);

        expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 1);
        expect(listOfSpeedUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test("Test If Method \"reset\" Resets Speed Unit Converter", () {
      measureUnitConverter =
          MeasureUnitConverter<SpeedUnit>(ZEROED_SPEED_UNIT, [
            speedUnitToBeConvertedImplementation,
            speedUnitToBeConvertedImplementation,
          ], 0);

      speedUnitConverter = SpeedUnitConverter(measureUnitConverter);
      speedUnitConverterViewModel = SpeedUnitConverterViewModel(
        speedUnitConverter,
        keyValueDatabase,
      );

      speedUnitConverterViewModel.reset();

      final listOfSpeedUnitsFromKeyValueDatabase =
          SpeedUnitConverterDataStore.getListOfSpeedUnits(keyValueDatabase);

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value[0].value,
        ZEROED_SPEED_UNIT.value,
      );
      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value[0].measureUnit,
        ZEROED_SPEED_UNIT.measureUnit,
      );
      expect(
        listOfSpeedUnitsFromKeyValueDatabase[0].value,
        ZEROED_SPEED_UNIT.value,
      );
      expect(
        listOfSpeedUnitsFromKeyValueDatabase[0].measureUnit,
        ZEROED_SPEED_UNIT.measureUnit,
      );

      expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 1);
      expect(listOfSpeedUnitsFromKeyValueDatabase.length, 1);
    });

    test(
      "Test If Method \"restore\" Restores Deleted Speed Units And Stores Values On Key-Value Database",
      () {
        measureUnitConverter =
            MeasureUnitConverter<SpeedUnit>(ZEROED_SPEED_UNIT, [
              speedUnitToBeConvertedImplementation,
              speedUnitToBeConvertedImplementation,
            ], 0);

        speedUnitConverter = SpeedUnitConverter(measureUnitConverter);
        speedUnitConverterViewModel = SpeedUnitConverterViewModel(
          speedUnitConverter,
          keyValueDatabase,
        );

        speedUnitConverterViewModel.reset();

        speedUnitConverterViewModel.restore();

        final listOfSpeedUnitsFromKeyValueDatabase =
            SpeedUnitConverterDataStore.getListOfSpeedUnits(keyValueDatabase);

        expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 2);
        expect(listOfSpeedUnitsFromKeyValueDatabase.length, 2);
        expect(speedUnitConverter.listOfSpeedUnits.length, 2);
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      measureUnitConverter =
          MeasureUnitConverter<SpeedUnit>(ZEROED_SPEED_UNIT, [
            speedUnitToBeConvertedImplementation,
            speedUnitToBeConvertedImplementation,
          ], 0);

      speedUnitConverter = SpeedUnitConverter(measureUnitConverter);
      speedUnitConverterViewModel = SpeedUnitConverterViewModel(
        speedUnitConverter,
        keyValueDatabase,
      );

      speedUnitConverterViewModel.reset();

      speedUnitConverterViewModel.dismissRecovery();

      try {
        speedUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });
  });
}
