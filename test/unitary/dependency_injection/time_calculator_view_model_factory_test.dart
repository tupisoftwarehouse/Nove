import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/dependency_injection/time_calculator_view_model_factory.dart";
import "package:nove/user_interface/view_models/time_calculator_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeCalculatorViewModelFactory\" Class", () {
    late TimeCalculatorViewModel instance;

    setUpAll(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"TimeCalculatorViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[FIRST_TIME_TO_BE_CALCULATED_KEY] =
            MARSHALLED_TIME;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[SECOND_TIME_TO_BE_CALCULATED_KEY] =
            MARSHALLED_TIME;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[CALCULATED_TIME_KEY] =
            MARSHALLED_TIME;

        instance = TimeCalculatorViewModelFactory.getInstance();

        expect(instance.firstTimeToBeCalculated.value.hours, HOURS_OF_TIME);
        expect(instance.firstTimeToBeCalculated.value.minutes, MINUTES_OF_TIME);
        expect(instance.firstTimeToBeCalculated.value.seconds, SECONDS_OF_TIME);
        expect(instance.secondTimeToBeCalculated.value.hours, HOURS_OF_TIME);
        expect(
          instance.secondTimeToBeCalculated.value.minutes,
          MINUTES_OF_TIME,
        );
        expect(
          instance.secondTimeToBeCalculated.value.seconds,
          SECONDS_OF_TIME,
        );
        expect(instance.calculatedTime.value.hours, HOURS_OF_TIME);
        expect(instance.calculatedTime.value.minutes, MINUTES_OF_TIME);
        expect(instance.calculatedTime.value.seconds, SECONDS_OF_TIME);
      },
    );
  });
}
