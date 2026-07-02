import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/domain/time_calculator/time_calculator.dart";

class TimeAggregator {
  List<TimeValueObject> listOfTimes;
  TimeValueObject aggregatedTime;

  TimeAggregator(this.listOfTimes, this.aggregatedTime);

  void addTime() {
    listOfTimes.add(ZEROED_TIME);
  }

  void addTimeAt(int indexOfTimeToBeAdded) {
    listOfTimes.insert(indexOfTimeToBeAdded, ZEROED_TIME);
  }

  void updateTime(TimeValueObject updatedTime, int indexOfTimeToBeUpdated) {
    aggregatedTime = TimeCalculator.getSubtractedTime(
      aggregatedTime,
      listOfTimes[indexOfTimeToBeUpdated],
    );

    aggregatedTime = TimeCalculator.getAddedTime(aggregatedTime, updatedTime);

    listOfTimes[indexOfTimeToBeUpdated] = updatedTime;
  }

  void removeTime(int indexOfTimeToBeRemoved) {
    final timeToBeRemoved = listOfTimes[indexOfTimeToBeRemoved];

    aggregatedTime = TimeCalculator.getSubtractedTime(
      aggregatedTime,
      timeToBeRemoved,
    );

    listOfTimes.removeAt(indexOfTimeToBeRemoved);
  }

  void reset() {
    listOfTimes = [ZEROED_TIME];
    aggregatedTime = ZEROED_TIME;
  }
}
