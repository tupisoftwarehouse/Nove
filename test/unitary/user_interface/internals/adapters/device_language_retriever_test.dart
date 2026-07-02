import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/adapters/device_language_retriever.dart";
import "package:nove/user_interface/internals/enums/language.dart";
import "dart:ui";

void main() {
  group("Test \"DeviceLanguageRetriever\" Class", () {
    testWidgets(
      "Test If Method \"getCurrentDeviceLanguage\" Returns Current Device Language",
      (tester) async {
        tester.binding.platformDispatcher.localeTestValue = const Locale(
          PORTUGUESE_LANGUAGE_CODE,
        );

        final portugueseAsCurrentDeviceLanguage =
            DeviceLanguageRetriever.getCurrentDeviceLanguage();

        expect(portugueseAsCurrentDeviceLanguage, Language.PORTUGUESE);

        tester.binding.platformDispatcher.localeTestValue = const Locale(
          ENGLISH_LANGUAGE_CODE,
        );

        final englishAsCurrentDeviceLanguage =
            DeviceLanguageRetriever.getCurrentDeviceLanguage();

        expect(englishAsCurrentDeviceLanguage, Language.ENGLISH);

        tester.binding.platformDispatcher.localeTestValue = const Locale(
          FRENCH_LANGUAGE_CODE,
        );

        final frenchAsCurrentDeviceLanguage =
            DeviceLanguageRetriever.getCurrentDeviceLanguage();

        expect(frenchAsCurrentDeviceLanguage, Language.FRENCH);

        tester.binding.platformDispatcher.localeTestValue = const Locale(
          GERMAN_LANGUAGE_CODE,
        );

        final germanAsCurrentDeviceLanguage =
            DeviceLanguageRetriever.getCurrentDeviceLanguage();

        expect(germanAsCurrentDeviceLanguage, Language.GERMAN);

        tester.binding.platformDispatcher.localeTestValue = const Locale(
          ITALIAN_LANGUAGE_CODE,
        );

        final italianAsCurrentDeviceLanguage =
            DeviceLanguageRetriever.getCurrentDeviceLanguage();

        expect(italianAsCurrentDeviceLanguage, Language.ITALIAN);

        tester.binding.platformDispatcher.localeTestValue = const Locale(
          SPANISH_LANGUAGE_CODE,
        );

        final spanishAsCurrentDeviceLanguage =
            DeviceLanguageRetriever.getCurrentDeviceLanguage();

        expect(spanishAsCurrentDeviceLanguage, Language.SPANISH);
      },
    );
  });
}
