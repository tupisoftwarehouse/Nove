import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_value_object.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_category.dart";

void main() {
  group("Test \"BodyMassIndexValueObject\" Value Object", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final instanceFromMarshalledData =
            BodyMassIndexValueObject.fromMarshalledData(
              MARSHALLED_BODY_MASS_INDEX,
            );

        expect(
          instanceFromMarshalledData.value,
          NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
        );
        expect(
          instanceFromMarshalledData.category,
          BodyMassIndexCategory.NORMAL_WEIGHT,
        );
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = BodyMassIndexValueObject(
          NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
          BodyMassIndexCategory.NORMAL_WEIGHT,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_BODY_MASS_INDEX);
      },
    );
  });
}
