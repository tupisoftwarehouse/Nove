import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/english_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/french_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/german_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/italian_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/portuguese_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/spanish_strings_value_object.dart";
import "package:nove/user_interface/internals/enums/language.dart";
import "package:nove/dependency_injection/device_language_strings_factory.dart";

void main() {
  group("Test \"DeviceLanguageStringsFactory\" Class", () {
    test(
      "Test If Method \"getInstance\" Returns \"DeviceLanguageStrings\" Of Chosen Language",
      () {
        final englishStringsInstance = DeviceLanguageStringsFactory.getInstance(
          Language.ENGLISH,
        );
        final portugueseStringsInstance =
            DeviceLanguageStringsFactory.getInstance(Language.PORTUGUESE);
        final frenchStringsInstance = DeviceLanguageStringsFactory.getInstance(
          Language.FRENCH,
        );
        final germanStringsInstance = DeviceLanguageStringsFactory.getInstance(
          Language.GERMAN,
        );
        final italianStringsInstance = DeviceLanguageStringsFactory.getInstance(
          Language.ITALIAN,
        );
        final spanishStringsInstance = DeviceLanguageStringsFactory.getInstance(
          Language.SPANISH,
        );

        expect(englishStringsInstance, isA<EnglishStringsValueObject>());
        expect(portugueseStringsInstance, isA<PortugueseStringsValueObject>());
        expect(frenchStringsInstance, isA<FrenchStringsValueObject>());
        expect(germanStringsInstance, isA<GermanStringsValueObject>());
        expect(italianStringsInstance, isA<ItalianStringsValueObject>());
        expect(spanishStringsInstance, isA<SpanishStringsValueObject>());
      },
    );
  });
}
