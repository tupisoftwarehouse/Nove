import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart" as material;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/compositions/speed_unit_input.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/speed_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "../../concerns/measure_unit_value_formatter.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"User Interface Converting Speed Unit\" Integration", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late SpeedUnitConverterViewModel speedUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
        ZEROED_SPEED_UNIT,
        [ZEROED_SPEED_UNIT],
        0,
      );
      final speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      speedUnitConverterViewModel = SpeedUnitConverterViewModel(
        speedUnitConverter,
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets(
      "Test Converting Speed Unit By \"SpeedUnitConverter\" On \"UserInterface\"",
      (tester) async {
        final convertedSpeedUnitValue =
            MeasureUnitValueFormatter.getFormattedValue(
              SPEED_UNIT_VALUE,
              KILOMETER_PER_HOUR_IN_METER_PER_SECOND_CONVERSION_MULTIPLIER,
            );

        await tester.pumpWidget(
          material.MaterialApp(
            home: SpeedUnitConverterScreen(
              speedUnitConverterViewModel: speedUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(
          find.descendant(
            of: find.byType(SpeedUnitInput),
            matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
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
                of: find.byType(SpeedUnitInput),
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
                .METER_PER_SECOND_UNIT_LABEL,
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
                of: find.byType(SpeedUnitInput),
                matching: find.byType(material.TextField),
              )
              .at(0),
          SPEED_UNIT_VALUE,
        );

        expect(
          speedUnitConverterViewModel.listOfSpeedUnits.value[1].value,
          convertedSpeedUnitValue,
        );
      },
    );
  });
}
