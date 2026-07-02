import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/english_strings_value_object.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";

void main() {
  group("Test \"DeviceLanguageStringsViewModelFactory\" Class", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test(
      "Test If Method \"getInstance\" Returns \"DeviceLanguageStringsViewModel\" And Sets Device Language Change Observer",
      () {
        final instance = DeviceLanguageStringsViewModelFactory.getInstance();

        expect(
          instance.deviceLanguageStrings.value,
          isA<EnglishStringsValueObject>(),
        );
      },
    );
  });
}
