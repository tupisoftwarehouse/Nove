import "package:flutter/widgets.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/enums/language.dart";

class DeviceLanguageRetriever {
  DeviceLanguageRetriever._();

  static Language getCurrentDeviceLanguage() {
    final languageCode =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;

    switch (languageCode) {
      case PORTUGUESE_LANGUAGE_CODE:
        return Language.PORTUGUESE;

      case FRENCH_LANGUAGE_CODE:
        return Language.FRENCH;

      case GERMAN_LANGUAGE_CODE:
        return Language.GERMAN;

      case ITALIAN_LANGUAGE_CODE:
        return Language.ITALIAN;

      case SPANISH_LANGUAGE_CODE:
        return Language.SPANISH;

      default:
        return Language.ENGLISH;
    }
  }
}
