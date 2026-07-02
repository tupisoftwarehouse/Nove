import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/speed_unit_converter/foot_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/inch_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/knot_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/lightspeed_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mach_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/meter_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_second_unit_entity.dart";
import "../../../concerns/measure_unit_value_formatter.dart";

void main() {
  group("Test \"KilometerPerHourUnitEntity\" Entity", () {
    test(
      "Test If Method \"convertTo\" Converts To Speed Unit Value But Keeping Current Speed Unit",
      () {
        final instance = KilometerPerHourUnitEntity(ZEROED_SPEED_UNIT_VALUE);
        final lightspeedUnit = LightspeedUnitEntity(SPEED_UNIT_VALUE);
        final inchPerSecondUnit = InchPerSecondUnitEntity(SPEED_UNIT_VALUE);
        final kilometerPerSecondUnit = KilometerPerSecondUnitEntity(
          SPEED_UNIT_VALUE,
        );
        final footPerSecondUnit = FootPerSecondUnitEntity(SPEED_UNIT_VALUE);
        final knotUnit = KnotUnitEntity(SPEED_UNIT_VALUE);
        final machUnit = MachUnitEntity(SPEED_UNIT_VALUE);
        final kilometerPerHourUnit = KilometerPerHourUnitEntity(
          SPEED_UNIT_VALUE,
        );
        final meterPerSecondUnit = MeterPerSecondUnitEntity(SPEED_UNIT_VALUE);
        final milePerSecondUnit = MilePerSecondUnitEntity(SPEED_UNIT_VALUE);
        final milePerHourUnit = MilePerHourUnitEntity(SPEED_UNIT_VALUE);
        late String formattedValue;

        instance.convertTo(lightspeedUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          SPEED_UNIT_VALUE,
          LIGHTSPEED_IN_KILOMETER_PER_HOUR_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(inchPerSecondUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          SPEED_UNIT_VALUE,
          INCH_PER_SECOND_IN_KILOMETER_PER_HOUR_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(kilometerPerSecondUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          SPEED_UNIT_VALUE,
          KILOMETER_PER_SECOND_IN_KILOMETER_PER_HOUR_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(footPerSecondUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          SPEED_UNIT_VALUE,
          FOOT_PER_SECOND_IN_KILOMETER_PER_HOUR_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(knotUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          SPEED_UNIT_VALUE,
          KNOT_IN_KILOMETER_PER_HOUR_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(machUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          SPEED_UNIT_VALUE,
          MACH_IN_KILOMETER_PER_HOUR_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(meterPerSecondUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          SPEED_UNIT_VALUE,
          METER_PER_SECOND_IN_KILOMETER_PER_HOUR_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(milePerSecondUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          SPEED_UNIT_VALUE,
          MILE_PER_SECOND_IN_KILOMETER_PER_HOUR_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(milePerHourUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          SPEED_UNIT_VALUE,
          MILE_PER_HOUR_IN_KILOMETER_PER_HOUR_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(kilometerPerHourUnit);

        expect(instance.value, SPEED_UNIT_VALUE);
      },
    );
  });
}
