import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/abstract/theme_value_object.dart";

class ThemeViewModel {
  final ValueNotifier<ThemeValueObject> theme;

  ThemeViewModel(
    ThemeValueObject currentDeviceTheme,
    void Function(ThemeViewModel themeViewModel) setThemeChangeObserver,
  ) : theme = ValueNotifier<ThemeValueObject>(currentDeviceTheme) {
    setThemeChangeObserver(this);
  }
}
