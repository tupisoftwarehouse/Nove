import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";

void main() {
  group("Test \"Calculating Aggregated Time\" Integration", () {
    late TimeAggregator timeAggregator;

    setUpAll(() {
      timeAggregator = TimeAggregator([], ZEROED_TIME);
    });

    test(
      "Test Aggregated Time Being Calculated By \"TimeCalculator\" On \"TimeAggregator\"",
      () {
        timeAggregator = TimeAggregator([
          ZEROED_TIME,
          ZEROED_TIME,
        ], ZEROED_TIME);

        timeAggregator.updateTime(TIME_TO_BE_CALCULATED, 1);

        expect(
          timeAggregator.aggregatedTime.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          timeAggregator.aggregatedTime.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          timeAggregator.aggregatedTime.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );

        expect(
          timeAggregator.listOfTimes[1].hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          timeAggregator.listOfTimes[1].minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          timeAggregator.listOfTimes[1].seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );

        timeAggregator.removeTime(1);

        expect(timeAggregator.aggregatedTime.hours, ZEROED_TIME.hours);
        expect(timeAggregator.aggregatedTime.minutes, ZEROED_TIME.minutes);
        expect(timeAggregator.aggregatedTime.seconds, ZEROED_TIME.seconds);

        expect(timeAggregator.listOfTimes.length, 1);
      },
    );
  });
}
