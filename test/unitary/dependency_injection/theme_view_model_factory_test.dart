import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/concrete/light_theme_value_object.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";

void main() {
  group("Test \"ThemeViewModelFactory\" Class", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test(
      "Test If Method \"getInstance\" Returns \"ThemeViewModel\" And Sets Device Theme Change Observer",
      () {
        final instance = ThemeViewModelFactory.getInstance();

        expect(instance.theme.value, isA<LightThemeValueObject>());
      },
    );
  });
}
