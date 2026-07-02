import "package:flutter/widgets.dart";
import "package:nove/dependency_injection/theme_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class ApplicationThemeSynchronizingTransactionScript {
  ApplicationThemeSynchronizingTransactionScript._();

  static void synchronizeApplicationTheme(ThemeViewModel themeViewModel) {
    final currentTheme = ThemeFactory.getInstance(
      WidgetsBinding.instance.platformDispatcher.platformBrightness,
    );

    themeViewModel.theme.value = currentTheme;
  }
}
