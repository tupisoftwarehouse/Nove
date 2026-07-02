import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/length_unit_converter/foot_unit_entity.dart";
import "package:nove/domain/length_unit_converter/inch_unit_entity.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/kilometer_unit_entity.dart";
import "package:nove/domain/length_unit_converter/meter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/centimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/mile_unit_entity.dart";
import "package:nove/domain/length_unit_converter/millimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/nautical_mile_unit_entity.dart";
import "package:nove/domain/length_unit_converter/yard_unit_entity.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/length_unit_input_value_updating_parser.dart";

void main() {
  group("Test \"LengthUnitInputValueUpdatingParser\" Class", () {
    late TextEditingController controller;
    late String updatedAreaUnitValue;

    setUp(() {
      controller = TextEditingController(text: LENGTH_UNIT_VALUE);

      updatedAreaUnitValue = double.parse(LENGTH_UNIT_VALUE).toString();
    });

    test(
      "Test If Method \"updateLengthUnitValue\" Updates Length Unit Value On Controller",
      () {
        late final MeterUnitEntity updatedMeterInstance;
        late final KilometerUnitEntity updatedKilometerInstance;
        late final CentimeterUnitEntity updatedCentimeterInstance;
        late final MillimeterUnitEntity updatedMillimeterInstance;
        late final MileUnitEntity updatedMileInstance;
        late final YardUnitEntity updatedYardInstance;
        late final FootUnitEntity updatedFootInstance;
        late final InchUnitEntity updatedInchInstance;
        late final NauticalMileUnitEntity updatedNauticalMileInstance;

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.METER,
          (updatedLengthUnit) {
            updatedMeterInstance = updatedLengthUnit as MeterUnitEntity;
          },
        );

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.KILOMETER,
          (updatedLengthUnit) {
            updatedKilometerInstance = updatedLengthUnit as KilometerUnitEntity;
          },
        );

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.CENTIMETER,
          (updatedLengthUnit) {
            updatedCentimeterInstance =
                updatedLengthUnit as CentimeterUnitEntity;
          },
        );

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.MILLIMETER,
          (updatedLengthUnit) {
            updatedMillimeterInstance =
                updatedLengthUnit as MillimeterUnitEntity;
          },
        );

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.MILE,
          (updatedLengthUnit) {
            updatedMileInstance = updatedLengthUnit as MileUnitEntity;
          },
        );

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.YARD,
          (updatedLengthUnit) {
            updatedYardInstance = updatedLengthUnit as YardUnitEntity;
          },
        );

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.FOOT,
          (updatedLengthUnit) {
            updatedFootInstance = updatedLengthUnit as FootUnitEntity;
          },
        );

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.INCH,
          (updatedLengthUnit) {
            updatedInchInstance = updatedLengthUnit as InchUnitEntity;
          },
        );

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.NAUTICAL_MILE,
          (updatedLengthUnit) {
            updatedNauticalMileInstance =
                updatedLengthUnit as NauticalMileUnitEntity;
          },
        );

        expect(updatedMeterInstance.value, updatedAreaUnitValue);
        expect(updatedMeterInstance.measureUnit, LengthUnit.METER);

        expect(updatedKilometerInstance.value, updatedAreaUnitValue);
        expect(updatedKilometerInstance.measureUnit, LengthUnit.KILOMETER);

        expect(updatedCentimeterInstance.value, updatedAreaUnitValue);
        expect(updatedCentimeterInstance.measureUnit, LengthUnit.CENTIMETER);

        expect(updatedMillimeterInstance.value, updatedAreaUnitValue);
        expect(updatedMillimeterInstance.measureUnit, LengthUnit.MILLIMETER);

        expect(updatedMileInstance.value, updatedAreaUnitValue);
        expect(updatedMileInstance.measureUnit, LengthUnit.MILE);

        expect(updatedYardInstance.value, updatedAreaUnitValue);
        expect(updatedYardInstance.measureUnit, LengthUnit.YARD);

        expect(updatedFootInstance.value, updatedAreaUnitValue);
        expect(updatedFootInstance.measureUnit, LengthUnit.FOOT);

        expect(updatedInchInstance.value, updatedAreaUnitValue);
        expect(updatedInchInstance.measureUnit, LengthUnit.INCH);

        expect(updatedNauticalMileInstance.value, updatedAreaUnitValue);
        expect(
          updatedNauticalMileInstance.measureUnit,
          LengthUnit.NAUTICAL_MILE,
        );
      },
    );

    test(
      "Test If Method \"updateLengthUnitValue\" Removes Last Character If \"updatedInputValue\" Casting Fails With Value Not Empty And Last Character Is Not Allowed",
      () {
        controller.text = LENGTH_UNIT_VALUE + NON_NUMERIC_CHARACTER;

        LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
          controller,
          LengthUnit.METER,
          (updatedLengthUnit) {},
        );

        expect(controller.text, LENGTH_UNIT_VALUE);
      },
    );
  });
}
