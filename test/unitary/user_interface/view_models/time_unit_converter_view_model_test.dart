import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/time_unit_converter_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeUnitConverterViewModel\" Class", () {
    late bool isTimeUnitConverted;
    final timeUnitToBeConvertedImplementation = TIME_UNIT_TO_CONVERT_TO((_) {
      isTimeUnitConverted = true;
    });
    late TimeUnitConverter timeUnitConverter;
    late MeasureUnitConverter<TimeUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late TimeUnitConverterViewModel timeUnitConverterViewModel;

    setUp(() {
      isTimeUnitConverted = false;

      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<TimeUnit>(ZEROED_TIME_UNIT, [
        timeUnitToBeConvertedImplementation,
      ], 0);

      timeUnitConverter = TimeUnitConverter(measureUnitConverter);

      timeUnitConverterViewModel = TimeUnitConverterViewModel(
        timeUnitConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With \"TimeUnitConverter\" Data",
      () {
        expect(
          timeUnitConverterViewModel.listOfTimeUnits.value[0].value,
          TIME_UNIT_VALUE,
        );
        expect(
          timeUnitConverterViewModel.listOfTimeUnits.value[0].measureUnit,
          timeUnitToBeConvertedImplementation.measureUnit,
        );

        expect(timeUnitConverterViewModel.baseTimeUnitIndex.value, 0);
      },
    );

    test("Test If Method \"addTimeUnit\" Adds Time Unit And Stores Values", () {
      timeUnitConverterViewModel.addTimeUnit();

      final listOfTimeUnitsFromKeyValueDatabase =
          TimeUnitConverterDataStore.getListOfTimeUnits(keyValueDatabase);

      expect(timeUnitConverterViewModel.listOfTimeUnits.value.length, 2);
      expect(listOfTimeUnitsFromKeyValueDatabase.length, 2);
    });

    test("Test If Method \"addTimeUnitAt\" Adds Time Unit At Given Index", () {
      timeUnitConverterViewModel.addTimeUnitAt(1);

      final listOfTimeUnitsFromKeyValueDatabase =
          TimeUnitConverterDataStore.getListOfTimeUnits(keyValueDatabase);

      expect(timeUnitConverterViewModel.listOfTimeUnits.value.length, 2);
      expect(listOfTimeUnitsFromKeyValueDatabase.length, 2);
    });

    test(
      "Test If Method \"updateBaseTimeUnitIndex\" Updates Base Index And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<TimeUnit>(ZEROED_TIME_UNIT, [
              timeUnitToBeConvertedImplementation,
              timeUnitToBeConvertedImplementation,
            ], 0);

        timeUnitConverter = TimeUnitConverter(measureUnitConverter);
        timeUnitConverterViewModel = TimeUnitConverterViewModel(
          timeUnitConverter,
          keyValueDatabase,
        );

        timeUnitConverterViewModel.updateBaseTimeUnitIndex(1);

        final baseTimeUnitIndexFromKeyValueDatabase =
            TimeUnitConverterDataStore.getBaseTimeUnitIndex(keyValueDatabase);

        expect(timeUnitConverterViewModel.baseTimeUnitIndex.value, 1);
        expect(baseTimeUnitIndexFromKeyValueDatabase, 1);
        expect(isTimeUnitConverted, true);
      },
    );

    test("Test If Method \"updateTimeUnitAt\" Updates Unit At Given Index", () {
      bool isTimeUnitUpdated = false;

      final updatedTimeUnitImplementation = UPDATED_TIME_UNIT((_) {
        isTimeUnitUpdated = true;
      });

      measureUnitConverter = MeasureUnitConverter<TimeUnit>(ZEROED_TIME_UNIT, [
        timeUnitToBeConvertedImplementation,
        timeUnitToBeConvertedImplementation,
      ], 0);

      timeUnitConverter = TimeUnitConverter(measureUnitConverter);
      timeUnitConverterViewModel = TimeUnitConverterViewModel(
        timeUnitConverter,
        keyValueDatabase,
      );

      timeUnitConverterViewModel.updateTimeUnitAt(
        updatedTimeUnitImplementation,
        1,
      );

      final listOfTimeUnitsFromKeyValueDatabase =
          TimeUnitConverterDataStore.getListOfTimeUnits(keyValueDatabase);

      final baseTimeUnitIndexFromKeyValueDatabase =
          TimeUnitConverterDataStore.getBaseTimeUnitIndex(keyValueDatabase);

      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value[1].value,
        updatedTimeUnitImplementation.value,
      );
      expect(
        listOfTimeUnitsFromKeyValueDatabase[1].value,
        updatedTimeUnitImplementation.value,
      );

      expect(timeUnitConverterViewModel.baseTimeUnitIndex.value, 1);
      expect(baseTimeUnitIndexFromKeyValueDatabase, 1);

      expect(isTimeUnitConverted, true);
      expect(isTimeUnitUpdated, true);
    });

    test(
      "Test If Method \"removeTimeUnit\" Removes Unit And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<TimeUnit>(ZEROED_TIME_UNIT, [
              timeUnitToBeConvertedImplementation,
              timeUnitToBeConvertedImplementation,
            ], 0);

        timeUnitConverter = TimeUnitConverter(measureUnitConverter);
        timeUnitConverterViewModel = TimeUnitConverterViewModel(
          timeUnitConverter,
          keyValueDatabase,
        );

        timeUnitConverterViewModel.removeTimeUnit(1);

        final listOfTimeUnitsFromKeyValueDatabase =
            TimeUnitConverterDataStore.getListOfTimeUnits(keyValueDatabase);

        expect(timeUnitConverterViewModel.listOfTimeUnits.value.length, 1);
        expect(listOfTimeUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test("Test If Method \"reset\" Resets Time Unit Converter", () {
      measureUnitConverter = MeasureUnitConverter<TimeUnit>(ZEROED_TIME_UNIT, [
        timeUnitToBeConvertedImplementation,
        timeUnitToBeConvertedImplementation,
      ], 0);

      timeUnitConverter = TimeUnitConverter(measureUnitConverter);
      timeUnitConverterViewModel = TimeUnitConverterViewModel(
        timeUnitConverter,
        keyValueDatabase,
      );

      timeUnitConverterViewModel.reset();

      final listOfTimeUnitsFromKeyValueDatabase =
          TimeUnitConverterDataStore.getListOfTimeUnits(keyValueDatabase);

      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value[0].value,
        ZEROED_TIME_UNIT.value,
      );
      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value[0].measureUnit,
        ZEROED_TIME_UNIT.measureUnit,
      );
      expect(
        listOfTimeUnitsFromKeyValueDatabase[0].value,
        ZEROED_TIME_UNIT.value,
      );
      expect(
        listOfTimeUnitsFromKeyValueDatabase[0].measureUnit,
        ZEROED_TIME_UNIT.measureUnit,
      );

      expect(timeUnitConverterViewModel.listOfTimeUnits.value.length, 1);
      expect(listOfTimeUnitsFromKeyValueDatabase.length, 1);
    });

    test(
      "Test If Method \"restore\" Restores Deleted Time Units And Stores Values On Key-Value Database",
      () {
        measureUnitConverter =
            MeasureUnitConverter<TimeUnit>(ZEROED_TIME_UNIT, [
              timeUnitToBeConvertedImplementation,
              timeUnitToBeConvertedImplementation,
            ], 0);

        timeUnitConverter = TimeUnitConverter(measureUnitConverter);
        timeUnitConverterViewModel = TimeUnitConverterViewModel(
          timeUnitConverter,
          keyValueDatabase,
        );

        timeUnitConverterViewModel.reset();

        timeUnitConverterViewModel.restore();

        final listOfTimeUnitsFromKeyValueDatabase =
            TimeUnitConverterDataStore.getListOfTimeUnits(keyValueDatabase);

        expect(timeUnitConverterViewModel.listOfTimeUnits.value.length, 2);
        expect(listOfTimeUnitsFromKeyValueDatabase.length, 2);
        expect(timeUnitConverter.listOfTimeUnits.length, 2);
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      measureUnitConverter = MeasureUnitConverter<TimeUnit>(ZEROED_TIME_UNIT, [
        timeUnitToBeConvertedImplementation,
        timeUnitToBeConvertedImplementation,
      ], 0);

      timeUnitConverter = TimeUnitConverter(measureUnitConverter);
      timeUnitConverterViewModel = TimeUnitConverterViewModel(
        timeUnitConverter,
        keyValueDatabase,
      );

      timeUnitConverterViewModel.reset();

      timeUnitConverterViewModel.dismissRecovery();

      try {
        timeUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });
  });
}
