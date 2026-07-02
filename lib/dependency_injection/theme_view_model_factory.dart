import "package:nove/user_interface/internals/widgets_binding_observers/theme_widgets_binding_observer.dart";
import "package:nove/dependency_injection/theme_factory.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:flutter/widgets.dart";

class ThemeViewModelFactory {
  static ThemeViewModel? _instance;

  ThemeViewModelFactory._();

  static ThemeViewModel getInstance() {
    if (isNull(_instance)) {
      final currentDeviceTheme = ThemeFactory.getInstance(
        WidgetsBinding.instance.platformDispatcher.platformBrightness,
      );

      _instance = ThemeViewModel(currentDeviceTheme, (themeViewModel) {
        final themeWidgetsBindingObserver = ThemeWidgetsBindingObserver(
          themeViewModel,
        );

        WidgetsBinding.instance.addObserver(themeWidgetsBindingObserver);
      });
    }

    return _instance!;
  }
}
