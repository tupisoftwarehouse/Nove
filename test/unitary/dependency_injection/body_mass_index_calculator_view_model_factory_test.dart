import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_category.dart";
import "package:nove/dependency_injection/body_mass_index_calculator_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/body_mass_index_calculator_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"BodyMassIndexCalculatorViewModelFactory\" Class", () {
    late BodyMassIndexCalculatorViewModel instance;

    setUpAll(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });
    test(
      "Test If Method \"getInstance\" Returns \"BodyMassIndexCalculatorViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[CANDIDATE_WEIGHT_KEY] = NORMAL_WEIGHT_IN_KILOGRAMS
            .toString();
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[CANDIDATE_HEIGHT_KEY] = NORMAL_HEIGHT_IN_CENTIMETERS
            .toString();
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[CALCULATED_BODY_MASS_INDEX_KEY] =
            MARSHALLED_BODY_MASS_INDEX;

        instance = BodyMassIndexCalculatorViewModelFactory.getInstance();

        expect(instance.candidateWeight.value, NORMAL_WEIGHT_IN_KILOGRAMS);
        expect(instance.candidateHeight.value, NORMAL_HEIGHT_IN_CENTIMETERS);
        expect(
          instance.bodyMassIndex.value.value,
          NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
        );
        expect(
          instance.bodyMassIndex.value.category,
          BodyMassIndexCategory.NORMAL_WEIGHT,
        );
      },
    );
  });
}
