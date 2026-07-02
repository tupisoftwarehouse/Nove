import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/adapters/navigator.dart"
    as navigator;

class NavigatorMock extends navigator.Navigator {
  final void Function(BuildContext context, Widget screen) _navigateExecutor;
  final void Function(BuildContext context) _navigateBackExecutor;

  NavigatorMock(this._navigateExecutor, this._navigateBackExecutor);

  @override
  void navigate(BuildContext context, Widget screen) {
    _navigateExecutor(context, screen);
  }

  @override
  void navigateBack(BuildContext context) {
    _navigateBackExecutor(context);
  }
}
