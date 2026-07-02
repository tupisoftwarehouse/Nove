import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_category.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/body_mass_index_calculator_data_store.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/body_mass_index_calculator_screen.dart";
import "package:nove/user_interface/view_models/body_mass_index_calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"BodyMassIndexCalculatorScreen\" Screen", () {
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

    testWidgets("Test If Toolbar Back Button Dispatches Its Events On Tap", (
      tester,
    ) async {
      bool isBackButtonTapped = false;
      final navigator = NavigatorMock((_, _) {}, (_) {
        isBackButtonTapped = true;
      });

      router = Router(navigator);

      await tester.pumpWidget(
        material.MaterialApp(
          home: BodyMassIndexCalculatorScreen(
            bodyMassIndexCalculatorViewModel: bodyMassIndexCalculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.bySemanticsLabel(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .BACK_BUTTON_ACCESSIBILITY_LABEL,
        ),
      );

      expect(isBackButtonTapped, true);
    });

    testWidgets(
      "Test If Toolbar Reset Button Resets Body Mass Index Data On Tap",
      (tester) async {
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
              bodyMassIndexCalculatorViewModel:
                  bodyMassIndexCalculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        await tester.pumpAndSettle();

        expect(
          (tester.widget(find.byType(Input).at(0)) as Input).controller.text,
          ZEROED_HEIGHT.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(1)) as Input).controller.text,
          ZEROED_WEIGHT.toString(),
        );

        expect(
          bodyMassIndexCalculatorViewModel.candidateWeight.value,
          ZEROED_WEIGHT,
        );

        expect(
          bodyMassIndexCalculatorViewModel.candidateHeight.value,
          ZEROED_HEIGHT,
        );

        tester.binding.setSurfaceSize(null);
      },
    );

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Body Mass Index Calculator Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: BodyMassIndexCalculatorScreen(
              bodyMassIndexCalculatorViewModel:
                  bodyMassIndexCalculatorViewModel,
              router: router,
            ),
          ),
        );

        expect(
          tester
              .widget<material.AnimatedScale>(
                find.byType(material.AnimatedScale),
              )
              .scale,
          0,
        );
      },
    );

    testWidgets(
      "Test If Snackbar Recovers Reset Data On Tap And Cancels Snackbar Hiding Timer On Snackbar Is Not Shown",
      (tester) async {
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
              bodyMassIndexCalculatorViewModel:
                  bodyMassIndexCalculatorViewModel,
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
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
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

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        bodyMassIndexCalculatorViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets("Test If Input Widgets Load View Model Data On Init", (
      tester,
    ) async {
      final bodyMassIndexResultPhrase =
          PhraseResolver.getBodyMassIndexResultPhrase(
            NORMAL_BODY_MASS_INDEX,
            deviceLanguageStringsViewModel.deviceLanguageStrings.value,
          );

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

      expect(find.text(NORMAL_WEIGHT_IN_KILOGRAMS.toString()), findsOneWidget);
      expect(
        find.text(NORMAL_HEIGHT_IN_CENTIMETERS.toString()),
        findsOneWidget,
      );
      expect(find.text(bodyMassIndexResultPhrase), findsOneWidget);

      tester.binding.setSurfaceSize(null);
    });

    testWidgets("Test If Height Input Updates Candidate Weight On Change", (
      tester,
    ) async {
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

      await tester.pump();

      final candidateHeight =
          BodyMassIndexCalculatorDataStore.getCandidateHeightValue(
            keyValueDatabase,
          );

      expect(
        find.text(NORMAL_HEIGHT_IN_CENTIMETERS.toString()),
        findsOneWidget,
      );

      expect(
        bodyMassIndexCalculatorViewModel.candidateHeight.value,
        NORMAL_HEIGHT_IN_CENTIMETERS,
      );

      expect(candidateHeight, NORMAL_HEIGHT_IN_CENTIMETERS);
    });

    testWidgets("Test If Weight Input Updates Candidate Weight On Change", (
      tester,
    ) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: BodyMassIndexCalculatorScreen(
            bodyMassIndexCalculatorViewModel: bodyMassIndexCalculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.enterText(
        find.byType(material.TextField).at(1),
        NORMAL_WEIGHT_IN_KILOGRAMS.toString(),
      );

      await tester.pump();

      final candidateWeight = keyValueDatabase.getItem<double>(
        CANDIDATE_WEIGHT_KEY,
        (serializedData) {
          return double.parse(serializedData);
        },
      );

      expect(find.text(NORMAL_WEIGHT_IN_KILOGRAMS.toString()), findsOneWidget);

      expect(
        bodyMassIndexCalculatorViewModel.candidateWeight.value,
        NORMAL_WEIGHT_IN_KILOGRAMS,
      );

      expect(candidateWeight, NORMAL_WEIGHT_IN_KILOGRAMS);
    });

    testWidgets("Test If Calculate Button Dispatches Its Events On Tap", (
      tester,
    ) async {
      final bodyMassIndexResultPhrase =
          PhraseResolver.getBodyMassIndexResultPhrase(
            NORMAL_BODY_MASS_INDEX,
            deviceLanguageStringsViewModel.deviceLanguageStrings.value,
          );

      await tester.binding.setSurfaceSize(FIXED_SCREEN_SIZE);

      bodyMassIndexCalculatorViewModel.setCandidateHeight(
        NORMAL_HEIGHT_IN_CENTIMETERS,
      );
      bodyMassIndexCalculatorViewModel.setCandidateWeight(
        NORMAL_WEIGHT_IN_KILOGRAMS,
      );

      await tester.pumpWidget(
        material.MaterialApp(
          home: BodyMassIndexCalculatorScreen(
            bodyMassIndexCalculatorViewModel: bodyMassIndexCalculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .CALCULATE_BUTTON_TITLE,
        ),
      );

      await tester.pump();

      final candidateCalculatedBodyMassIndex =
          BodyMassIndexCalculatorDataStore.getCalculatedBodyMassIndexValue(
            keyValueDatabase,
          );

      expect(find.text(bodyMassIndexResultPhrase), findsOneWidget);

      expect(
        bodyMassIndexCalculatorViewModel.bodyMassIndex.value.value,
        NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
      );
      expect(
        bodyMassIndexCalculatorViewModel.bodyMassIndex.value.category,
        BodyMassIndexCategory.NORMAL_WEIGHT,
      );

      expect(
        candidateCalculatedBodyMassIndex.value,
        NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
      );
      expect(
        candidateCalculatedBodyMassIndex.category,
        BodyMassIndexCategory.NORMAL_WEIGHT,
      );

      tester.binding.setSurfaceSize(null);
    });
  });
}
