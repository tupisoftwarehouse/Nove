import "package:nove/constants/data/currency_constants.dart";

class TimestampGenerator {
  TimestampGenerator._();

  static int getUpdatedAtTimestamp(DateTime currentTimeOfTheDay) {
    late final DateTime updatedAtTimestamp;

    if (currentTimeOfTheDay.weekday == DateTime.saturday) {
      updatedAtTimestamp = FORTH_QUARTER_OF_THE_DAY(
        currentTimeOfTheDay,
      ).subtract(ONE_DAY);
    } else if (currentTimeOfTheDay.weekday == DateTime.sunday) {
      updatedAtTimestamp = FORTH_QUARTER_OF_THE_DAY(
        currentTimeOfTheDay,
      ).subtract(TWO_DAYS);
    } else if (currentTimeOfTheDay.isBefore(
      FIRST_QUARTER_OF_THE_DAY(currentTimeOfTheDay),
    )) {
      updatedAtTimestamp = FORTH_QUARTER_OF_THE_DAY(
        currentTimeOfTheDay,
      ).subtract(ONE_DAY);
    } else if (currentTimeOfTheDay.isBefore(
      SECOND_QUARTER_OF_THE_DAY(currentTimeOfTheDay),
    )) {
      updatedAtTimestamp = FIRST_QUARTER_OF_THE_DAY(currentTimeOfTheDay);
    } else if (currentTimeOfTheDay.isBefore(
      THIRD_QUARTER_OF_THE_DAY(currentTimeOfTheDay),
    )) {
      updatedAtTimestamp = SECOND_QUARTER_OF_THE_DAY(currentTimeOfTheDay);
    } else if (currentTimeOfTheDay.isBefore(
      FORTH_QUARTER_OF_THE_DAY(currentTimeOfTheDay),
    )) {
      updatedAtTimestamp = THIRD_QUARTER_OF_THE_DAY(currentTimeOfTheDay);
    } else {
      updatedAtTimestamp = FORTH_QUARTER_OF_THE_DAY(currentTimeOfTheDay);
    }

    return updatedAtTimestamp.millisecondsSinceEpoch;
  }

  static int getUpdatableAtTimestamp(DateTime currentTimeOfTheDay) {
    late final DateTime updatableAtTimestamp;

    if (currentTimeOfTheDay.weekday == DateTime.saturday) {
      updatableAtTimestamp = FIRST_QUARTER_OF_THE_DAY(
        currentTimeOfTheDay,
      ).add(TWO_DAYS);
    } else if (currentTimeOfTheDay.weekday == DateTime.sunday) {
      updatableAtTimestamp = FIRST_QUARTER_OF_THE_DAY(
        currentTimeOfTheDay,
      ).add(ONE_DAY);
    } else if (currentTimeOfTheDay.isBefore(
      FIRST_QUARTER_OF_THE_DAY(currentTimeOfTheDay),
    )) {
      updatableAtTimestamp = FIRST_QUARTER_OF_THE_DAY(currentTimeOfTheDay);
    } else if (currentTimeOfTheDay.isBefore(
      SECOND_QUARTER_OF_THE_DAY(currentTimeOfTheDay),
    )) {
      updatableAtTimestamp = SECOND_QUARTER_OF_THE_DAY(currentTimeOfTheDay);
    } else if (currentTimeOfTheDay.isBefore(
      THIRD_QUARTER_OF_THE_DAY(currentTimeOfTheDay),
    )) {
      updatableAtTimestamp = THIRD_QUARTER_OF_THE_DAY(currentTimeOfTheDay);
    } else if (currentTimeOfTheDay.isBefore(
      FORTH_QUARTER_OF_THE_DAY(currentTimeOfTheDay),
    )) {
      updatableAtTimestamp = FORTH_QUARTER_OF_THE_DAY(currentTimeOfTheDay);
    } else {
      updatableAtTimestamp = FIRST_QUARTER_OF_THE_DAY(
        currentTimeOfTheDay,
      ).add(ONE_DAY);
    }

    return updatableAtTimestamp.millisecondsSinceEpoch;
  }
}
