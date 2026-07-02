import "package:flutter/foundation.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_calculation_candidate_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_calculator.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_value_object.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/user_interface/data_stores/body_mass_index_calculator_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/body_mass_index_calculator_data/body_mass_index_calculator_data_synchronizing_transaction_script.dart";

class BodyMassIndexCalculatorViewModel {
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<double> candidateHeight = ValueNotifier<double>(0);
  final ValueNotifier<double> candidateWeight = ValueNotifier<double>(0);
  final ValueNotifier<BodyMassIndexValueObject> bodyMassIndex =
      ValueNotifier<BodyMassIndexValueObject>(ZEROED_BODY_MASS_INDEX);
  double? _candidateHeightRecovery;
  double? _candidateWeightRecovery;
  BodyMassIndexValueObject? _bodyMassIndexRecovery;

  BodyMassIndexCalculatorViewModel(this._keyValueDatabase) {
    try {
      candidateHeight.value =
          BodyMassIndexCalculatorDataStore.getCandidateHeightValue(
            _keyValueDatabase,
          );
      candidateWeight.value =
          BodyMassIndexCalculatorDataStore.getCandidateWeightValue(
            _keyValueDatabase,
          );
      bodyMassIndex.value =
          BodyMassIndexCalculatorDataStore.getCalculatedBodyMassIndexValue(
            _keyValueDatabase,
          );
    } catch (_) {}
  }

  void setCandidateHeight(double updatedCandidateHeight) {
    BodyMassIndexCalculatorDataStore.setCandidateHeightValue(
      updatedCandidateHeight,
      _keyValueDatabase,
    );

    candidateHeight.value = updatedCandidateHeight;
  }

  void setCandidateWeight(double updatedCandidateWeight) {
    BodyMassIndexCalculatorDataStore.setCandidateWeightValue(
      updatedCandidateWeight,
      _keyValueDatabase,
    );

    candidateWeight.value = updatedCandidateWeight;
  }

  void calculateBodyMassIndex() {
    final candidate = BodyMassIndexCalculationCandidateValueObject(
      candidateHeight.value,
      candidateWeight.value,
    );

    final calculatedBodyMassIndex = BodyMassIndexCalculator.getBodyMassIndex(
      candidate,
    );

    BodyMassIndexCalculatorDataStore.setCalculatedBodyMassIndexValue(
      calculatedBodyMassIndex,
      _keyValueDatabase,
    );

    bodyMassIndex.value = calculatedBodyMassIndex;
  }

  void reset() {
    _candidateHeightRecovery = candidateHeight.value;
    _candidateWeightRecovery = candidateWeight.value;
    _bodyMassIndexRecovery = bodyMassIndex.value;

    BodyMassIndexCalculatorDataSynchronizingTransactionScript.synchronizeBodyMassIndexData(
      ZEROED_HEIGHT,
      ZEROED_WEIGHT,
      ZEROED_BODY_MASS_INDEX,
      _keyValueDatabase,
      candidateHeight,
      candidateWeight,
      bodyMassIndex,
    );
  }

  void restore() {
    BodyMassIndexCalculatorDataSynchronizingTransactionScript.synchronizeBodyMassIndexData(
      _candidateHeightRecovery!,
      _candidateWeightRecovery!,
      _bodyMassIndexRecovery!,
      _keyValueDatabase,
      candidateHeight,
      candidateWeight,
      bodyMassIndex,
    );

    _candidateHeightRecovery = null;
    _candidateWeightRecovery = null;
    _bodyMassIndexRecovery = null;
  }

  void dismissRecovery() {
    _candidateHeightRecovery = null;
    _candidateWeightRecovery = null;
    _bodyMassIndexRecovery = null;
  }
}
