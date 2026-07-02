import "dart:async";
import "package:flutter/widgets.dart";

class SnackbarHiddenTimerCancellingListenerSettingTransactionScript {
  SnackbarHiddenTimerCancellingListenerSettingTransactionScript._();

  static void setSnackbarHiddenTimerCancellingListener(
    ValueNotifier<bool> isSnackbarShown,
    Timer? snackbarHidingTimer,
  ) {
    isSnackbarShown.addListener(() {
      if (!isSnackbarShown.value) {
        snackbarHidingTimer?.cancel();
      }
    });
  }
}
