import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/english_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/french_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/german_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/italian_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/portuguese_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/spanish_strings_value_object.dart";
import "package:nove/user_interface/internals/enums/language.dart";

class DeviceLanguageStringsFactory {
  DeviceLanguageStringsFactory._();

  static DeviceLanguageStringsValueObject getInstance(
    Language currentDeviceLanguage,
  ) {
    DeviceLanguageStringsValueObject deviceLanguageStrings;

    switch (currentDeviceLanguage) {
      case Language.ENGLISH:
        deviceLanguageStrings = EnglishStringsValueObject();

        break;

      case Language.PORTUGUESE:
        deviceLanguageStrings = PortugueseStringsValueObject();

        break;

      case Language.FRENCH:
        deviceLanguageStrings = FrenchStringsValueObject();

        break;

      case Language.GERMAN:
        deviceLanguageStrings = GermanStringsValueObject();

        break;

      case Language.ITALIAN:
        deviceLanguageStrings = ItalianStringsValueObject();

        break;

      case Language.SPANISH:
        deviceLanguageStrings = SpanishStringsValueObject();

        break;
    }

    return deviceLanguageStrings;
  }
}
