import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart" as material;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/compositions/area_unit_input.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/area_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "../../concerns/measure_unit_value_formatter.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"User Interface Converting Area Unit\" Integration", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late AreaUnitConverterViewModel areaUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        ZEROED_AREA_UNIT,
        [ZEROED_AREA_UNIT],
        0,
      );
      final areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      areaUnitConverterViewModel = AreaUnitConverterViewModel(
        areaUnitConverter,
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets(
      "Test Converting Area Unit By \"AreaUnitConverter\" On \"UserInterface\"",
      (tester) async {
        final convertedAreaUnitValue =
            MeasureUnitValueFormatter.getFormattedValue(
              AREA_UNIT_VALUE,
              SQUARE_KILOMETER_IN_SQUARE_METER_CONVERSION_MULTIPLIER,
            );

        await tester.pumpWidget(
          material.MaterialApp(
            home: AreaUnitConverterScreen(
              areaUnitConverterViewModel: areaUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(
          find.descendant(
            of: find.byType(AreaUnitInput),
            matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
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

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .ADD_BUTTON_TITLE,
          ),
        );

        await tester.pump();

        await tester.tap(
          find
              .descendant(
                of: find.byType(AreaUnitInput),
                matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
              )
              .at(1),
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

        await tester.tap(
          find
              .descendant(
                of: find.byType(Checkbox),
                matching: find.byType(TapIndicator),
              )
              .at(0),
        );

        await tester.enterText(
          find
              .descendant(
                of: find.byType(AreaUnitInput),
                matching: find.byType(material.TextField),
              )
              .at(0),
          AREA_UNIT_VALUE,
        );

        expect(
          areaUnitConverterViewModel.listOfAreaUnits.value[1].value,
          convertedAreaUnitValue,
        );
      },
    );
  });
}
