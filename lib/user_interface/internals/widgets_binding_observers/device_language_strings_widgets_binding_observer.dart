import "dart:ui";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/application_handling/application_device_language_strings_synchronizing_transaction_script.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class DeviceLanguageStringsWidgetsBindingObserver
    implements WidgetsBindingObserver {
  final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;

  DeviceLanguageStringsWidgetsBindingObserver(
    this._deviceLanguageStringsViewModel,
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    ApplicationDeviceLanguageStringsSynchronizingTransactionScript.synchronizeApplicationDeviceLanguageStrings(
      _deviceLanguageStringsViewModel,
    );
  }

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeLocales(List<Locale>? _) {
    ApplicationDeviceLanguageStringsSynchronizingTransactionScript.synchronizeApplicationDeviceLanguageStrings(
      _deviceLanguageStringsViewModel,
    );
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
