import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/number_system_converter/internals/test_utilities/test_number_system_entity.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/decimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";

const INITIAL_NUMBER_SYSTEM_VALUE = "0";

const NUMBER_SYSTEM_VALUE = "1";

const DECIMAL_NUMBER_SYSTEM_BASE = 10;

const HEXADECIMAL_NUMBER_SYSTEM_BASE = 16;

const OCTAL_NUMBER_SYSTEM_BASE = 8;

const BINARY_NUMBER_SYSTEM_BASE = 2;

const BINARY_NUMBER = "1";

const DECIMAL_NUMBER = "1";

const HEXADECIMAL_NUMBER = "1";

const OCTAL_NUMBER = "1";

NumberSystemEntity NUMBER_SYSTEM_TO_CONVERT_TO(
  void Function(MeasureUnitEntity<NumberSystem>) convertToImplementation,
) {
  return TestNumberSystemEntity(
    BINARY_NUMBER,
    NumberSystem.DECIMAL,
    convertToImplementation,
  );
}

NumberSystemEntity UPDATED_NUMBER_SYSTEM(
  void Function(MeasureUnitEntity<NumberSystem>) convertToImplementation,
) {
  return TestNumberSystemEntity(
    "11",
    NumberSystem.BINARY,
    convertToImplementation,
  );
}

const ZEROED_NUMBER_SYSTEM_VALUE = "0";

final ZEROED_NUMBER_SYSTEM = DecimalNumberSystemEntity(
  ZEROED_NUMBER_SYSTEM_VALUE,
);

NumberSystemEntity RESET_NUMBER_SYSTEM() {
  return DecimalNumberSystemEntity(ZEROED_NUMBER_SYSTEM_VALUE);
}

final DECIMAL_NUMBER_SYSTEM = DecimalNumberSystemEntity(DECIMAL_NUMBER);

final MARSHALLED_NUMBER_SYSTEM =
    "{\"measureUnit\":\"${NumberSystem.DECIMAL.name}\",\"value\":\"$INITIAL_NUMBER_SYSTEM_VALUE\"}";

final MARSHALLED_LIST_OF_NUMBER_SYSTEM = "[$MARSHALLED_NUMBER_SYSTEM]";
