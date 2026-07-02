import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/temperature_unit_converter/celsius_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/fahrenheit_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/kelvin_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/internals/transaction_scripts/temperature_unit_type_fixing_transaction_script.dart";

void main() {
  group("Test \"TemperatureUnitTypeFixingTransactionScript\" Class", () {
    test(
      "Test If Method \"getTypeFixedInstanceFromMarshalledData\" Returns A Type Fixed Instance Of Instance From Marshalled Data",
      () {
        final celsiusUnitInstanceFromMarshalledData = TemperatureUnitEntity(
          ZEROED_TEMPERATURE_UNIT_VALUE,
          TemperatureUnit.CELSIUS,
        );
        final fahrenheitUnitInstanceFromMarshalledData = TemperatureUnitEntity(
          ZEROED_TEMPERATURE_UNIT_VALUE,
          TemperatureUnit.FAHRENHEIT,
        );
        final kelvinUnitInstanceFromMarshalledData = TemperatureUnitEntity(
          ZEROED_TEMPERATURE_UNIT_VALUE,
          TemperatureUnit.KELVIN,
        );
        final celsiusUnitFixedInstance =
            TemperatureUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              celsiusUnitInstanceFromMarshalledData,
            );
        final fahrenheitUnitFixedInstance =
            TemperatureUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              fahrenheitUnitInstanceFromMarshalledData,
            );
        final kelvinUnitFixedInstance =
            TemperatureUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              kelvinUnitInstanceFromMarshalledData,
            );

        expect(celsiusUnitFixedInstance, isA<CelsiusUnitEntity>());
        expect(fahrenheitUnitFixedInstance, isA<FahrenheitUnitEntity>());
        expect(kelvinUnitFixedInstance, isA<KelvinUnitEntity>());
      },
    );
  });
}
