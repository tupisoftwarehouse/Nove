import "dart:async";
import "dart:ui";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/transaction_scripts/application_handling/application_orientation_locking_transaction_script.dart";

class ApplicationOrientationLockingWidgetsBindingObserver
    implements WidgetsBindingObserver {
  double _previousApplicationWindowHeight = 0;
  double _previousApplicationWindowWidth = 0;
  final Future<void> Function(
    List<DeviceOrientation> applicationWindowOrientations,
  )
  _lockApplicationWindowOrientation;

  ApplicationOrientationLockingWidgetsBindingObserver(
    this._lockApplicationWindowOrientation,
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState _) {}

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeLocales(List<Locale>? _) {}

  @override
  void didChangeMetrics() {
    final applicationWindow =
        WidgetsBinding.instance.platformDispatcher.views.first;
    final applicationWindowSize =
        applicationWindow.physicalSize / applicationWindow.devicePixelRatio;
    final currentApplicationWindowHeight = applicationWindowSize.height;
    final currentApplicationWindowWidth = applicationWindowSize.width;
    final applicationWindowOrientation =
        isApplicationWindowPortrait(
          currentApplicationWindowHeight,
          currentApplicationWindowWidth,
        )
        ? Orientation.portrait
        : Orientation.landscape;

    unawaited(
      ApplicationOrientationLockingTransactionScript.lockApplicationWindowOrientation(
        currentApplicationWindowHeight,
        _previousApplicationWindowHeight,
        currentApplicationWindowWidth,
        _previousApplicationWindowWidth,
        applicationWindowOrientation,
        _lockApplicationWindowOrientation,
      ),
    );

    _previousApplicationWindowWidth = currentApplicationWindowWidth;
    _previousApplicationWindowHeight = currentApplicationWindowHeight;
  }

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
