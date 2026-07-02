import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";

final MARSHALLED_LIST_OF_TIMES = "[$MARSHALLED_TIME]";

final MARSHALLED_AGGREGATED_TIME = MARSHALLED_TIME;

final TIME_TO_BE_AGGREGATED = TimeValueObject(1, 30, 0);

final AGGREGATED_TIME = TimeValueObject(3, 0, 0);

final EDITED_LIST_OF_TIMES = [ZEROED_TIME, TIME_TO_BE_AGGREGATED];
