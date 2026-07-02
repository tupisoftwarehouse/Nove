import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/number_system_input.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"NumberSystemInput\" Composition", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late NumberSystemConverterViewModel numberSystemConverterViewModel;
    late TextEditingController controller;

    setUp(() {
      final measureUnitConverter = MeasureUnitConverter(
        ZEROED_NUMBER_SYSTEM as NumberSystemEntity,
        [ZEROED_NUMBER_SYSTEM as NumberSystemEntity],
        0,
      );
      final numberSystemConverter = NumberSystemConverter(measureUnitConverter);

      final keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      numberSystemConverterViewModel = NumberSystemConverterViewModel(
        numberSystemConverter,
        keyValueDatabase,
      );

      controller = TextEditingController();
    });

    testWidgets(
      "Test If Composition Shows Remove Unit Button If Item Is Not The First Of List Of Number Systems",
      (tester) async {
        numberSystemConverterViewModel.addNumberSystem();

        await tester.pumpWidget(
          MaterialApp(
            home: NumberSystemInput(
              numberSystemInputIndex: 1,
              numberSystemConverterViewModel: numberSystemConverterViewModel,
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
      "Test If Remove Unit Button Removes Item From List Of Number Systems On Tap",
      (tester) async {
        numberSystemConverterViewModel.addNumberSystem();

        await tester.pumpWidget(
          MaterialApp(
            home: NumberSystemInput(
              numberSystemInputIndex: 1,
              numberSystemConverterViewModel: numberSystemConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.close_rounded));

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
          1,
        );
      },
    );

    testWidgets(
      "Test If Dropdown Menu Changes Measure Unit Of Item With Its Value Fixed On Tap",
      (tester) async {
        numberSystemConverterViewModel.updateNumberSystemAt(
          DECIMAL_NUMBER_SYSTEM,
          0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: NumberSystemInput(
              numberSystemInputIndex: 0,
              numberSystemConverterViewModel: numberSystemConverterViewModel,
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
                .BINARY_NUMBER_SYSTEM_LABEL,
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .BINARY_NUMBER_SYSTEM_LABEL,
          ),
        );

        await tester.pumpAndSettle();

        expect(
          numberSystemConverterViewModel
              .listOfNumberSystems
              .value
              .first
              .measureUnit,
          NumberSystem.BINARY,
        );

        expect(
          tester
              .widget<NumberSystemInput>(find.byType(NumberSystemInput))
              .controller
              .text,
          BINARY_NUMBER,
        );

        await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

        await tester.pumpAndSettle();

        await tester.ensureVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .OCTAL_NUMBER_SYSTEM_LABEL,
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .OCTAL_NUMBER_SYSTEM_LABEL,
          ),
        );

        await tester.pumpAndSettle();

        expect(
          numberSystemConverterViewModel
              .listOfNumberSystems
              .value
              .first
              .measureUnit,
          NumberSystem.OCTAL,
        );

        expect(
          tester
              .widget<NumberSystemInput>(find.byType(NumberSystemInput))
              .controller
              .text,
          OCTAL_NUMBER,
        );

        await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

        await tester.pumpAndSettle();

        await tester.ensureVisible(
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
                .DECIMAL_NUMBER_SYSTEM_LABEL,
          ),
        );

        await tester.pumpAndSettle();

        expect(
          numberSystemConverterViewModel
              .listOfNumberSystems
              .value
              .first
              .measureUnit,
          NumberSystem.DECIMAL,
        );

        expect(
          tester
              .widget<NumberSystemInput>(find.byType(NumberSystemInput))
              .controller
              .text,
          DECIMAL_NUMBER,
        );

        await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

        await tester.pumpAndSettle();

        await tester.ensureVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .HEXADECIMAL_NUMBER_SYSTEM_LABEL,
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .HEXADECIMAL_NUMBER_SYSTEM_LABEL,
          ),
        );

        await tester.pumpAndSettle();

        expect(
          numberSystemConverterViewModel
              .listOfNumberSystems
              .value
              .first
              .measureUnit,
          NumberSystem.HEXADECIMAL,
        );

        expect(
          tester
              .widget<NumberSystemInput>(find.byType(NumberSystemInput))
              .controller
              .text,
          HEXADECIMAL_NUMBER,
        );
      },
    );

    testWidgets("Test If Input Updates Its Composition On Change", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NumberSystemInput(
            numberSystemInputIndex: 0,
            numberSystemConverterViewModel: numberSystemConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), "1010");

      expect(controller.text, "1010");
    });

    testWidgets(
      "Test If Composition Shows Add Unit Button If Item Is The First Of List Of Number Systems",
      (tester) async {
        numberSystemConverterViewModel.addNumberSystem();

        await tester.pumpWidget(
          MaterialApp(
            home: NumberSystemInput(
              numberSystemInputIndex: 0,
              numberSystemConverterViewModel: numberSystemConverterViewModel,
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
      "Test If Add Unit Button Adds Item To List Of Number Systems On Tap",
      (tester) async {
        numberSystemConverterViewModel.addNumberSystem();

        await tester.pumpWidget(
          MaterialApp(
            home: NumberSystemInput(
              numberSystemInputIndex: 0,
              numberSystemConverterViewModel: numberSystemConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.add_rounded));

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
          3,
        );
      },
    );
  });
}
