import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/domain/time_calculator/internals/checker/time_calculator_checker.dart";

class TimeCalculator {
  TimeCalculator._();

  static TimeValueObject getAddedTime(
    TimeValueObject firstAddendTime,
    TimeValueObject secondAddendTime,
  ) {
    int calculatedSecond = firstAddendTime.seconds + secondAddendTime.seconds;

    int calculatedMinutes =
        firstAddendTime.minutes +
        secondAddendTime.minutes +
        (calculatedSecond ~/ TIME_CYCLE);

    int calculatedHours =
        firstAddendTime.hours +
        secondAddendTime.hours +
        (calculatedMinutes ~/ TIME_CYCLE);

    calculatedSecond %= TIME_CYCLE;
    calculatedMinutes %= TIME_CYCLE;

    return TimeValueObject(
      calculatedHours,
      calculatedMinutes,
      calculatedSecond,
    );
  }

  static TimeValueObject getSubtractedTime(
    TimeValueObject minuendTime,
    TimeValueObject subtrahendTime,
  ) {
    int calculatedSecond = minuendTime.seconds - subtrahendTime.seconds;
    int calculatedMinutes = minuendTime.minutes - subtrahendTime.minutes;
    int calculatedHours = minuendTime.hours - subtrahendTime.hours;

    if (isCycleClosed(calculatedSecond)) {
      calculatedSecond += TIME_CYCLE;
      calculatedMinutes -= 1;
    }

    if (isCycleClosed(calculatedMinutes)) {
      calculatedMinutes += TIME_CYCLE;
      calculatedHours -= 1;
    }

    return TimeValueObject(
      calculatedHours,
      calculatedMinutes,
      calculatedSecond,
    );
  }
}
