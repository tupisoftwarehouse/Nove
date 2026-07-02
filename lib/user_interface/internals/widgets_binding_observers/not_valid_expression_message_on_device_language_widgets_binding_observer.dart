import "dart:ui";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";

class NotValidExpressionMessageOnDeviceLanguageWidgetsBindingObserver
    implements WidgetsBindingObserver {
  final CalculatorViewModel _calculatorViewModel;

  NotValidExpressionMessageOnDeviceLanguageWidgetsBindingObserver(
    this._calculatorViewModel,
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    _calculatorViewModel
        .setExpressionToNoValidExpressionMessageOnDeviceLanguage();
  }

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeLocales(List<Locale>? _) {
    _calculatorViewModel
        .setExpressionToNoValidExpressionMessageOnDeviceLanguage();
  }

  @override
  void didChangeMetrics() {}

  @override
  void didChangePlatformBrightness() {}

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
