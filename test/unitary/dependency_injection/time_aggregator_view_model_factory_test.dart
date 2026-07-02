import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_aggregator_constants.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/dependency_injection/time_aggregator_view_model_factory.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeAggregatorViewModelFactory\" Class", () {
    late TimeAggregatorViewModel instance;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"TimeAggregatorViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_TIMES_KEY] =
            MARSHALLED_LIST_OF_TIMES;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[AGGREGATED_TIME_KEY] =
            MARSHALLED_AGGREGATED_TIME;

        instance = TimeAggregatorViewModelFactory.getInstance();

        expect(instance.aggregatedTime.value.hours, HOURS_OF_TIME);
        expect(instance.aggregatedTime.value.minutes, MINUTES_OF_TIME);
        expect(instance.aggregatedTime.value.seconds, SECONDS_OF_TIME);

        expect(instance.listOfTimes.value[0].hours, HOURS_OF_TIME);
        expect(instance.listOfTimes.value[0].minutes, MINUTES_OF_TIME);
        expect(instance.listOfTimes.value[0].seconds, SECONDS_OF_TIME);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"TimeAggregatorViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = TimeAggregatorViewModelFactory.getInstance();

        expect(instance.aggregatedTime.value.hours, ZEROED_TIME.hours);
        expect(instance.aggregatedTime.value.minutes, ZEROED_TIME.minutes);
        expect(instance.aggregatedTime.value.seconds, ZEROED_TIME.seconds);

        expect(instance.listOfTimes.value[0].hours, ZEROED_TIME.hours);
        expect(instance.listOfTimes.value[0].minutes, ZEROED_TIME.minutes);
        expect(instance.listOfTimes.value[0].seconds, ZEROED_TIME.seconds);
      },
    );
  });
}
