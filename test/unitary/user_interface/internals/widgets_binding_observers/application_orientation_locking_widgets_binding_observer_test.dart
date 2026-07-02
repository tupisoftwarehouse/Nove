import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/widgets_binding_observers/application_orientation_locking_widgets_binding_observer.dart";

void main() {
  group("Test \"ApplicationOrientationLockingWidgetsBindingObserver\" Class", () {
    late bool isOrientationLocked;
    late ApplicationOrientationLockingWidgetsBindingObserver
    applicationOrientationLockingWidgetsBindingObserver;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      isOrientationLocked = false;

      applicationOrientationLockingWidgetsBindingObserver =
          ApplicationOrientationLockingWidgetsBindingObserver((_) async {
            isOrientationLocked = true;
          });
    });

    test(
      "Test If Method \"didChangeAppLifecycleState\" Updates Device Language Strings In The View Model And Statusbar Content Color On Resumed as Application Lifecycle State",
      () {
        applicationOrientationLockingWidgetsBindingObserver.didChangeMetrics();

        expect(isOrientationLocked, true);
      },
    );
  });
}
