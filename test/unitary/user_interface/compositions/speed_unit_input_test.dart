import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/speed_unit_input.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"SpeedUnitInput\" Composition", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late SpeedUnitConverterViewModel speedUnitConverterViewModel;
    late TextEditingController controller;

    setUp(() {
      final measureUnitConverter = MeasureUnitConverter(
        ZEROED_SPEED_UNIT as SpeedUnitEntity,
        [ZEROED_SPEED_UNIT as SpeedUnitEntity],
        0,
      );
      final speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

      final keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      speedUnitConverterViewModel = SpeedUnitConverterViewModel(
        speedUnitConverter,
        keyValueDatabase,
      );

      controller = TextEditingController();
    });

    testWidgets(
      "Test If Composition Shows Remove Unit Button If Item Is Not The First Of List Of Speed Units",
      (tester) async {
        speedUnitConverterViewModel.addSpeedUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: SpeedUnitInput(
              speedUnitInputIndex: 1,
              speedUnitConverterViewModel: speedUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        expect(find.byIcon(Symbols.close_rounded), findsOneWidget);
      },
    );

    testWidgets(
      "Test If Remove Unit Button Removes Item From List Of Speed Units On Tap",
      (tester) async {
        speedUnitConverterViewModel.addSpeedUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: SpeedUnitInput(
              speedUnitInputIndex: 1,
              speedUnitConverterViewModel: speedUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.close_rounded));

        expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 1);
      },
    );

    testWidgets("Test If Dropdown Menu Changes Measure Unit Of Item On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SpeedUnitInput(
            speedUnitInputIndex: 0,
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .LIGHTSPEED_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .LIGHTSPEED_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.LIGHTSPEED,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .INCH_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .INCH_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.INCH_PER_SECOND,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOMETER_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOMETER_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.KILOMETER_PER_SECOND,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .FOOT_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .FOOT_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.FOOT_PER_SECOND,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KNOT_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KNOT_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.KNOT,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find
            .text(
              deviceLanguageStringsViewModel
                  .deviceLanguageStrings
                  .value
                  .MACH_UNIT_LABEL,
            )
            .first,
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find
            .text(
              deviceLanguageStringsViewModel
                  .deviceLanguageStrings
                  .value
                  .MACH_UNIT_LABEL,
            )
            .first,
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.MACH,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOMETER_PER_HOUR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOMETER_PER_HOUR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.KILOMETER_PER_HOUR,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .METER_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .METER_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.METER_PER_SECOND,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILE_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILE_PER_SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.MILE_PER_SECOND,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILE_PER_HOUR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILE_PER_HOUR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.MILE_PER_HOUR,
      );
    });

    testWidgets("Test If Input Updates Its Composition On Change", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SpeedUnitInput(
            speedUnitInputIndex: 0,
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), SPEED_UNIT_VALUE);

      expect(controller.text, SPEED_UNIT_VALUE);
    });

    testWidgets(
      "Test If Composition Shows Add Unit Button If Item Is The First Of List Of Speed Units",
      (tester) async {
        speedUnitConverterViewModel.addSpeedUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: SpeedUnitInput(
              speedUnitInputIndex: 0,
              speedUnitConverterViewModel: speedUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        expect(find.byIcon(Symbols.add_rounded), findsOneWidget);
      },
    );

    testWidgets(
      "Test If Add Unit Button Adds Item To List Of Speed Units On Tap",
      (tester) async {
        speedUnitConverterViewModel.addSpeedUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: SpeedUnitInput(
              speedUnitInputIndex: 0,
              speedUnitConverterViewModel: speedUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.add_rounded));

        expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 3);
      },
    );
  });
}
