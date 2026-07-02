import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart" as material;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/compositions/mass_unit_input.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/mass_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "../../concerns/measure_unit_value_formatter.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"User Interface Converting Mass Unit\" Integration", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late MassUnitConverterViewModel massUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<MassUnit>(
        ZEROED_MASS_UNIT,
        [ZEROED_MASS_UNIT],
        0,
      );
      final massUnitConverter = MassUnitConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      massUnitConverterViewModel = MassUnitConverterViewModel(
        massUnitConverter,
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets(
      "Test Converting Mass Unit By \"MassUnitConverter\" On \"UserInterface\"",
      (tester) async {
        final convertedMassUnitValue =
            MeasureUnitValueFormatter.getFormattedValue(
              MASS_UNIT_VALUE,
              KILOGRAM_IN_GRAM_CONVERSION_MULTIPLIER,
            );

        await tester.pumpWidget(
          material.MaterialApp(
            home: MassUnitConverterScreen(
              massUnitConverterViewModel: massUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(
          find.descendant(
            of: find.byType(MassUnitInput),
            matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
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
                of: find.byType(MassUnitInput),
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
                .GRAM_UNIT_LABEL,
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
                of: find.byType(MassUnitInput),
                matching: find.byType(material.TextField),
              )
              .at(0),
          MASS_UNIT_VALUE,
        );

        expect(
          massUnitConverterViewModel.listOfMassUnits.value[1].value,
          convertedMassUnitValue,
        );
      },
    );
  });
}
