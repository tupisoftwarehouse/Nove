import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/body_mass_index_calculator_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"BodyMassIndexCalculatorDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getCandidateHeightValue\" Returns Candidate Height Value From Key-Value Database",
      () {
        keyValueDatabase.setItem(CANDIDATE_HEIGHT_KEY, () {
          return "$NORMAL_HEIGHT_IN_CENTIMETERS";
        });

        final candidateHeightValueFromKeyValueDatabase =
            BodyMassIndexCalculatorDataStore.getCandidateHeightValue(
              keyValueDatabase,
            );

        expect(
          candidateHeightValueFromKeyValueDatabase,
          NORMAL_HEIGHT_IN_CENTIMETERS,
        );
      },
    );

    test(
      "Test If Method \"setCandidateHeightValue\" Sets Candidate Height Value On Key-Value Database",
      () {
        BodyMassIndexCalculatorDataStore.setCandidateHeightValue(
          NORMAL_HEIGHT_IN_CENTIMETERS,
          keyValueDatabase,
        );

        final candidateHeightValueFromKeyValueDatabase = keyValueDatabase
            .getItem(CANDIDATE_HEIGHT_KEY, (marshalledData) {
              return double.parse(marshalledData);
            });

        expect(
          candidateHeightValueFromKeyValueDatabase,
          NORMAL_HEIGHT_IN_CENTIMETERS,
        );
      },
    );

    test(
      "Test If Method \"getCandidateWeightValue\" Returns Candidate Weight Value From Key-Value Database",
      () {
        keyValueDatabase.setItem(CANDIDATE_WEIGHT_KEY, () {
          return "$NORMAL_WEIGHT_IN_KILOGRAMS";
        });

        final candidateWeightValueFromKeyValueDatabase =
            BodyMassIndexCalculatorDataStore.getCandidateWeightValue(
              keyValueDatabase,
            );

        expect(
          candidateWeightValueFromKeyValueDatabase,
          NORMAL_WEIGHT_IN_KILOGRAMS,
        );
      },
    );

    test(
      "Test If Method \"setCandidateWeightValue\" Sets Candidate Weight Value On Key-Value Database",
      () {
        BodyMassIndexCalculatorDataStore.setCandidateWeightValue(
          NORMAL_WEIGHT_IN_KILOGRAMS,
          keyValueDatabase,
        );

        final candidateWeightValueFromKeyValueDatabase = keyValueDatabase
            .getItem(CANDIDATE_WEIGHT_KEY, (marshalledData) {
              return double.parse(marshalledData);
            });

        expect(
          candidateWeightValueFromKeyValueDatabase,
          NORMAL_WEIGHT_IN_KILOGRAMS,
        );
      },
    );

    test(
      "Test If Method \"getCalculatedBodyMassIndexValue\" Returns Calculated Body Mass Index Value From Key-Value Database",
      () {
        keyValueDatabase.setItem(CALCULATED_BODY_MASS_INDEX_KEY, () {
          return NORMAL_BODY_MASS_INDEX.marshalledData;
        });

        final calculatedBodyMassIndexValueFromKeyValueDatabase =
            BodyMassIndexCalculatorDataStore.getCalculatedBodyMassIndexValue(
              keyValueDatabase,
            );

        expect(
          calculatedBodyMassIndexValueFromKeyValueDatabase.value,
          NORMAL_BODY_MASS_INDEX.value,
        );
        expect(
          calculatedBodyMassIndexValueFromKeyValueDatabase.category,
          NORMAL_BODY_MASS_INDEX.category,
        );
      },
    );

    test(
      "Test If Method \"setCalculatedBodyMassIndexValue\" Sets Calculated Body Mass Index Value On Key-Value Database",
      () {
        BodyMassIndexCalculatorDataStore.setCalculatedBodyMassIndexValue(
          NORMAL_BODY_MASS_INDEX,
          keyValueDatabase,
        );

        final calculatedBodyMassIndexValueFromKeyValueDatabase =
            keyValueDatabase.getItem(CALCULATED_BODY_MASS_INDEX_KEY, (
              marshalledData,
            ) {
              return BodyMassIndexValueObject.fromMarshalledData(
                marshalledData,
              );
            });

        expect(
          calculatedBodyMassIndexValueFromKeyValueDatabase.value,
          NORMAL_BODY_MASS_INDEX.value,
        );
        expect(
          calculatedBodyMassIndexValueFromKeyValueDatabase.category,
          NORMAL_BODY_MASS_INDEX.category,
        );
      },
    );
  });
}
