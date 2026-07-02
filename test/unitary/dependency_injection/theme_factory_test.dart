import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/concrete/dark_theme_value_object.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/concrete/light_theme_value_object.dart";
import "package:nove/dependency_injection/theme_factory.dart";

void main() {
  group("Test \"ThemeFactory\" Class", () {
    test(
      "Test If Method \"getInstance\" Returns \"ThemeValueObject\" Of Chosen Theme",
      () {
        final lightThemeInstance = ThemeFactory.getInstance(Brightness.light);
        final darkThemeInstance = ThemeFactory.getInstance(Brightness.dark);

        expect(lightThemeInstance, isA<LightThemeValueObject>());
        expect(darkThemeInstance, isA<DarkThemeValueObject>());
      },
    );
  });
}
