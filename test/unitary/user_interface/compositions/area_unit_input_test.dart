import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/area_unit_input.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"AreaUnitInput\" Composition", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late AreaUnitConverterViewModel areaUnitConverterViewModel;
    late TextEditingController controller;

    setUp(() {
      final measureUnitConverter = MeasureUnitConverter(
        ZEROED_AREA_UNIT as AreaUnitEntity,
        [ZEROED_AREA_UNIT as AreaUnitEntity],
        0,
      );
      final areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      final keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      areaUnitConverterViewModel = AreaUnitConverterViewModel(
        areaUnitConverter,
        keyValueDatabase,
      );

      controller = TextEditingController();
    });

    testWidgets(
      "Test If Composition Shows Remove Unit Button If Item Is Not The First Of List Of Area Units",
      (tester) async {
        areaUnitConverterViewModel.addAreaUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: AreaUnitInput(
              areaUnitInputIndex: 1,
              areaUnitConverterViewModel: areaUnitConverterViewModel,
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
      "Test If Remove Unit Button Removes Item From List Of Area Units On Tap",
      (tester) async {
        areaUnitConverterViewModel.addAreaUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: AreaUnitInput(
              areaUnitInputIndex: 1,
              areaUnitConverterViewModel: areaUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.close_rounded));

        expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 1);
      },
    );

    testWidgets("Test If Dropdown Menu Changes Measure Unit Of Item On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AreaUnitInput(
            areaUnitInputIndex: 0,
            areaUnitConverterViewModel: areaUnitConverterViewModel,
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
              .SQUARE_KILOMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_KILOMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.SQUARE_KILOMETER,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_METER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_METER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.SQUARE_METER,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_CENTIMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_CENTIMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.SQUARE_CENTIMETER,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_MILLIMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_MILLIMETER_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.SQUARE_MILLIMETER,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_MILE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_MILE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.SQUARE_MILE,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_YARD_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_YARD_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.SQUARE_YARD,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_FOOT_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_FOOT_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.SQUARE_FOOT,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_INCH_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SQUARE_INCH_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.SQUARE_INCH,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .HECTARE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .HECTARE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.HECTARE,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .ACRE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .ACRE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        areaUnitConverterViewModel.listOfAreaUnits.value.first.measureUnit,
        AreaUnit.ACRE,
      );
    });

    testWidgets("Test If Input Updates Its Composition On Change", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AreaUnitInput(
            areaUnitInputIndex: 0,
            areaUnitConverterViewModel: areaUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), AREA_UNIT_VALUE);

      expect(controller.text, AREA_UNIT_VALUE);
    });

    testWidgets(
      "Test If Composition Shows Add Unit Button If Item Is Not The First Of List Of Area Units",
      (tester) async {
        areaUnitConverterViewModel.addAreaUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: AreaUnitInput(
              areaUnitInputIndex: 0,
              areaUnitConverterViewModel: areaUnitConverterViewModel,
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
      "Test If Add Unit Button Adds Item From List Of Area Units On Tap",
      (tester) async {
        areaUnitConverterViewModel.addAreaUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: AreaUnitInput(
              areaUnitInputIndex: 0,
              areaUnitConverterViewModel: areaUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.add_rounded));

        expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 3);
      },
    );
  });
}
