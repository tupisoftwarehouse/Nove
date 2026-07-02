import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_category.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/body_mass_index_calculator_screen.dart";
import "package:nove/user_interface/view_models/body_mass_index_calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../mocks/user_interface/key_value_database_mock.dart";
import "../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"Body Mass Index Calculator\" Feature", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late BodyMassIndexCalculatorViewModel bodyMassIndexCalculatorViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      bodyMassIndexCalculatorViewModel = BodyMassIndexCalculatorViewModel(
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets("Test Resetting Body Mass Index Data", (tester) async {
      await tester.binding.setSurfaceSize(FIXED_SCREEN_SIZE);

      bodyMassIndexCalculatorViewModel.setCandidateHeight(
        NORMAL_HEIGHT_IN_CENTIMETERS,
      );
      bodyMassIndexCalculatorViewModel.setCandidateWeight(
        NORMAL_WEIGHT_IN_KILOGRAMS,
      );
      bodyMassIndexCalculatorViewModel.calculateBodyMassIndex();

      await tester.pumpWidget(
        material.MaterialApp(
          home: BodyMassIndexCalculatorScreen(
            bodyMassIndexCalculatorViewModel: bodyMassIndexCalculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      expect(
        bodyMassIndexCalculatorViewModel.candidateWeight.value,
        ZEROED_WEIGHT,
      );

      expect(
        bodyMassIndexCalculatorViewModel.candidateHeight.value,
        ZEROED_HEIGHT,
      );

      tester.binding.setSurfaceSize(null);
    });

    testWidgets("Test Restoring Reset Body Mass Index Data", (tester) async {
      await tester.binding.setSurfaceSize(FIXED_SCREEN_SIZE);

      bodyMassIndexCalculatorViewModel.setCandidateHeight(
        NORMAL_HEIGHT_IN_CENTIMETERS,
      );
      bodyMassIndexCalculatorViewModel.setCandidateWeight(
        NORMAL_WEIGHT_IN_KILOGRAMS,
      );

      bodyMassIndexCalculatorViewModel.calculateBodyMassIndex();

      await tester.pumpWidget(
        material.MaterialApp(
          home: BodyMassIndexCalculatorScreen(
            bodyMassIndexCalculatorViewModel: bodyMassIndexCalculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(
        bodyMassIndexCalculatorViewModel.candidateHeight.value,
        NORMAL_HEIGHT_IN_CENTIMETERS,
      );
      expect(
        bodyMassIndexCalculatorViewModel.candidateWeight.value,
        NORMAL_WEIGHT_IN_KILOGRAMS,
      );

      expect(
        bodyMassIndexCalculatorViewModel.bodyMassIndex.value.value,
        NORMAL_BODY_MASS_INDEX.value,
      );
      expect(
        bodyMassIndexCalculatorViewModel.bodyMassIndex.value.category,
        NORMAL_BODY_MASS_INDEX.category,
      );

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets("Test Calculating Body Mass Index", (tester) async {
      await tester.binding.setSurfaceSize(FIXED_SCREEN_SIZE);

      await tester.pumpWidget(
        material.MaterialApp(
          home: BodyMassIndexCalculatorScreen(
            bodyMassIndexCalculatorViewModel: bodyMassIndexCalculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.enterText(
        find.byType(material.TextField).at(0),
        NORMAL_HEIGHT_IN_CENTIMETERS.toString(),
      );

      await tester.enterText(
        find.byType(material.TextField).at(1),
        NORMAL_WEIGHT_IN_KILOGRAMS.toString(),
      );

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .CALCULATE_BUTTON_TITLE,
        ),
      );

      expect(
        bodyMassIndexCalculatorViewModel.candidateHeight.value,
        NORMAL_HEIGHT_IN_CENTIMETERS,
      );
      expect(
        bodyMassIndexCalculatorViewModel.candidateWeight.value,
        NORMAL_WEIGHT_IN_KILOGRAMS,
      );

      expect(
        bodyMassIndexCalculatorViewModel.bodyMassIndex.value.value,
        NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
      );
      expect(
        bodyMassIndexCalculatorViewModel.bodyMassIndex.value.category,
        BodyMassIndexCategory.NORMAL_WEIGHT,
      );

      await tester.binding.setSurfaceSize(null);
    });
  });
}
