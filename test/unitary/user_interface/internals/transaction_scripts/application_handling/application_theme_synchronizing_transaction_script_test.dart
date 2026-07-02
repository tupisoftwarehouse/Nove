import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/abstract/theme_value_object.dart";
import "package:nove/user_interface/internals/transaction_scripts/application_handling/application_theme_synchronizing_transaction_script.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

void main() {
  group("Test \"ApplicationThemeSynchronizingTransactionScript\" Class", () {
    late ThemeViewModel themeViewModel;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      themeViewModel = ThemeViewModel(APPLICATION_THEME, (_) {});
    });

    test(
      "Test If Method \"synchronizeApplicationTheme\" Updates Theme In The View Model",
      () {
        ApplicationThemeSynchronizingTransactionScript.synchronizeApplicationTheme(
          themeViewModel,
        );

        expect(themeViewModel.theme.value, isA<ThemeValueObject>());
      },
    );
  });
}
