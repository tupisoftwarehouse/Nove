import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";

class HexadecimalNumberSystemEntity extends NumberSystemEntity {
  HexadecimalNumberSystemEntity(String value)
    : super(value, NumberSystem.HEXADECIMAL);

  @override
  void convertTo(MeasureUnitEntity<NumberSystem> numberSystemToConvertTo) {
    late final int convertedToNumberSystemValue;

    switch (numberSystemToConvertTo.measureUnit) {
      case NumberSystem.BINARY:
        convertedToNumberSystemValue = int.parse(
          numberSystemToConvertTo.value,
          radix: BINARY_NUMBER_SYSTEM_BASE,
        );

        break;
      case NumberSystem.DECIMAL:
        convertedToNumberSystemValue = int.parse(
          numberSystemToConvertTo.value,
          radix: DECIMAL_NUMBER_SYSTEM_BASE,
        );

        break;
      case NumberSystem.OCTAL:
        convertedToNumberSystemValue = int.parse(
          numberSystemToConvertTo.value,
          radix: OCTAL_NUMBER_SYSTEM_BASE,
        );

        break;
      case NumberSystem.HEXADECIMAL:
        convertedToNumberSystemValue = int.parse(
          numberSystemToConvertTo.value,
          radix: HEXADECIMAL_NUMBER_SYSTEM_BASE,
        );

        break;
    }

    value = convertedToNumberSystemValue.toRadixString(
      HEXADECIMAL_NUMBER_SYSTEM_BASE,
    );
  }
}
