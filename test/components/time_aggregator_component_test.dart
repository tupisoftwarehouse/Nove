import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";

void main() {
  group("Test \"TimeAggregator\" Component", () {
    late TimeAggregator timeAggregator;

    setUp(() {
      timeAggregator = TimeAggregator([], ZEROED_TIME);
    });

    test("Test Adding Zeroed Time To List Of Times", () {
      timeAggregator.addTime();

      expect(timeAggregator.listOfTimes.length, 1);

      expect(timeAggregator.listOfTimes[0].hours, ZEROED_TIME.hours);
      expect(timeAggregator.listOfTimes[0].minutes, ZEROED_TIME.minutes);
      expect(timeAggregator.listOfTimes[0].seconds, ZEROED_TIME.seconds);
    });

    test("Test Adding Zeroed Time To List Of Times At A Given Index", () {
      timeAggregator.addTimeAt(0);

      expect(timeAggregator.listOfTimes.length, 1);

      expect(timeAggregator.listOfTimes[0].hours, ZEROED_TIME.hours);
      expect(timeAggregator.listOfTimes[0].minutes, ZEROED_TIME.minutes);
      expect(timeAggregator.listOfTimes[0].seconds, ZEROED_TIME.seconds);
    });

    test("Test Updating Time At A Given Index", () {
      timeAggregator = TimeAggregator([ZEROED_TIME], ZEROED_TIME);

      timeAggregator.updateTime(TIME_TO_BE_CALCULATED, 0);

      expect(timeAggregator.aggregatedTime.hours, TIME_TO_BE_CALCULATED.hours);
      expect(
        timeAggregator.aggregatedTime.minutes,
        TIME_TO_BE_CALCULATED.minutes,
      );
      expect(
        timeAggregator.aggregatedTime.seconds,
        TIME_TO_BE_CALCULATED.seconds,
      );

      expect(timeAggregator.listOfTimes[0].hours, TIME_TO_BE_CALCULATED.hours);
      expect(
        timeAggregator.listOfTimes[0].minutes,
        TIME_TO_BE_CALCULATED.minutes,
      );
      expect(
        timeAggregator.listOfTimes[0].seconds,
        TIME_TO_BE_CALCULATED.seconds,
      );
    });

    test("Test Removing Time At A Given Index", () {
      timeAggregator = TimeAggregator([
        ZEROED_TIME,
        TIME_TO_BE_CALCULATED,
      ], TIME_TO_BE_CALCULATED);

      timeAggregator.removeTime(1);

      expect(timeAggregator.aggregatedTime.hours, ZEROED_TIME.hours);
      expect(timeAggregator.aggregatedTime.minutes, ZEROED_TIME.minutes);
      expect(timeAggregator.aggregatedTime.seconds, ZEROED_TIME.seconds);

      expect(timeAggregator.listOfTimes.length, 1);
    });

    test("Test Resetting Time Aggregator", () {
      timeAggregator = TimeAggregator([
        TIME_TO_BE_CALCULATED,
      ], TIME_TO_BE_CALCULATED);

      timeAggregator.reset();

      expect(timeAggregator.aggregatedTime.hours, ZEROED_TIME.hours);
      expect(timeAggregator.aggregatedTime.minutes, ZEROED_TIME.minutes);
      expect(timeAggregator.aggregatedTime.seconds, ZEROED_TIME.seconds);

      expect(timeAggregator.listOfTimes.length, 1);
    });
  });
}
