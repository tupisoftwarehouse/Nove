import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/concrete/dark_theme_value_object.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/concrete/light_theme_value_object.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/abstract/theme_value_object.dart";

class ThemeFactory {
  ThemeFactory._();

  static ThemeValueObject getInstance(Brightness currentDeviceTheme) {
    ThemeValueObject theme;

    switch (currentDeviceTheme) {
      case Brightness.light:
        theme = LightThemeValueObject();

        break;

      case Brightness.dark:
        theme = DarkThemeValueObject();

        break;
    }

    return theme;
  }
}
