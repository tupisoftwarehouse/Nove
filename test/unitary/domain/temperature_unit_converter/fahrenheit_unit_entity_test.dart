import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/temperature_unit_converter/celsius_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/fahrenheit_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/kelvin_unit_entity.dart";
import "../../../concerns/measure_unit_value_formatter.dart";

void main() {
  group("Test \"FahrenheitUnitEntity\" Entity", () {
    test(
      "Test If Method \"convertTo\" Converts To Temperature Unit Value But Keeping Current Temperature Unit",
      () {
        final instance = FahrenheitUnitEntity(ZEROED_TEMPERATURE_UNIT_VALUE);
        final celsiusUnit = CelsiusUnitEntity(TEMPERATURE_UNIT_VALUE);
        final fahrenheitUnit = FahrenheitUnitEntity(TEMPERATURE_UNIT_VALUE);
        final kelvinUnit = KelvinUnitEntity(TEMPERATURE_UNIT_VALUE);
        late String formattedValue;

        instance.convertTo(celsiusUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          TEMPERATURE_UNIT_VALUE,
          CELSIUS_IN_FAHRENHEIT_CONVERSION_FORMULA(TEMPERATURE_UNIT_VALUE),
        );

        expect(instance.value, formattedValue);

        instance.convertTo(kelvinUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          TEMPERATURE_UNIT_VALUE,
          KELVIN_IN_FAHRENHEIT_CONVERSION_FORMULA(TEMPERATURE_UNIT_VALUE),
        );

        expect(instance.value, formattedValue);

        instance.convertTo(fahrenheitUnit);

        expect(instance.value, TEMPERATURE_UNIT_VALUE);
      },
    );
  });
}
