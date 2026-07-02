import "package:flutter/widgets.dart";

class ExpressionHistoryClosingTransactionScript {
  ExpressionHistoryClosingTransactionScript._();

  static void closeExpressionHistory(
    ValueNotifier<bool> isExpressionHistoryOpened,
    ValueNotifier<bool> isViewfinderAnimated,
  ) {
    isViewfinderAnimated.value = true;

    isExpressionHistoryOpened.value = false;
  }
}
