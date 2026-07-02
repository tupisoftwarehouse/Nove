import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/temperature_unit_converter_data_store.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TemperatureUnitConverterViewModel\" Class", () {
    late bool isTemperatureUnitConverted;
    final temperatureUnitToBeConvertedImplementation =
        TEMPERATURE_UNIT_TO_CONVERT_TO((_) {
          isTemperatureUnitConverted = true;
        });
    late TemperatureUnitConverter temperatureUnitConverter;
    late MeasureUnitConverter<TemperatureUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late TemperatureUnitConverterViewModel temperatureUnitConverterViewModel;

    setUp(() {
      isTemperatureUnitConverted = false;

      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
        ZEROED_TEMPERATURE_UNIT,
        [temperatureUnitToBeConvertedImplementation],
        0,
      );

      temperatureUnitConverter = TemperatureUnitConverter(measureUnitConverter);

      temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
        temperatureUnitConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With \"TemperatureUnitConverter\" Data",
      () {
        expect(
          temperatureUnitConverterViewModel
              .listOfTemperatureUnits
              .value[0]
              .value,
          TEMPERATURE_UNIT_VALUE,
        );
        expect(
          temperatureUnitConverterViewModel
              .listOfTemperatureUnits
              .value[0]
              .measureUnit,
          temperatureUnitToBeConvertedImplementation.measureUnit,
        );

        expect(
          temperatureUnitConverterViewModel.baseTemperatureUnitIndex.value,
          0,
        );
      },
    );

    test(
      "Test If Method \"addTemperatureUnit\" Adds Temperature Unit And Stores Values",
      () {
        temperatureUnitConverterViewModel.addTemperatureUnit();

        final listOfTemperatureUnitsFromKeyValueDatabase =
            TemperatureUnitConverterDataStore.getListOfTemperatureUnits(
              keyValueDatabase,
            );

        expect(
          temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
          2,
        );
        expect(listOfTemperatureUnitsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"addTemperatureUnitAt\" Adds Temperature Unit At Given Index",
      () {
        temperatureUnitConverterViewModel.addTemperatureUnitAt(1);

        final listOfTemperatureUnitsFromKeyValueDatabase =
            TemperatureUnitConverterDataStore.getListOfTemperatureUnits(
              keyValueDatabase,
            );

        expect(
          temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
          2,
        );
        expect(listOfTemperatureUnitsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"updateBaseTemperatureUnitIndex\" Updates Base Index And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<TemperatureUnit>(ZEROED_TEMPERATURE_UNIT, [
              temperatureUnitToBeConvertedImplementation,
              temperatureUnitToBeConvertedImplementation,
            ], 0);

        temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );
        temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
          temperatureUnitConverter,
          keyValueDatabase,
        );

        temperatureUnitConverterViewModel.updateBaseTemperatureUnitIndex(1);

        final baseTemperatureUnitIndexFromKeyValueDatabase =
            TemperatureUnitConverterDataStore.getBaseTemperatureUnitIndex(
              keyValueDatabase,
            );

        expect(
          temperatureUnitConverterViewModel.baseTemperatureUnitIndex.value,
          1,
        );
        expect(baseTemperatureUnitIndexFromKeyValueDatabase, 1);
        expect(isTemperatureUnitConverted, true);
      },
    );

    test(
      "Test If Method \"updateTemperatureUnitAt\" Updates Unit At Given Index",
      () {
        bool isTemperatureUnitUpdated = false;

        final updatedTemperatureUnitImplementation = UPDATED_TEMPERATURE_UNIT((
          _,
        ) {
          isTemperatureUnitUpdated = true;
        });

        measureUnitConverter =
            MeasureUnitConverter<TemperatureUnit>(ZEROED_TEMPERATURE_UNIT, [
              temperatureUnitToBeConvertedImplementation,
              temperatureUnitToBeConvertedImplementation,
            ], 0);

        temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );
        temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
          temperatureUnitConverter,
          keyValueDatabase,
        );

        temperatureUnitConverterViewModel.updateTemperatureUnitAt(
          updatedTemperatureUnitImplementation,
          1,
        );

        final listOfTemperatureUnitsFromKeyValueDatabase =
            TemperatureUnitConverterDataStore.getListOfTemperatureUnits(
              keyValueDatabase,
            );

        final baseTemperatureUnitIndexFromKeyValueDatabase =
            TemperatureUnitConverterDataStore.getBaseTemperatureUnitIndex(
              keyValueDatabase,
            );

        expect(
          temperatureUnitConverterViewModel
              .listOfTemperatureUnits
              .value[1]
              .value,
          updatedTemperatureUnitImplementation.value,
        );
        expect(
          listOfTemperatureUnitsFromKeyValueDatabase[1].value,
          updatedTemperatureUnitImplementation.value,
        );

        expect(
          temperatureUnitConverterViewModel.baseTemperatureUnitIndex.value,
          1,
        );
        expect(baseTemperatureUnitIndexFromKeyValueDatabase, 1);

        expect(isTemperatureUnitConverted, true);
        expect(isTemperatureUnitUpdated, true);
      },
    );

    test(
      "Test If Method \"removeTemperatureUnit\" Removes Unit And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<TemperatureUnit>(ZEROED_TEMPERATURE_UNIT, [
              temperatureUnitToBeConvertedImplementation,
              temperatureUnitToBeConvertedImplementation,
            ], 0);

        temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );
        temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
          temperatureUnitConverter,
          keyValueDatabase,
        );

        temperatureUnitConverterViewModel.removeTemperatureUnit(1);

        final listOfTemperatureUnitsFromKeyValueDatabase =
            TemperatureUnitConverterDataStore.getListOfTemperatureUnits(
              keyValueDatabase,
            );

        expect(
          temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
          1,
        );
        expect(listOfTemperatureUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test("Test If Method \"reset\" Resets Temperature Unit Converter", () {
      measureUnitConverter =
          MeasureUnitConverter<TemperatureUnit>(ZEROED_TEMPERATURE_UNIT, [
            temperatureUnitToBeConvertedImplementation,
            temperatureUnitToBeConvertedImplementation,
          ], 0);

      temperatureUnitConverter = TemperatureUnitConverter(measureUnitConverter);
      temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
        temperatureUnitConverter,
        keyValueDatabase,
      );

      temperatureUnitConverterViewModel.reset();

      final listOfTemperatureUnitsFromKeyValueDatabase =
          TemperatureUnitConverterDataStore.getListOfTemperatureUnits(
            keyValueDatabase,
          );

      expect(
        temperatureUnitConverterViewModel.listOfTemperatureUnits.value[0].value,
        ZEROED_TEMPERATURE_UNIT.value,
      );
      expect(
        temperatureUnitConverterViewModel
            .listOfTemperatureUnits
            .value[0]
            .measureUnit,
        ZEROED_TEMPERATURE_UNIT.measureUnit,
      );
      expect(
        listOfTemperatureUnitsFromKeyValueDatabase[0].value,
        ZEROED_TEMPERATURE_UNIT.value,
      );
      expect(
        listOfTemperatureUnitsFromKeyValueDatabase[0].measureUnit,
        ZEROED_TEMPERATURE_UNIT.measureUnit,
      );

      expect(
        temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
        1,
      );
      expect(listOfTemperatureUnitsFromKeyValueDatabase.length, 1);
    });

    test(
      "Test If Method \"restore\" Restores Deleted Temperature Units And Stores Values On Key-Value Database",
      () {
        measureUnitConverter =
            MeasureUnitConverter<TemperatureUnit>(ZEROED_TEMPERATURE_UNIT, [
              temperatureUnitToBeConvertedImplementation,
              temperatureUnitToBeConvertedImplementation,
            ], 0);

        temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );
        temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
          temperatureUnitConverter,
          keyValueDatabase,
        );

        temperatureUnitConverterViewModel.reset();

        temperatureUnitConverterViewModel.restore();

        final listOfTemperatureUnitsFromKeyValueDatabase =
            TemperatureUnitConverterDataStore.getListOfTemperatureUnits(
              keyValueDatabase,
            );

        expect(
          temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
          2,
        );
        expect(listOfTemperatureUnitsFromKeyValueDatabase.length, 2);
        expect(temperatureUnitConverter.listOfTemperatureUnits.length, 2);
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      measureUnitConverter =
          MeasureUnitConverter<TemperatureUnit>(ZEROED_TEMPERATURE_UNIT, [
            temperatureUnitToBeConvertedImplementation,
            temperatureUnitToBeConvertedImplementation,
          ], 0);

      temperatureUnitConverter = TemperatureUnitConverter(measureUnitConverter);
      temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
        temperatureUnitConverter,
        keyValueDatabase,
      );

      temperatureUnitConverterViewModel.reset();

      temperatureUnitConverterViewModel.dismissRecovery();

      try {
        temperatureUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });
  });
}
