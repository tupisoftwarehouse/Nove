import "package:nove/user_interface/internals/adapters/device_language_retriever.dart";
import "package:nove/dependency_injection/device_language_strings_factory.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ApplicationDeviceLanguageStringsSynchronizingTransactionScript {
  ApplicationDeviceLanguageStringsSynchronizingTransactionScript._();

  static void synchronizeApplicationDeviceLanguageStrings(
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    final currentDeviceLanguage =
        DeviceLanguageRetriever.getCurrentDeviceLanguage();
    final currentDeviceLanguageStrings =
        DeviceLanguageStringsFactory.getInstance(currentDeviceLanguage);

    deviceLanguageStringsViewModel.deviceLanguageStrings.value =
        currentDeviceLanguageStrings;
  }
}
