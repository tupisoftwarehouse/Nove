import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/binary_number_system_entity.dart";
import "package:nove/domain/number_system_converter/octal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/decimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/hexadecimal_number_system_entity.dart";

class NumberSystemTypeFixingTransactionScript {
  NumberSystemTypeFixingTransactionScript._();

  static NumberSystemEntity getTypeFixedInstanceFromMarshalledData(
    NumberSystemEntity instanceFromMarshalledData,
  ) {
    late final NumberSystemEntity typeFixedInstance;

    switch (instanceFromMarshalledData.measureUnit) {
      case NumberSystem.BINARY:
        typeFixedInstance = BinaryNumberSystemEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case NumberSystem.OCTAL:
        typeFixedInstance = OctalNumberSystemEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case NumberSystem.DECIMAL:
        typeFixedInstance = DecimalNumberSystemEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case NumberSystem.HEXADECIMAL:
        typeFixedInstance = HexadecimalNumberSystemEntity(
          instanceFromMarshalledData.value,
        );

        break;
    }

    return typeFixedInstance;
  }
}
