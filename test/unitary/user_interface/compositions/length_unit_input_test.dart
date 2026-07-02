import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/length_unit_input.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"LengthUnitInput\" Composition", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late LengthUnitConverterViewModel lengthUnitConverterViewModel;
    late TextEditingController controller;

    setUp(() {
      final measureUnitConverter = MeasureUnitConverter(
        ZEROED_LENGTH_UNIT as LengthUnitEntity,
        [ZEROED_LENGTH_UNIT as LengthUnitEntity],
        0,
      );
      final lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

      final keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      lengthUnitConverterViewModel = LengthUnitConverterViewModel(
        lengthUnitConverter,
        keyValueDatabase,
      );

      controller = TextEditingController();
    });

    testWidgets(
      "Test If Composition Shows Remove Unit Button If Item Is Not The First Of List Of Length Units",
      (tester) async {
        lengthUnitConverterViewModel.addLengthUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: LengthUnitInput(
              lengthUnitInputIndex: 1,
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
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
      "Test If Remove Unit Button Removes Item From List Of Length Units On Tap",
      (tester) async {
        lengthUnitConverterViewModel.addLengthUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: LengthUnitInput(
              lengthUnitInputIndex: 1,
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.close_rounded));

        expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 1);
      },
    );

    testWidgets("Test If Dropdown Menu Changes Measure Unit Of Item On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LengthUnitInput(
            lengthUnitInputIndex: 0,
            lengthUnitConverterViewModel: lengthUnitConverterViewModel,
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
              .KILOMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value.first.measureUnit,
        LengthUnit.KILOMETER,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .METER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .METER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value.first.measureUnit,
        LengthUnit.METER,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .CENTIMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .CENTIMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value.first.measureUnit,
        LengthUnit.CENTIMETER,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILLIMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILLIMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value.first.measureUnit,
        LengthUnit.MILLIMETER,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value.first.measureUnit,
        LengthUnit.MILE,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .YARD_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .YARD_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value.first.measureUnit,
        LengthUnit.YARD,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .FOOT_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .FOOT_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value.first.measureUnit,
        LengthUnit.FOOT,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .INCH_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .INCH_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value.first.measureUnit,
        LengthUnit.INCH,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .NAUTICAL_MILE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .NAUTICAL_MILE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        lengthUnitConverterViewModel.listOfLengthUnits.value.first.measureUnit,
        LengthUnit.NAUTICAL_MILE,
      );
    });

    testWidgets("Test If Input Updates Its Composition On Change", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LengthUnitInput(
            lengthUnitInputIndex: 0,
            lengthUnitConverterViewModel: lengthUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), LENGTH_UNIT_VALUE);

      expect(controller.text, LENGTH_UNIT_VALUE);
    });

    testWidgets(
      "Test If Composition Shows Add Unit Button If Item Is The First Of List Of Length Units",
      (tester) async {
        lengthUnitConverterViewModel.addLengthUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: LengthUnitInput(
              lengthUnitInputIndex: 0,
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
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
      "Test If Add Unit Button Adds Item To List Of Length Units On Tap",
      (tester) async {
        lengthUnitConverterViewModel.addLengthUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: LengthUnitInput(
              lengthUnitInputIndex: 0,
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.add_rounded));

        expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 3);
      },
    );
  });
}
