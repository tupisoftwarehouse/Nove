import "package:flutter/material.dart" hide Router;
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/compositions/large_screen_utility_banner_decks.dart";
import "package:nove/user_interface/compositions/medium_screen_utility_banner_decks.dart";
import "package:nove/user_interface/compositions/small_screen_utility_banner_decks.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/sections/utility_banner_deck_sections.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"UtilityBannerDeckSections\" Section", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});

      deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
        APPLICATION_LANGUAGE,
        (_) {},
      );

      router = Router(navigator);
    });

    testWidgets("Test If Composition Is Shown On Its Screen Size", (
      tester,
    ) async {
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(
            size: LARGE_SCREEN_UTILITY_BANNER_DECK_SCREEN_SIZE,
          ),
          child: MaterialApp(
            home: UtilityBannerDeckSections(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        ),
      );

      expect(find.byType(LargeScreenUtilityBannerDecks), findsOneWidget);
      expect(find.byType(MediumScreenUtilityBannerDecks), findsNothing);
      expect(find.byType(SmallScreenUtilityBannerDecks), findsNothing);

      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(
            size: MEDIUM_SCREEN_UTILITY_BANNER_DECK_SCREEN_SIZE,
          ),
          child: MaterialApp(
            home: UtilityBannerDeckSections(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        ),
      );

      expect(find.byType(LargeScreenUtilityBannerDecks), findsNothing);
      expect(find.byType(MediumScreenUtilityBannerDecks), findsOneWidget);
      expect(find.byType(SmallScreenUtilityBannerDecks), findsNothing);

      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(
            size: SMALL_SCREEN_UTILITY_BANNER_DECK_SCREEN_SIZE,
          ),
          child: MaterialApp(
            home: UtilityBannerDeckSections(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              router: router,
            ),
          ),
        ),
      );

      expect(find.byType(LargeScreenUtilityBannerDecks), findsNothing);
      expect(find.byType(MediumScreenUtilityBannerDecks), findsNothing);
      expect(find.byType(SmallScreenUtilityBannerDecks), findsOneWidget);
    });
  });
}
