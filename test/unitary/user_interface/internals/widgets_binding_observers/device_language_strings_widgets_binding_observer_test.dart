import "dart:ui";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/widgets_binding_observers/device_language_strings_widgets_binding_observer.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

void main() {
  group("Test \"DeviceLanguageStringsWidgetsBindingObserver\" Class", () {
    late DeviceLanguageStringsWidgetsBindingObserver
    deviceLanguageStringsWidgetsBindingObserver;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
        APPLICATION_LANGUAGE,
        (_) {},
      );

      deviceLanguageStringsWidgetsBindingObserver =
          DeviceLanguageStringsWidgetsBindingObserver(
            deviceLanguageStringsViewModel,
          );
    });

    test(
      "Test If Method \"didChangeAppLifecycleState\" Updates Device Language Strings In The View Model And Statusbar Content Color On Resumed as Application Lifecycle State",
      () {
        deviceLanguageStringsWidgetsBindingObserver.didChangeAppLifecycleState(
          AppLifecycleState.resumed,
        );

        expect(
          deviceLanguageStringsViewModel.deviceLanguageStrings.value,
          isA<DeviceLanguageStringsValueObject>(),
        );
      },
    );

    test(
      "Test If Method \"didChangeLocales\" Updates Device Language Strings In The View Model On Device Language Change",
      () {
        deviceLanguageStringsWidgetsBindingObserver.didChangeLocales(null);

        expect(
          deviceLanguageStringsViewModel.deviceLanguageStrings.value,
          isA<DeviceLanguageStringsValueObject>(),
        );
      },
    );
  });
}
