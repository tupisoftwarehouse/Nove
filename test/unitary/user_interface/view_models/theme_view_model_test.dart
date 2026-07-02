import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/concrete/light_theme_value_object.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

void main() {
  group("Test \"ThemeViewModel\" Class", () {
    late ThemeViewModel themeViewModel;

    test(
      "Test If View Model Initializes Its States With Initial Device Theme And Sets Device Theme Change Observer",
      () {
        bool isDeviceThemeChangeObserverSet = false;

        themeViewModel = ThemeViewModel(APPLICATION_THEME, (_) {
          isDeviceThemeChangeObserverSet = true;
        });

        expect(themeViewModel.theme.value, isA<LightThemeValueObject>());
        expect(isDeviceThemeChangeObserverSet, true);
      },
    );
  });
}
