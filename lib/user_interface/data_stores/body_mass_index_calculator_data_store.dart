import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class BodyMassIndexCalculatorDataStore {
  BodyMassIndexCalculatorDataStore._();

  static double getCandidateHeightValue(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<double>(CANDIDATE_HEIGHT_KEY, (
      marshalledData,
    ) {
      return double.parse(marshalledData);
    });
  }

  static void setCandidateHeightValue(
    double updatedCandidateHeight,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(CANDIDATE_HEIGHT_KEY, () {
      return updatedCandidateHeight.toString();
    });
  }

  static double getCandidateWeightValue(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<double>(CANDIDATE_WEIGHT_KEY, (
      marshalledData,
    ) {
      return double.parse(marshalledData);
    });
  }

  static void setCandidateWeightValue(
    double updatedCandidateWeight,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(CANDIDATE_WEIGHT_KEY, () {
      return updatedCandidateWeight.toString();
    });
  }

  static BodyMassIndexValueObject getCalculatedBodyMassIndexValue(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<BodyMassIndexValueObject>(
      CALCULATED_BODY_MASS_INDEX_KEY,
      (marshalledData) {
        return BodyMassIndexValueObject.fromMarshalledData(marshalledData);
      },
    );
  }

  static void setCalculatedBodyMassIndexValue(
    BodyMassIndexValueObject updatedCalculatedBodyMassIndex,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(CALCULATED_BODY_MASS_INDEX_KEY, () {
      return updatedCalculatedBodyMassIndex.marshalledData;
    });
  }
}
