import "package:nove/domain/measure_unit_converter/internals/test_utilities/test_measure_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

const ZEROED_VALUE = "0";

const MEASURE_UNIT_VALUE = "0";

const MEASURE_UNIT_NAME = "MEASURE_UNIT_NAME";

final ROUND_VALUE = "1";

final NOT_ROUND_VALUE = "1.00";

MeasureUnitEntity<T> ZEROED_MEASURE_UNIT<T>() {
  return TestMeasureUnitEntity<T>("0", MEASURE_UNIT_NAME as T, (_) {});
}

MeasureUnitEntity<T> MEASURE_UNIT_TO_BE_CONVERTED<T>(
  void Function(MeasureUnitEntity<T>) convertToImplementation,
) {
  return TestMeasureUnitEntity<T>(
    MEASURE_UNIT_VALUE,
    MEASURE_UNIT_NAME as T,
    convertToImplementation,
  );
}

MeasureUnitEntity<T> MEASURE_UNIT_TO_CONVERT_TO<T>(
  void Function(MeasureUnitEntity<T>) convertToImplementation,
) {
  return TestMeasureUnitEntity<T>(
    "1.0",
    MEASURE_UNIT_NAME as T,
    convertToImplementation,
  );
}

MeasureUnitEntity<T> UPDATED_MEASURE_UNIT<T>(
  void Function(MeasureUnitEntity<T>) convertToImplementation,
) {
  return TestMeasureUnitEntity<T>(
    "2",
    MEASURE_UNIT_NAME as T,
    convertToImplementation,
  );
}

const MEASURE_UNITE_VALUE_FLOATING_POINT_FIXED_TRUNCATION_LENGTH = 2;

const NOT_FIXED_POINT_VALUE = "1.23456789";

const FIXED_POINT_VALUE = "1.23";

final REMOVE_UNNECESSARY_ZEROS_FROM_VALUE_REGEX = RegExp(r"\.0$");

final REMOVE_UNNECESSARY_TRAILING_ZEROES_FROM_VALUE_REGULAR_EXPRESSION = RegExp(
  r'(\.\d*?)0+$',
);

final VALUE_WITHOUT_UNNECESSARY_TRAILING_ZEROES_GROUP = 1;

final REMOVE_UNNECESSARY_TRAILING_DOTS_FROM_VALUE_REGULAR_EXPRESSION = RegExp(
  r'\.$',
);
