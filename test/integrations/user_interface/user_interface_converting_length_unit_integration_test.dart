import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart" as material;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/compositions/length_unit_input.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/length_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "../../concerns/measure_unit_value_formatter.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"User Interface Converting Length Unit\" Integration", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late LengthUnitConverterViewModel lengthUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<LengthUnit>(
        ZEROED_LENGTH_UNIT,
        [ZEROED_LENGTH_UNIT],
        0,
      );
      final lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      lengthUnitConverterViewModel = LengthUnitConverterViewModel(
        lengthUnitConverter,
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets(
      "Test Converting Length Unit By \"LengthUnitConverter\" On \"UserInterface\"",
      (tester) async {
        final convertedLengthUnitValue =
            MeasureUnitValueFormatter.getFormattedValue(
              LENGTH_UNIT_VALUE,
              KILOMETER_IN_METER_CONVERSION_MULTIPLIER,
            );

        await tester.pumpWidget(
          material.MaterialApp(
            home: LengthUnitConverterScreen(
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(
          find.descendant(
            of: find.byType(LengthUnitInput),
            matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
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
                of: find.byType(LengthUnitInput),
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
                .METER_UNIT_LABEL,
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
                of: find.byType(LengthUnitInput),
                matching: find.byType(material.TextField),
              )
              .at(0),
          LENGTH_UNIT_VALUE,
        );

        expect(
          lengthUnitConverterViewModel.listOfLengthUnits.value[1].value,
          convertedLengthUnitValue,
        );
      },
    );
  });
}
