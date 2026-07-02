import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/time_unit_input.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/time_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeUnitInput\" Composition", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TimeUnitConverterViewModel timeUnitConverterViewModel;
    late TextEditingController controller;

    setUp(() {
      final measureUnitConverter = MeasureUnitConverter(
        ZEROED_TIME_UNIT as TimeUnitEntity,
        [ZEROED_TIME_UNIT as TimeUnitEntity],
        0,
      );
      final timeUnitConverter = TimeUnitConverter(measureUnitConverter);

      final keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      timeUnitConverterViewModel = TimeUnitConverterViewModel(
        timeUnitConverter,
        keyValueDatabase,
      );

      controller = TextEditingController();
    });

    testWidgets(
      "Test If Composition Shows Remove Unit Button If Item Is Not The First Of List Of Time Units",
      (tester) async {
        timeUnitConverterViewModel.addTimeUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: TimeUnitInput(
              timeUnitInputIndex: 1,
              timeUnitConverterViewModel: timeUnitConverterViewModel,
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
      "Test If Remove Unit Button Removes Item From List Of Time Units On Tap",
      (tester) async {
        timeUnitConverterViewModel.addTimeUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: TimeUnitInput(
              timeUnitInputIndex: 1,
              timeUnitConverterViewModel: timeUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.close_rounded));

        expect(timeUnitConverterViewModel.listOfTimeUnits.value.length, 1);
      },
    );

    testWidgets("Test If Dropdown Menu Changes Measure Unit Of Item On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TimeUnitInput(
            timeUnitInputIndex: 0,
            timeUnitConverterViewModel: timeUnitConverterViewModel,
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
              .YEAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .YEAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value.first.measureUnit,
        TimeUnit.YEAR,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .WEEK_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .WEEK_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value.first.measureUnit,
        TimeUnit.WEEK,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .DAY_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .DAY_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value.first.measureUnit,
        TimeUnit.DAY,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .HOUR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .HOUR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value.first.measureUnit,
        TimeUnit.HOUR,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MINUTE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MINUTE_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value.first.measureUnit,
        TimeUnit.MINUTE,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value.first.measureUnit,
        TimeUnit.SECOND,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILLISECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .MILLISECOND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        timeUnitConverterViewModel.listOfTimeUnits.value.first.measureUnit,
        TimeUnit.MILLISECOND,
      );
    });

    testWidgets("Test If Input Updates Its Composition On Change", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TimeUnitInput(
            timeUnitInputIndex: 0,
            timeUnitConverterViewModel: timeUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), TIME_UNIT_VALUE);

      expect(controller.text, TIME_UNIT_VALUE);
    });

    testWidgets(
      "Test If Composition Shows Add Unit Button If Item Is Not The First Of List Of Time Units",
      (tester) async {
        timeUnitConverterViewModel.addTimeUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: TimeUnitInput(
              timeUnitInputIndex: 0,
              timeUnitConverterViewModel: timeUnitConverterViewModel,
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
      "Test If Add Unit Button Adds Item From List Of Time Units On Tap",
      (tester) async {
        timeUnitConverterViewModel.addTimeUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: TimeUnitInput(
              timeUnitInputIndex: 0,
              timeUnitConverterViewModel: timeUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.add_rounded));

        expect(timeUnitConverterViewModel.listOfTimeUnits.value.length, 3);
      },
    );
  });
}
