import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/adapters/device_language_retriever.dart";
import "package:nove/user_interface/internals/widgets_binding_observers/device_language_strings_widgets_binding_observer.dart";
import "package:nove/dependency_injection/device_language_strings_factory.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class DeviceLanguageStringsViewModelFactory {
  static DeviceLanguageStringsViewModel? _instance;

  DeviceLanguageStringsViewModelFactory._();

  static DeviceLanguageStringsViewModel getInstance() {
    if (isNull(_instance)) {
      final currentDeviceLanguage =
          DeviceLanguageRetriever.getCurrentDeviceLanguage();
      final currentDeviceLanguageStrings =
          DeviceLanguageStringsFactory.getInstance(currentDeviceLanguage);

      _instance = DeviceLanguageStringsViewModel(currentDeviceLanguageStrings, (
        deviceLanguageStringsViewModel,
      ) {
        final deviceLanguageStringsWidgetsBindingObserver =
            DeviceLanguageStringsWidgetsBindingObserver(
              deviceLanguageStringsViewModel,
            );

        WidgetsBinding.instance.addObserver(
          deviceLanguageStringsWidgetsBindingObserver,
        );
      });
    }

    return _instance!;
  }
}
