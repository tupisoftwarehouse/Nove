import "package:flutter_test/flutter_test.dart";
import "package:flutter/widgets.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/widgets_binding_observers/theme_widgets_binding_observer.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/abstract/theme_value_object.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

void main() {
  group("Test \"ThemeWidgetsBindingObserver\" Class", () {
    late ThemeWidgetsBindingObserver themeWidgetsBindingObserver;
    late ThemeViewModel themeViewModel;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      themeViewModel = ThemeViewModel(APPLICATION_THEME, (_) {});

      themeWidgetsBindingObserver = ThemeWidgetsBindingObserver(themeViewModel);
    });

    test(
      "Test If Method \"didChangeAppLifecycleState\" Updates Theme In The View Model On Resumed as Application Lifecycle State",
      () {
        themeWidgetsBindingObserver.didChangeAppLifecycleState(
          AppLifecycleState.resumed,
        );

        expect(themeViewModel.theme.value, isA<ThemeValueObject>());
      },
    );

    test(
      "Test If Method \"didChangePlatformBrightness\" Updates Theme In The View Model On Device Theme Change",
      () {
        themeWidgetsBindingObserver.didChangePlatformBrightness();

        expect(themeViewModel.theme.value, isA<ThemeValueObject>());
      },
    );
  });
}
