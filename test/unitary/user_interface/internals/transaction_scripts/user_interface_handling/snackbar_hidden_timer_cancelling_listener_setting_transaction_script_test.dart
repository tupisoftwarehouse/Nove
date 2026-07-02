import "dart:async";
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_cancelling_listener_setting_transaction_script.dart";

void main() {
  group("Test \"SnackbarHiddenTimerListenerSettingTransactionScript\" Class", () {
    late final ValueNotifier<bool> isSnackbarShown;
    late Timer snackbarHidingTimer;

    setUpAll(() {
      isSnackbarShown = ValueNotifier(true);
      snackbarHidingTimer = Timer(Duration.zero, () {});
    });

    test(
      "Test If Method \"setSnackbarHiddenTimerListener\" Cancels Snackbar Hidden Timer If Snackbar Is Not Shown",
      () {
        SnackbarHiddenTimerCancellingListenerSettingTransactionScript.setSnackbarHiddenTimerCancellingListener(
          isSnackbarShown,
          snackbarHidingTimer,
        );

        isSnackbarShown.value = false;

        expect(snackbarHidingTimer.isActive, false);
      },
    );
  });
}
