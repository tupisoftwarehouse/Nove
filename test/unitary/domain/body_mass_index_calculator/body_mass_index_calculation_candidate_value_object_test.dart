import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_calculation_candidate_value_object.dart";

void main() {
  group("Test \"BodyMassIndexCalculationCandidateValueObject\" Value Object", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final instanceFromMarshalledData =
            BodyMassIndexCalculationCandidateValueObject.fromMarshalledData(
              MARSHALLED_BODY_MASS_INDEX_CALCULATION_CANDIDATE,
            );

        expect(instanceFromMarshalledData.height, NORMAL_HEIGHT_IN_CENTIMETERS);
        expect(instanceFromMarshalledData.weight, NORMAL_WEIGHT_IN_KILOGRAMS);
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance =
            BodyMassIndexCalculationCandidateValueObject(
              NORMAL_HEIGHT_IN_CENTIMETERS,
              NORMAL_WEIGHT_IN_KILOGRAMS,
            ).marshalledData;

        expect(
          marshalledDataFromInstance,
          MARSHALLED_BODY_MASS_INDEX_CALCULATION_CANDIDATE,
        );
      },
    );
  });
}
