import "dart:async";
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_starting_transaction_script.dart";
import "package:fake_async/fake_async.dart";

void main() {
  group("Test \"SnackbarHiddenTimerStartingTransactionScript\" Class", () {
    late final ValueNotifier<bool> isSnackbarShown;
    Timer? snackbarHidingTimer;

    setUpAll(() {
      isSnackbarShown = ValueNotifier(true);
    });

    test(
      "Test If Method \"setSnackbarHiddenTimerListener\" Cancels Snackbar Hidden Timer If Snackbar Is Not Shown",
      () {
        fakeAsync((async) {
          SnackbarHiddenTimerStartingTransactionScript.startSnackbarHiddenTimer(
            snackbarHidingTimer,
            isSnackbarShown,
          );

          async.elapse(AnimationDuration.LONG.value);

          expect(isSnackbarShown.value, false);
        });
      },
    );
  });
}
