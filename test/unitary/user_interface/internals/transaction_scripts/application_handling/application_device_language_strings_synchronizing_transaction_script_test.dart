import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/application_handling/application_device_language_strings_synchronizing_transaction_script.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

void main() {
  group(
    "Test \"ApplicationDeviceLanguageStringsSynchronizingTransactionScript\" Class",
    () {
      late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

      setUpAll(() {
        TestWidgetsFlutterBinding.ensureInitialized();

        deviceLanguageStringsViewModel =
            DeviceLanguageStringsViewModelFactory.getInstance();
      });

      test(
        "Test If Method \"synchronizeApplicationDeviceLanguageStrings\" Updates DeviceLanguageStrings In The View Model And Statusbar Content Color",
        () {
          ApplicationDeviceLanguageStringsSynchronizingTransactionScript.synchronizeApplicationDeviceLanguageStrings(
            deviceLanguageStringsViewModel,
          );

          expect(
            deviceLanguageStringsViewModel.deviceLanguageStrings.value,
            isA<DeviceLanguageStringsValueObject>(),
          );
        },
      );
    },
  );
}
