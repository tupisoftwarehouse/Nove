import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";

class DeviceLanguageStringsViewModel {
  final ValueNotifier<DeviceLanguageStringsValueObject> deviceLanguageStrings;

  DeviceLanguageStringsViewModel(
    DeviceLanguageStringsValueObject currentDeviceLanguageStrings,
    void Function(DeviceLanguageStringsViewModel deviceLanguageStringsViewModel)
    setDeviceLanguageStringsChangeObserver,
  ) : deviceLanguageStrings = ValueNotifier<DeviceLanguageStringsValueObject>(
        currentDeviceLanguageStrings,
      ) {
    setDeviceLanguageStringsChangeObserver(this);
  }
}
