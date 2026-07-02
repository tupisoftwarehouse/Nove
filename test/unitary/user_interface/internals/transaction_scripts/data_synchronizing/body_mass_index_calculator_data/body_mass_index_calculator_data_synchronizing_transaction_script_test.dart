import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/body_mass_index_calculator_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/body_mass_index_calculator_data/body_mass_index_calculator_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group(
    "Test \"BodyMassIndexCalculatorDataSynchronizingTransactionScript\" Class",
    () {
      late AbstractKeyValueDatabase keyValueDatabase;
      late ValueNotifier<double> candidateHeightState;
      late ValueNotifier<double> candidateWeightState;
      late ValueNotifier<BodyMassIndexValueObject> bodyMassIndexState;

      setUpAll(() {
        keyValueDatabase = KeyValueDatabaseMock();

        candidateHeightState = ValueNotifier<double>(ZEROED_HEIGHT);
        candidateWeightState = ValueNotifier<double>(ZEROED_WEIGHT);
        bodyMassIndexState = ValueNotifier<BodyMassIndexValueObject>(
          ZEROED_BODY_MASS_INDEX,
        );
      });

      test(
        "Test If Method \"synchronizeBodyMassIndexData\" Stores Data And Updates State",
        () {
          BodyMassIndexCalculatorDataSynchronizingTransactionScript.synchronizeBodyMassIndexData(
            NORMAL_HEIGHT_IN_CENTIMETERS,
            NORMAL_WEIGHT_IN_KILOGRAMS,
            NORMAL_BODY_MASS_INDEX,
            keyValueDatabase,
            candidateHeightState,
            candidateWeightState,
            bodyMassIndexState,
          );

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

          expect(candidateHeightState.value, NORMAL_HEIGHT_IN_CENTIMETERS);
          expect(candidateWeightState.value, NORMAL_WEIGHT_IN_KILOGRAMS);
          expect(bodyMassIndexState.value.value, NORMAL_BODY_MASS_INDEX.value);
          expect(
            bodyMassIndexState.value.category,
            NORMAL_BODY_MASS_INDEX.category,
          );

          expect(candidateHeightFromDatabase, NORMAL_HEIGHT_IN_CENTIMETERS);
          expect(candidateWeightFromDatabase, NORMAL_WEIGHT_IN_KILOGRAMS);
          expect(bodyMassIndexFromDatabase.value, NORMAL_BODY_MASS_INDEX.value);
          expect(
            bodyMassIndexFromDatabase.category,
            NORMAL_BODY_MASS_INDEX.category,
          );
        },
      );
    },
  );
}
