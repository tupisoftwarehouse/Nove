import "package:flutter/material.dart" hide Navigator, Router;
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/compositions/medium_screen_utility_banner_decks.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/adapters/navigator.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"MediumScreenUtilityBannerDecks\" Composition", () {
    late Navigator navigator;
    late Router router;
    late bool isScreenNavigated;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      isScreenNavigated = false;

      navigator = NavigatorMock((_, _) {
        isScreenNavigated = true;
      }, (_) {});

      router = Router(navigator);

      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();
    });

    testWidgets("Test If Area Unit Convert Banner Navigates To Screen On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediumScreenUtilityBannerDecks(
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .AREA_UNIT_CONVERTER_UTILITY_NAME,
        ),
      );

      expect(isScreenNavigated, true);
    });

    testWidgets(
      "Test If Body Mass Index Calculator Banner Navigates To Screen On Tap",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediumScreenUtilityBannerDecks(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .BODY_MASS_INDEX_CALCULATOR_UTILITY_NAME,
          ),
        );

        expect(isScreenNavigated, true);
      },
    );

    testWidgets(
      "Test If Currency Unit Converter Banner Navigates To Screen On Tap",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediumScreenUtilityBannerDecks(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .CURRENCY_UNIT_CONVERTER_UTILITY_NAME,
          ),
        );

        expect(isScreenNavigated, true);
      },
    );

    testWidgets(
      "Test If Length Unit Converter Banner Navigates To Screen On Tap",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediumScreenUtilityBannerDecks(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        );

        await tester.scrollUntilVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .LENGTH_UNIT_CONVERTER_UTILITY_NAME,
          ),
          UTILITY_BANNER_HEIGHT,
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .LENGTH_UNIT_CONVERTER_UTILITY_NAME,
          ),
        );

        expect(isScreenNavigated, true);
      },
    );

    testWidgets(
      "Test If Mass Unit Converter Banner Navigates To Screen On Tap",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediumScreenUtilityBannerDecks(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        );

        await tester.scrollUntilVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .MASS_UNIT_CONVERTER_UTILITY_NAME,
          ),
          UTILITY_BANNER_HEIGHT,
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .MASS_UNIT_CONVERTER_UTILITY_NAME,
          ),
        );

        expect(isScreenNavigated, true);
      },
    );

    testWidgets(
      "Test If Number System Converter Banner Navigates To Screen On Tap",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediumScreenUtilityBannerDecks(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        );

        await tester.scrollUntilVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .NUMBER_SYSTEM_CONVERTER_UTILITY_NAME,
          ),
          UTILITY_BANNER_HEIGHT,
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .NUMBER_SYSTEM_CONVERTER_UTILITY_NAME,
          ),
        );

        expect(isScreenNavigated, true);
      },
    );

    testWidgets(
      "Test If Speed Unit Converter Banner Navigates To Screen On Tap",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediumScreenUtilityBannerDecks(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        );

        await tester.scrollUntilVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .SPEED_UNIT_CONVERTER_UTILITY_NAME,
          ),
          UTILITY_BANNER_HEIGHT,
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .SPEED_UNIT_CONVERTER_UTILITY_NAME,
          ),
        );

        expect(isScreenNavigated, true);
      },
    );

    testWidgets(
      "Test If Temperature Unit Converter Banner Navigates To Screen On Tap",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediumScreenUtilityBannerDecks(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        );

        await tester.scrollUntilVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .TEMPERATURE_UNIT_CONVERTER_UTILITY_NAME,
          ),
          UTILITY_BANNER_HEIGHT,
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .TEMPERATURE_UNIT_CONVERTER_UTILITY_NAME,
          ),
        );

        expect(isScreenNavigated, true);
      },
    );

    testWidgets(
      "Test If Text Information Parser Banner Navigates To Screen On Tap",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediumScreenUtilityBannerDecks(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        );

        await tester.scrollUntilVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .TEXT_INFORMATION_PARSER_UTILITY_NAME,
          ),
          UTILITY_BANNER_HEIGHT,
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .TEXT_INFORMATION_PARSER_UTILITY_NAME,
          ),
        );

        expect(isScreenNavigated, true);
      },
    );

    testWidgets("Test If Time Aggregator Banner Navigates To Screen On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediumScreenUtilityBannerDecks(
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            router: router,
          ),
        ),
      );

      await tester.scrollUntilVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .TIME_AGGREGATOR_UTILITY_NAME,
        ),
        UTILITY_BANNER_HEIGHT,
      );

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .TIME_AGGREGATOR_UTILITY_NAME,
        ),
      );

      expect(isScreenNavigated, true);
    });

    testWidgets("Test If Time Calculator Banner Navigates To Screen On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediumScreenUtilityBannerDecks(
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            router: router,
          ),
        ),
      );

      await tester.scrollUntilVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .TIME_CALCULATOR_UTILITY_NAME,
        ),
        UTILITY_BANNER_HEIGHT,
      );

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .TIME_CALCULATOR_UTILITY_NAME,
        ),
      );

      expect(isScreenNavigated, true);
    });

    testWidgets(
      "Test If Time Unit Converter Banner Navigates To Screen On Tap",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediumScreenUtilityBannerDecks(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        );

        await tester.scrollUntilVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .TIME_UNIT_CONVERTER_UTILITY_NAME,
          ),
          UTILITY_BANNER_HEIGHT,
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .TIME_UNIT_CONVERTER_UTILITY_NAME,
          ),
        );

        expect(isScreenNavigated, true);
      },
    );
  });
}
