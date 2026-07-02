import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/mass_unit_input.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"MassUnitInput\" Composition", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late MassUnitConverterViewModel massUnitConverterViewModel;
    late TextEditingController controller;

    setUp(() {
      final measureUnitConverter = MeasureUnitConverter(
        ZEROED_MASS_UNIT as MassUnitEntity,
        [ZEROED_MASS_UNIT as MassUnitEntity],
        0,
      );
      final massUnitConverter = MassUnitConverter(measureUnitConverter);

      final keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      massUnitConverterViewModel = MassUnitConverterViewModel(
        massUnitConverter,
        keyValueDatabase,
      );

      controller = TextEditingController();
    });

    testWidgets(
      "Test If Composition Shows Remove Unit Button If Item Is Not The First Of List Of Mass Units",
      (tester) async {
        massUnitConverterViewModel.addMassUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: MassUnitInput(
              massUnitInputIndex: 1,
              massUnitConverterViewModel: massUnitConverterViewModel,
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
      "Test If Remove Unit Button Removes Item From List Of Mass Units On Tap",
      (tester) async {
        massUnitConverterViewModel.addMassUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: MassUnitInput(
              massUnitInputIndex: 1,
              massUnitConverterViewModel: massUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.close_rounded));

        expect(massUnitConverterViewModel.listOfMassUnits.value.length, 1);
      },
    );

    testWidgets("Test If Dropdown Menu Changes Measure Unit Of Item On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MassUnitInput(
            massUnitInputIndex: 0,
            massUnitConverterViewModel: massUnitConverterViewModel,
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
              .TONNE_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .TONNE_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      expect(
        massUnitConverterViewModel.listOfMassUnits.value.first.measureUnit,
        MassUnit.TONNE,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));
      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOGRAM_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOGRAM_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      expect(
        massUnitConverterViewModel.listOfMassUnits.value.first.measureUnit,
        MassUnit.KILOGRAM,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));
      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .GRAM_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .GRAM_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      expect(
        massUnitConverterViewModel.listOfMassUnits.value.first.measureUnit,
        MassUnit.GRAM,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));
      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILLIGRAM_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILLIGRAM_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      expect(
        massUnitConverterViewModel.listOfMassUnits.value.first.measureUnit,
        MassUnit.MILLIGRAM,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));
      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .POUND_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .POUND_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      expect(
        massUnitConverterViewModel.listOfMassUnits.value.first.measureUnit,
        MassUnit.POUND,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));
      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .OUNCE_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .OUNCE_UNIT_LABEL,
        ),
      );
      await tester.pumpAndSettle();

      expect(
        massUnitConverterViewModel.listOfMassUnits.value.first.measureUnit,
        MassUnit.OUNCE,
      );
    });

    testWidgets("Test If Input Updates Its Composition On Change", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MassUnitInput(
            massUnitInputIndex: 0,
            massUnitConverterViewModel: massUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), "123");

      expect(controller.text, "123");
    });

    testWidgets(
      "Test If Composition Shows Add Unit Button If Item Is The First Of List Of Mass Units",
      (tester) async {
        massUnitConverterViewModel.addMassUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: MassUnitInput(
              massUnitInputIndex: 0,
              massUnitConverterViewModel: massUnitConverterViewModel,
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
      "Test If Add Unit Button Adds Item To List Of Mass Units On Tap",
      (tester) async {
        massUnitConverterViewModel.addMassUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: MassUnitInput(
              massUnitInputIndex: 0,
              massUnitConverterViewModel: massUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.add_rounded));

        expect(massUnitConverterViewModel.listOfMassUnits.value.length, 3);
      },
    );
  });
}
