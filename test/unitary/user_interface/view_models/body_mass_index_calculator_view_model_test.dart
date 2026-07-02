import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/body_mass_index_calculator_data_store.dart";
import "package:nove/user_interface/view_models/body_mass_index_calculator_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"BodyMassIndexCalculatorViewModel\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late BodyMassIndexCalculatorViewModel bodyMassIndexCalculatorViewModel;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();

      bodyMassIndexCalculatorViewModel = BodyMassIndexCalculatorViewModel(
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With Key-Value Database Data",
      () {
        BodyMassIndexCalculatorDataStore.setCandidateHeightValue(
          NORMAL_HEIGHT_IN_CENTIMETERS,
          keyValueDatabase,
        );
        BodyMassIndexCalculatorDataStore.setCandidateWeightValue(
          NORMAL_WEIGHT_IN_KILOGRAMS,
          keyValueDatabase,
        );
        BodyMassIndexCalculatorDataStore.setCalculatedBodyMassIndexValue(
          NORMAL_BODY_MASS_INDEX,
          keyValueDatabase,
        );

        BodyMassIndexCalculatorDataStore.setCalculatedBodyMassIndexValue(
          NORMAL_BODY_MASS_INDEX,
          keyValueDatabase,
        );

        bodyMassIndexCalculatorViewModel = BodyMassIndexCalculatorViewModel(
          keyValueDatabase,
        );

        expect(
          bodyMassIndexCalculatorViewModel.candidateHeight.value,
          NORMAL_HEIGHT_IN_CENTIMETERS,
        );
        expect(
          bodyMassIndexCalculatorViewModel.candidateWeight.value,
          NORMAL_WEIGHT_IN_KILOGRAMS,
        );
        expect(
          bodyMassIndexCalculatorViewModel.bodyMassIndex.value.value,
          NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
        );
      },
    );

    test(
      "Test If Method \"setCandidateHeight\" Updates State And Stores Values",
      () {
        bodyMassIndexCalculatorViewModel.setCandidateHeight(
          NORMAL_HEIGHT_IN_CENTIMETERS,
        );

        final candidateHeightFromDatabase =
            BodyMassIndexCalculatorDataStore.getCandidateHeightValue(
              keyValueDatabase,
            );

        expect(
          bodyMassIndexCalculatorViewModel.candidateHeight.value,
          NORMAL_HEIGHT_IN_CENTIMETERS,
        );
        expect(candidateHeightFromDatabase, NORMAL_HEIGHT_IN_CENTIMETERS);
      },
    );

    test(
      "Test If Method \"setCandidateWeight\" Updates State And Stores Values",
      () {
        bodyMassIndexCalculatorViewModel.setCandidateWeight(
          NORMAL_WEIGHT_IN_KILOGRAMS,
        );

        final candidateWeightFromDatabase =
            BodyMassIndexCalculatorDataStore.getCandidateWeightValue(
              keyValueDatabase,
            );

        expect(
          bodyMassIndexCalculatorViewModel.candidateWeight.value,
          NORMAL_WEIGHT_IN_KILOGRAMS,
        );
        expect(candidateWeightFromDatabase, NORMAL_WEIGHT_IN_KILOGRAMS);
      },
    );

    test(
      "Test If Method \"calculateBodyMassIndex\" Calculates Body Mass Index And Stores Values",
      () {
        BodyMassIndexCalculatorDataStore.setCandidateHeightValue(
          NORMAL_HEIGHT_IN_CENTIMETERS,
          keyValueDatabase,
        );
        BodyMassIndexCalculatorDataStore.setCandidateWeightValue(
          NORMAL_WEIGHT_IN_KILOGRAMS,
          keyValueDatabase,
        );

        bodyMassIndexCalculatorViewModel = BodyMassIndexCalculatorViewModel(
          keyValueDatabase,
        );

        bodyMassIndexCalculatorViewModel.calculateBodyMassIndex();

        final bodyMassIndexFromDatabase =
            BodyMassIndexCalculatorDataStore.getCalculatedBodyMassIndexValue(
              keyValueDatabase,
            );

        expect(
          bodyMassIndexCalculatorViewModel.bodyMassIndex.value.value,
          NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
        );
        expect(
          bodyMassIndexFromDatabase.value,
          NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
        );
      },
    );

    test("Test If Method \"reset\" Resets Body Mass Index Data", () {
      BodyMassIndexCalculatorDataStore.setCandidateHeightValue(
        NORMAL_HEIGHT_IN_CENTIMETERS,
        keyValueDatabase,
      );
      BodyMassIndexCalculatorDataStore.setCandidateWeightValue(
        NORMAL_WEIGHT_IN_KILOGRAMS,
        keyValueDatabase,
      );
      BodyMassIndexCalculatorDataStore.setCalculatedBodyMassIndexValue(
        NORMAL_BODY_MASS_INDEX,
        keyValueDatabase,
      );

      bodyMassIndexCalculatorViewModel = BodyMassIndexCalculatorViewModel(
        keyValueDatabase,
      );

      bodyMassIndexCalculatorViewModel.reset();

      final candidateHeightFromDatabase =
          BodyMassIndexCalculatorDataStore.getCandidateHeightValue(
            keyValueDatabase,
          );
      final candidateWeightFromDatabase =
          BodyMassIndexCalculatorDataStore.getCandidateWeightValue(
            keyValueDatabase,
          );
      final bodyMassIndexFromDatabase =
          BodyMassIndexCalculatorDataStore.getCalculatedBodyMassIndexValue(
            keyValueDatabase,
          );

      expect(
        bodyMassIndexCalculatorViewModel.bodyMassIndex.value.value,
        ZEROED_BODY_MASS_INDEX.value,
      );
      expect(bodyMassIndexFromDatabase.value, ZEROED_BODY_MASS_INDEX.value);

      expect(
        bodyMassIndexCalculatorViewModel.bodyMassIndex.value.category,
        ZEROED_BODY_MASS_INDEX.category,
      );
      expect(
        bodyMassIndexFromDatabase.category,
        ZEROED_BODY_MASS_INDEX.category,
      );

      expect(candidateHeightFromDatabase, ZEROED_HEIGHT);
      expect(
        bodyMassIndexCalculatorViewModel.candidateHeight.value,
        ZEROED_HEIGHT,
      );

      expect(candidateWeightFromDatabase, ZEROED_WEIGHT);
      expect(
        bodyMassIndexCalculatorViewModel.candidateWeight.value,
        ZEROED_WEIGHT,
      );
    });

    test(
      "Test If Method \"restore\" Restores Deleted Body Mass Index Data And Stores Values On Key-Value Database",
      () {
        BodyMassIndexCalculatorDataStore.setCandidateHeightValue(
          NORMAL_HEIGHT_IN_CENTIMETERS,
          keyValueDatabase,
        );
        BodyMassIndexCalculatorDataStore.setCandidateWeightValue(
          NORMAL_WEIGHT_IN_KILOGRAMS,
          keyValueDatabase,
        );
        BodyMassIndexCalculatorDataStore.setCalculatedBodyMassIndexValue(
          NORMAL_BODY_MASS_INDEX,
          keyValueDatabase,
        );

        bodyMassIndexCalculatorViewModel = BodyMassIndexCalculatorViewModel(
          keyValueDatabase,
        );

        bodyMassIndexCalculatorViewModel.reset();

        bodyMassIndexCalculatorViewModel.restore();

        final candidateHeightFromDatabase =
            BodyMassIndexCalculatorDataStore.getCandidateHeightValue(
              keyValueDatabase,
            );
        final candidateWeightFromDatabase =
            BodyMassIndexCalculatorDataStore.getCandidateWeightValue(
              keyValueDatabase,
            );
        final bodyMassIndexFromDatabase =
            BodyMassIndexCalculatorDataStore.getCalculatedBodyMassIndexValue(
              keyValueDatabase,
            );

        expect(
          bodyMassIndexCalculatorViewModel.bodyMassIndex.value.value,
          NORMAL_BODY_MASS_INDEX.value,
        );
        expect(bodyMassIndexFromDatabase.value, NORMAL_BODY_MASS_INDEX.value);

        expect(
          bodyMassIndexCalculatorViewModel.bodyMassIndex.value.category,
          NORMAL_BODY_MASS_INDEX.category,
        );
        expect(
          bodyMassIndexFromDatabase.category,
          NORMAL_BODY_MASS_INDEX.category,
        );

        expect(candidateHeightFromDatabase, NORMAL_HEIGHT_IN_CENTIMETERS);
        expect(
          bodyMassIndexCalculatorViewModel.candidateHeight.value,
          NORMAL_HEIGHT_IN_CENTIMETERS,
        );

        expect(candidateWeightFromDatabase, NORMAL_WEIGHT_IN_KILOGRAMS);
        expect(
          bodyMassIndexCalculatorViewModel.candidateWeight.value,
          NORMAL_WEIGHT_IN_KILOGRAMS,
        );
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      BodyMassIndexCalculatorDataStore.setCandidateHeightValue(
        NORMAL_HEIGHT_IN_CENTIMETERS,
        keyValueDatabase,
      );
      BodyMassIndexCalculatorDataStore.setCandidateWeightValue(
        NORMAL_WEIGHT_IN_KILOGRAMS,
        keyValueDatabase,
      );
      BodyMassIndexCalculatorDataStore.setCalculatedBodyMassIndexValue(
        NORMAL_BODY_MASS_INDEX,
        keyValueDatabase,
      );
      bodyMassIndexCalculatorViewModel = BodyMassIndexCalculatorViewModel(
        keyValueDatabase,
      );

      bodyMassIndexCalculatorViewModel.reset();

      bodyMassIndexCalculatorViewModel.dismissRecovery();

      try {
        bodyMassIndexCalculatorViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });
  });
}
