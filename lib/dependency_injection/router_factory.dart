import "package:nove/user_interface/internals/adapters/navigator.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/router/router.dart";

class RouterFactory {
  static Router? _instance;

  RouterFactory._();

  static Router getInstance() {
    if (isNull(_instance)) {
      final navigator = Navigator();

      _instance = Router(navigator);
    }

    return _instance!;
  }
}
