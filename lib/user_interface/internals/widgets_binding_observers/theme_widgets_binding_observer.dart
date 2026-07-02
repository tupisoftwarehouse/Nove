import "dart:ui";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/transaction_scripts/application_handling/application_theme_synchronizing_transaction_script.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class ThemeWidgetsBindingObserver implements WidgetsBindingObserver {
  final ThemeViewModel _themeViewModel;

  ThemeWidgetsBindingObserver(this._themeViewModel);

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    if (isApplicationResumed(appLifecycleState)) {
      ApplicationThemeSynchronizingTransactionScript.synchronizeApplicationTheme(
        _themeViewModel,
      );
    }
  }

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeLocales(List<Locale>? _) {}

  @override
  void didChangeMetrics() {}

  @override
  void didChangePlatformBrightness() {
    ApplicationThemeSynchronizingTransactionScript.synchronizeApplicationTheme(
      _themeViewModel,
    );
  }

  @override
  void didChangeTextScaleFactor() {}

  @override
  void didHaveMemoryPressure() {}

  @override
  Future<bool> didPopRoute() async {
    return false;
  }

  @override
  Future<bool> didPushRoute(String _) async {
    return false;
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation _) async {
    return false;
  }

  @override
  void didChangeViewFocus(ViewFocusEvent _) {}

  @override
  Future<AppExitResponse> didRequestAppExit() async {
    return AppExitResponse.exit;
  }

  @override
  void handleCancelBackGesture() {}

  @override
  void handleCommitBackGesture() {}

  @override
  bool handleStartBackGesture(PredictiveBackEvent _) {
    return false;
  }

  @override
  void handleUpdateBackGestureProgress(PredictiveBackEvent _) {}

  @override
  void handleStatusBarTap() {}
}
