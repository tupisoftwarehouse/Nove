import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/centimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/foot_unit_entity.dart";
import "package:nove/domain/length_unit_converter/inch_unit_entity.dart";
import "package:nove/domain/length_unit_converter/kilometer_unit_entity.dart";
import "package:nove/domain/length_unit_converter/meter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/mile_unit_entity.dart";
import "package:nove/domain/length_unit_converter/millimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/nautical_mile_unit_entity.dart";
import "package:nove/domain/length_unit_converter/yard_unit_entity.dart";
import "../../../concerns/measure_unit_value_formatter.dart";

void main() {
  group("Test \"FootUnitEntity\" Entity", () {
    test(
      "Test If Method \"convertTo\" Converts To Length Unit Value But Keeping Current Length Unit",
      () {
        final instance = FootUnitEntity(ZEROED_LENGTH_UNIT_VALUE);
        final kilometerUnit = KilometerUnitEntity(LENGTH_UNIT_VALUE);
        final meterUnit = MeterUnitEntity(LENGTH_UNIT_VALUE);
        final centimeterUnit = CentimeterUnitEntity(LENGTH_UNIT_VALUE);
        final millimeterUnit = MillimeterUnitEntity(LENGTH_UNIT_VALUE);
        final mileUnit = MileUnitEntity(LENGTH_UNIT_VALUE);
        final yardUnit = YardUnitEntity(LENGTH_UNIT_VALUE);
        final footUnit = FootUnitEntity(LENGTH_UNIT_VALUE);
        final inchUnit = InchUnitEntity(LENGTH_UNIT_VALUE);
        final nauticalMileUnit = NauticalMileUnitEntity(LENGTH_UNIT_VALUE);
        late String formattedValue;

        instance.convertTo(kilometerUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          LENGTH_UNIT_VALUE,
          KILOMETER_IN_FOOT_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(meterUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          LENGTH_UNIT_VALUE,
          METER_IN_FOOT_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(centimeterUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          LENGTH_UNIT_VALUE,
          CENTIMETER_IN_FOOT_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(millimeterUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          LENGTH_UNIT_VALUE,
          MILLIMETER_IN_FOOT_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(mileUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          LENGTH_UNIT_VALUE,
          MILE_IN_FOOT_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(yardUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          LENGTH_UNIT_VALUE,
          YARD_IN_FOOT_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(inchUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          LENGTH_UNIT_VALUE,
          INCH_IN_FOOT_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(nauticalMileUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          LENGTH_UNIT_VALUE,
          NAUTICAL_MILE_IN_FOOT_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(footUnit);

        expect(instance.value, LENGTH_UNIT_VALUE);
      },
    );
  });
}
