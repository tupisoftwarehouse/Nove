import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart" as material;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/compositions/number_system_input.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/number_system_converter_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"User Interface Converting Number System\" Integration", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late NumberSystemConverterViewModel numberSystemConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<NumberSystem>(
        ZEROED_NUMBER_SYSTEM,
        [ZEROED_NUMBER_SYSTEM],
        0,
      );
      final numberSystemConverter = NumberSystemConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      numberSystemConverterViewModel = NumberSystemConverterViewModel(
        numberSystemConverter,
        keyValueDatabase,
      );

      router = Router(navigator);
    });
    testWidgets(
      "Test Converting Number System By \"NumberSystemConverter\" On \"UserInterface\"",
      (tester) async {
        final parsedNumberSystemValue = int.parse(
          NUMBER_SYSTEM_VALUE,
          radix: DECIMAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(BINARY_NUMBER_SYSTEM_BASE);

        await tester.pumpWidget(
          material.MaterialApp(
            home: NumberSystemConverterScreen(
              numberSystemConverterViewModel: numberSystemConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(
          find.descendant(
            of: find.byType(NumberSystemInput),
            matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .DECIMAL_NUMBER_SYSTEM_LABEL,
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
                of: find.byType(NumberSystemInput),
                matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
              )
              .at(1),
        );

        await tester.pumpAndSettle();

        await tester.ensureVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .BINARY_NUMBER_SYSTEM_LABEL,
          ),
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .BINARY_NUMBER_SYSTEM_LABEL,
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
                of: find.byType(NumberSystemInput),
                matching: find.byType(material.TextField),
              )
              .at(0),
          NUMBER_SYSTEM_VALUE,
        );

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value[1].value,
          parsedNumberSystemValue,
        );
      },
    );
  });
}
