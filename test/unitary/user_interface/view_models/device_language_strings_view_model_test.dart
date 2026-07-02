import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/english_strings_value_object.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

void main() {
  group("Test \"DeviceLanguageStringsViewModel\" Class", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    test(
      "Test If View Model Initializes Its States With Initial Application Language And Sets Device Language Strings Change Observer",
      () {
        bool isDeviceLanguageStringsChangeObserverSet = false;

        deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
          APPLICATION_LANGUAGE,
          (_) {
            isDeviceLanguageStringsChangeObserverSet = true;
          },
        );

        expect(
          deviceLanguageStringsViewModel.deviceLanguageStrings.value,
          isA<EnglishStringsValueObject>(),
        );
        expect(isDeviceLanguageStringsChangeObserverSet, true);
      },
    );
  });
}
