import "package:flutter/widgets.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/body_mass_index_calculator_data_store.dart";

class BodyMassIndexCalculatorDataSynchronizingTransactionScript {
  BodyMassIndexCalculatorDataSynchronizingTransactionScript._();

  static void synchronizeBodyMassIndexData(
    double updatedCandidateHeight,
    double updatedCandidateWeight,
    BodyMassIndexValueObject updatedBodyMassIndex,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<double> candidateHeight,
    ValueNotifier<double> candidateWeight,
    ValueNotifier<BodyMassIndexValueObject> bodyMassIndex,
  ) {
    BodyMassIndexCalculatorDataStore.setCandidateHeightValue(
      updatedCandidateHeight,
      keyValueDatabase,
    );
    BodyMassIndexCalculatorDataStore.setCandidateWeightValue(
      updatedCandidateWeight,
      keyValueDatabase,
    );
    BodyMassIndexCalculatorDataStore.setCalculatedBodyMassIndexValue(
      updatedBodyMassIndex,
      keyValueDatabase,
    );

    candidateHeight.value = updatedCandidateHeight;
    candidateWeight.value = updatedCandidateWeight;
    bodyMassIndex.value = updatedBodyMassIndex;
  }
}
