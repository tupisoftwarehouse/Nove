import "dart:async";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";

class SnackbarHiddenTimerStartingTransactionScript {
  SnackbarHiddenTimerStartingTransactionScript._();

  static void startSnackbarHiddenTimer(
    Timer? snackbarHidingTimer,
    ValueNotifier<bool> isSnackbarShown,
  ) {
    snackbarHidingTimer = Timer(AnimationDuration.LONG.value, () {
      isSnackbarShown.value = false;
    });
  }
}
