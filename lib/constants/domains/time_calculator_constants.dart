import "package:nove/domain/time_calculator/time_value_object.dart";

const SECONDS_OF_TIME = 59;

const MINUTES_OF_TIME = 59;

const HOURS_OF_TIME = 1;

const TIME_CYCLE = 60;

final TIME_TO_BE_CALCULATED = TimeValueObject(
  HOURS_OF_TIME,
  MINUTES_OF_TIME,
  SECONDS_OF_TIME,
);

final CALCULATED_TIME = TimeValueObject(3, 59, 58);

final ZEROED_TIME = TimeValueObject(0, 0, 0);

const MINIMAL_CYCLE_VALUE = 0;

const MARSHALLED_TIME =
    "{\"hours\":$HOURS_OF_TIME,\"minutes\":$MINUTES_OF_TIME,\"seconds\":$SECONDS_OF_TIME}";

const MARSHALLED_LIST_OF_TIME = "[$MARSHALLED_TIME]";
