import "package:flutter/widgets.dart";

class TimeAggregatorInputControllerHolderValueObject {
  final TextEditingController timeHourInputController;
  final TextEditingController timeMinuteInputController;
  final TextEditingController timeSecondInputController;

  TimeAggregatorInputControllerHolderValueObject(
    this.timeHourInputController,
    this.timeMinuteInputController,
    this.timeSecondInputController,
  );
}
