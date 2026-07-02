import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/expression_history_closing_transaction_script.dart";

void main() {
  group("Test \"ExpressionHistoryClosingTransactionScript\" Class", () {
    test(
      "Test If Method \"closeExpressionHistory\" Makes Viewfinder Animated And Closes Expression History",
      () {
        final isExpressionHistoryOpened = ValueNotifier<bool>(true);
        final isViewfinderAnimated = ValueNotifier<bool>(false);

        ExpressionHistoryClosingTransactionScript.closeExpressionHistory(
          isExpressionHistoryOpened,
          isViewfinderAnimated,
        );

        expect(isExpressionHistoryOpened.value, false);
        expect(isViewfinderAnimated.value, true);
      },
    );
  });
}
