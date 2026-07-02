import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
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
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/area_unit_input_value_updating_parser.dart";

void main() {
  group("Test \"AreaUnitInputValueUpdatingParser\" Class", () {
    late TextEditingController controller;
    late String updatedAreaUnitValue;

    setUp(() {
      controller = TextEditingController(text: AREA_UNIT_VALUE);

      updatedAreaUnitValue = double.parse(AREA_UNIT_VALUE).toString();
    });

    test(
      "Test If Method \"updateAreaUnitValue\" Updates Area Unit Value On Controller",
      () {
        late final SquareKilometerUnitEntity updatedSquareKilometerInstance;
        late final SquareMeterUnitEntity updatedSquareMeterInstance;
        late final SquareCentimeterUnitEntity updatedSquareCentimeterInstance;
        late final SquareMillimeterUnitEntity updatedSquareMillimeterInstance;
        late final SquareMileUnitEntity updatedSquareMileInstance;
        late final SquareYardUnitEntity updatedSquareYardInstance;
        late final SquareFootUnitEntity updatedSquareFootInstance;
        late final SquareInchUnitEntity updatedSquareInchInstance;
        late final HectareUnitEntity updatedHectareInstance;
        late final AcreUnitEntity updatedAcreInstance;

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.SQUARE_KILOMETER,
          (updatedAreaUnit) {
            updatedSquareKilometerInstance =
                updatedAreaUnit as SquareKilometerUnitEntity;
          },
        );

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.SQUARE_METER,
          (updatedAreaUnit) {
            updatedSquareMeterInstance =
                updatedAreaUnit as SquareMeterUnitEntity;
          },
        );

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.SQUARE_CENTIMETER,
          (updatedAreaUnit) {
            updatedSquareCentimeterInstance =
                updatedAreaUnit as SquareCentimeterUnitEntity;
          },
        );

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.SQUARE_MILLIMETER,
          (updatedAreaUnit) {
            updatedSquareMillimeterInstance =
                updatedAreaUnit as SquareMillimeterUnitEntity;
          },
        );

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.SQUARE_MILE,
          (updatedAreaUnit) {
            updatedSquareMileInstance = updatedAreaUnit as SquareMileUnitEntity;
          },
        );

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.SQUARE_YARD,
          (updatedAreaUnit) {
            updatedSquareYardInstance = updatedAreaUnit as SquareYardUnitEntity;
          },
        );

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.SQUARE_FOOT,
          (updatedAreaUnit) {
            updatedSquareFootInstance = updatedAreaUnit as SquareFootUnitEntity;
          },
        );

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.SQUARE_INCH,
          (updatedAreaUnit) {
            updatedSquareInchInstance = updatedAreaUnit as SquareInchUnitEntity;
          },
        );

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.HECTARE,
          (updatedAreaUnit) {
            updatedHectareInstance = updatedAreaUnit as HectareUnitEntity;
          },
        );

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.ACRE,
          (updatedAreaUnit) {
            updatedAcreInstance = updatedAreaUnit as AcreUnitEntity;
          },
        );

        expect(updatedSquareKilometerInstance.value, updatedAreaUnitValue);
        expect(
          updatedSquareKilometerInstance.measureUnit,
          AreaUnit.SQUARE_KILOMETER,
        );

        expect(updatedSquareMeterInstance.value, updatedAreaUnitValue);
        expect(updatedSquareMeterInstance.measureUnit, AreaUnit.SQUARE_METER);

        expect(updatedSquareCentimeterInstance.value, updatedAreaUnitValue);
        expect(
          updatedSquareCentimeterInstance.measureUnit,
          AreaUnit.SQUARE_CENTIMETER,
        );

        expect(updatedSquareMillimeterInstance.value, updatedAreaUnitValue);
        expect(
          updatedSquareMillimeterInstance.measureUnit,
          AreaUnit.SQUARE_MILLIMETER,
        );

        expect(updatedSquareMileInstance.value, updatedAreaUnitValue);
        expect(updatedSquareMileInstance.measureUnit, AreaUnit.SQUARE_MILE);

        expect(updatedSquareYardInstance.value, updatedAreaUnitValue);
        expect(updatedSquareYardInstance.measureUnit, AreaUnit.SQUARE_YARD);

        expect(updatedSquareFootInstance.value, updatedAreaUnitValue);
        expect(updatedSquareFootInstance.measureUnit, AreaUnit.SQUARE_FOOT);

        expect(updatedSquareInchInstance.value, updatedAreaUnitValue);
        expect(updatedSquareInchInstance.measureUnit, AreaUnit.SQUARE_INCH);

        expect(updatedHectareInstance.value, updatedAreaUnitValue);
        expect(updatedHectareInstance.measureUnit, AreaUnit.HECTARE);

        expect(updatedAcreInstance.value, updatedAreaUnitValue);
        expect(updatedAcreInstance.measureUnit, AreaUnit.ACRE);
      },
    );

    test(
      "Test If Method \"updateAreaUnitValue\" Removes Last Character If \"updatedInputValue\" Casting Fails With Value Not Empty And Last Character Is Not Allowed",
      () {
        controller.text = AREA_UNIT_VALUE + NON_NUMERIC_CHARACTER;

        AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
          controller,
          AreaUnit.SQUARE_KILOMETER,
          (updatedAreaUnit) {},
        );

        expect(controller.text, AREA_UNIT_VALUE);
      },
    );
  });
}
