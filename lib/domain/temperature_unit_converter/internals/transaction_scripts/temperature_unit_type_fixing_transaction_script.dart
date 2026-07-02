import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/celsius_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/fahrenheit_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/kelvin_unit_entity.dart";

class TemperatureUnitTypeFixingTransactionScript {
  TemperatureUnitTypeFixingTransactionScript._();

  static TemperatureUnitEntity getTypeFixedInstanceFromMarshalledData(
    TemperatureUnitEntity instanceFromMarshalledData,
  ) {
    late final TemperatureUnitEntity typeFixedInstance;

    switch (instanceFromMarshalledData.measureUnit) {
      case TemperatureUnit.CELSIUS:
        typeFixedInstance = CelsiusUnitEntity(instanceFromMarshalledData.value);

        break;
      case TemperatureUnit.FAHRENHEIT:
        typeFixedInstance = FahrenheitUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case TemperatureUnit.KELVIN:
        typeFixedInstance = KelvinUnitEntity(instanceFromMarshalledData.value);

        break;
    }

    return typeFixedInstance;
  }
}
