import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/number_system_converter_data_store.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"NumberSystemConverterViewModel\" Class", () {
    late bool isNumberSystemConverted;
    final numberSystemToBeConvertedImplementation = NUMBER_SYSTEM_TO_CONVERT_TO(
      (_) {
        isNumberSystemConverted = true;
      },
    );
    late NumberSystemConverter numberSystemConverter;
    late MeasureUnitConverter<NumberSystem> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late NumberSystemConverterViewModel numberSystemConverterViewModel;

    setUp(() {
      isNumberSystemConverted = false;

      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<NumberSystem>(
        ZEROED_NUMBER_SYSTEM,
        [numberSystemToBeConvertedImplementation],
        0,
      );

      numberSystemConverter = NumberSystemConverter(measureUnitConverter);

      numberSystemConverterViewModel = NumberSystemConverterViewModel(
        numberSystemConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With \"NumberSystemConverter\" Data",
      () {
        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value[0].value,
          NUMBER_SYSTEM_VALUE,
        );
        expect(
          numberSystemConverterViewModel
              .listOfNumberSystems
              .value[0]
              .measureUnit,
          numberSystemToBeConvertedImplementation.measureUnit,
        );

        expect(numberSystemConverterViewModel.baseNumberSystemIndex.value, 0);
      },
    );

    test(
      "Test If Method \"addNumberSystem\" Adds Number System And Stores Values",
      () {
        numberSystemConverterViewModel.addNumberSystem();

        final listOfNumberSystemsFromKeyValueDatabase =
            NumberSystemConverterDataStore.getListOfNumberSystems(
              keyValueDatabase,
            );

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
          2,
        );
        expect(listOfNumberSystemsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"addNumberSystemAt\" Adds Number System At Given Index",
      () {
        numberSystemConverterViewModel.addNumberSystemAt(1);

        final listOfNumberSystemsFromKeyValueDatabase =
            NumberSystemConverterDataStore.getListOfNumberSystems(
              keyValueDatabase,
            );

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
          2,
        );
        expect(listOfNumberSystemsFromKeyValueDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"updateBaseNumberSystemIndex\" Updates Base Index And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<NumberSystem>(ZEROED_NUMBER_SYSTEM, [
              numberSystemToBeConvertedImplementation,
              numberSystemToBeConvertedImplementation,
            ], 0);

        numberSystemConverter = NumberSystemConverter(measureUnitConverter);
        numberSystemConverterViewModel = NumberSystemConverterViewModel(
          numberSystemConverter,
          keyValueDatabase,
        );

        numberSystemConverterViewModel.updateBaseNumberSystemIndex(1);

        final baseNumberSystemIndexFromKeyValueDatabase =
            NumberSystemConverterDataStore.getBaseNumberSystemIndex(
              keyValueDatabase,
            );

        expect(numberSystemConverterViewModel.baseNumberSystemIndex.value, 1);
        expect(baseNumberSystemIndexFromKeyValueDatabase, 1);
        expect(isNumberSystemConverted, true);
      },
    );

    test(
      "Test If Method \"updateNumberSystemAt\" Updates Number System At Given Index",
      () {
        bool isNumberSystemUpdated = false;

        final updatedNumberSystemImplementation = UPDATED_NUMBER_SYSTEM((_) {
          isNumberSystemUpdated = true;
        });

        measureUnitConverter =
            MeasureUnitConverter<NumberSystem>(ZEROED_NUMBER_SYSTEM, [
              numberSystemToBeConvertedImplementation,
              numberSystemToBeConvertedImplementation,
            ], 0);

        numberSystemConverter = NumberSystemConverter(measureUnitConverter);
        numberSystemConverterViewModel = NumberSystemConverterViewModel(
          numberSystemConverter,
          keyValueDatabase,
        );

        numberSystemConverterViewModel.updateNumberSystemAt(
          updatedNumberSystemImplementation,
          1,
        );

        final listOfNumberSystemsFromKeyValueDatabase =
            NumberSystemConverterDataStore.getListOfNumberSystems(
              keyValueDatabase,
            );

        final baseNumberSystemIndexFromKeyValueDatabase =
            NumberSystemConverterDataStore.getBaseNumberSystemIndex(
              keyValueDatabase,
            );

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value[1].value,
          updatedNumberSystemImplementation.value,
        );
        expect(
          listOfNumberSystemsFromKeyValueDatabase[1].value,
          updatedNumberSystemImplementation.value,
        );

        expect(numberSystemConverterViewModel.baseNumberSystemIndex.value, 1);
        expect(baseNumberSystemIndexFromKeyValueDatabase, 1);

        expect(isNumberSystemConverted, true);
        expect(isNumberSystemUpdated, true);
      },
    );

    test(
      "Test If Method \"removeNumberSystem\" Removes Number System And Stores Values",
      () {
        measureUnitConverter =
            MeasureUnitConverter<NumberSystem>(ZEROED_NUMBER_SYSTEM, [
              numberSystemToBeConvertedImplementation,
              numberSystemToBeConvertedImplementation,
            ], 0);

        numberSystemConverter = NumberSystemConverter(measureUnitConverter);
        numberSystemConverterViewModel = NumberSystemConverterViewModel(
          numberSystemConverter,
          keyValueDatabase,
        );

        numberSystemConverterViewModel.removeNumberSystem(1);

        final listOfNumberSystemsFromKeyValueDatabase =
            NumberSystemConverterDataStore.getListOfNumberSystems(
              keyValueDatabase,
            );

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
          1,
        );
        expect(listOfNumberSystemsFromKeyValueDatabase.length, 1);
      },
    );

    test("Test If Method \"reset\" Resets Number System Converter", () {
      measureUnitConverter =
          MeasureUnitConverter<NumberSystem>(ZEROED_NUMBER_SYSTEM, [
            numberSystemToBeConvertedImplementation,
            numberSystemToBeConvertedImplementation,
          ], 0);

      numberSystemConverter = NumberSystemConverter(measureUnitConverter);
      numberSystemConverterViewModel = NumberSystemConverterViewModel(
        numberSystemConverter,
        keyValueDatabase,
      );

      numberSystemConverterViewModel.reset();

      final listOfNumberSystemsFromKeyValueDatabase =
          NumberSystemConverterDataStore.getListOfNumberSystems(
            keyValueDatabase,
          );

      expect(
        numberSystemConverterViewModel.listOfNumberSystems.value[0].value,
        ZEROED_NUMBER_SYSTEM.value,
      );
      expect(
        numberSystemConverterViewModel.listOfNumberSystems.value[0].measureUnit,
        ZEROED_NUMBER_SYSTEM.measureUnit,
      );
      expect(
        listOfNumberSystemsFromKeyValueDatabase[0].value,
        ZEROED_NUMBER_SYSTEM.value,
      );
      expect(
        listOfNumberSystemsFromKeyValueDatabase[0].measureUnit,
        ZEROED_NUMBER_SYSTEM.measureUnit,
      );

      expect(
        numberSystemConverterViewModel.listOfNumberSystems.value.length,
        1,
      );
      expect(listOfNumberSystemsFromKeyValueDatabase.length, 1);
    });

    test(
      "Test If Method \"restore\" Restores Deleted Number Systems And Stores Values On Key-Value Database",
      () {
        measureUnitConverter =
            MeasureUnitConverter<NumberSystem>(ZEROED_NUMBER_SYSTEM, [
              numberSystemToBeConvertedImplementation,
              numberSystemToBeConvertedImplementation,
            ], 0);

        numberSystemConverter = NumberSystemConverter(measureUnitConverter);
        numberSystemConverterViewModel = NumberSystemConverterViewModel(
          numberSystemConverter,
          keyValueDatabase,
        );

        numberSystemConverterViewModel.reset();

        numberSystemConverterViewModel.restore();

        final listOfNumberSystemsFromKeyValueDatabase =
            NumberSystemConverterDataStore.getListOfNumberSystems(
              keyValueDatabase,
            );

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
          2,
        );
        expect(listOfNumberSystemsFromKeyValueDatabase.length, 2);
        expect(numberSystemConverter.listOfNumberSystems.length, 2);
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      measureUnitConverter =
          MeasureUnitConverter<NumberSystem>(ZEROED_NUMBER_SYSTEM, [
            numberSystemToBeConvertedImplementation,
            numberSystemToBeConvertedImplementation,
          ], 0);

      numberSystemConverter = NumberSystemConverter(measureUnitConverter);
      numberSystemConverterViewModel = NumberSystemConverterViewModel(
        numberSystemConverter,
        keyValueDatabase,
      );

      numberSystemConverterViewModel.reset();

      numberSystemConverterViewModel.dismissRecovery();

      try {
        numberSystemConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });
  });
}
