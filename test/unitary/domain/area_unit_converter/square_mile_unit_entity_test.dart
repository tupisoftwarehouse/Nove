import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/acre_unit_entity.dart";
import "package:nove/domain/area_unit_converter/hectare_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_centimeter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_foot_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_inch_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_kilometer_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_meter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_mile_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_millimeter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_yard_unit_entity.dart";
import "../../../concerns/measure_unit_value_formatter.dart";

void main() {
  group("Test \"SquareMileUnitEntity\" Entity", () {
    test(
      "Test If Method \"convertTo\" Converts To Area Unit Value But Keeping Current Area Unit",
      () {
        final instance = SquareMileUnitEntity(ZEROED_AREA_UNIT_VALUE);
        final squareMillimeterUnit = SquareMillimeterUnitEntity(
          AREA_UNIT_VALUE,
        );
        final squareCentimeterUnit = SquareCentimeterUnitEntity(
          AREA_UNIT_VALUE,
        );
        final squareMeterUnit = SquareMeterUnitEntity(AREA_UNIT_VALUE);
        final squareKilometerUnit = SquareKilometerUnitEntity(AREA_UNIT_VALUE);
        final squareInchUnit = SquareInchUnitEntity(AREA_UNIT_VALUE);
        final squareFootUnit = SquareFootUnitEntity(AREA_UNIT_VALUE);
        final squareYardUnit = SquareYardUnitEntity(AREA_UNIT_VALUE);
        final squareMileUnit = SquareMileUnitEntity(AREA_UNIT_VALUE);
        final hectareUnit = HectareUnitEntity(AREA_UNIT_VALUE);
        final acreUnit = AcreUnitEntity(AREA_UNIT_VALUE);
        late String formattedValue;

        instance.convertTo(squareMillimeterUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          AREA_UNIT_VALUE,
          SQUARE_MILLIMETER_IN_SQUARE_MILE_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(squareCentimeterUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          AREA_UNIT_VALUE,
          SQUARE_CENTIMETER_IN_SQUARE_MILE_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(squareMeterUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          AREA_UNIT_VALUE,
          SQUARE_METER_IN_SQUARE_MILE_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(squareKilometerUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          AREA_UNIT_VALUE,
          SQUARE_KILOMETER_IN_SQUARE_MILE_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(squareInchUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          AREA_UNIT_VALUE,
          SQUARE_INCH_IN_SQUARE_MILE_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(squareFootUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          AREA_UNIT_VALUE,
          SQUARE_FOOT_IN_SQUARE_MILE_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(squareYardUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          AREA_UNIT_VALUE,
          SQUARE_YARD_IN_SQUARE_MILE_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(hectareUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          AREA_UNIT_VALUE,
          HECTARE_IN_SQUARE_MILE_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(acreUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          AREA_UNIT_VALUE,
          ACRE_IN_SQUARE_MILE_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(squareMileUnit);

        expect(instance.value, AREA_UNIT_VALUE);
      },
    );
  });
}
