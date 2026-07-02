import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class ListOfMeasureUnitInputDataUpdatingTransactionScript {
  ListOfMeasureUnitInputDataUpdatingTransactionScript._();

  static void updateListOfMeasureUnitInputData<T, U>(
    ValueNotifier<List<U>> listOfMeasureUnitInputs,
    ValueNotifier<List<T>> listOfMeasureUnits,
    int baseMeasureUnitIndex,
    U Function(
      int measureUnitInputIndex,
      TextEditingController controller,
      FocusNode focusNode,
    )
    getMeasureUnitInput,
  ) {
    final updatedListOfMeasureUnitInputs = <U>[];

    for (
      var measureUnitInputIndex = 0;
      measureUnitInputIndex < listOfMeasureUnits.value.length;
      measureUnitInputIndex++
    ) {
      late final U updatedMeasureUnitInput;
      late final TextEditingController outdatedController;
      late final TextEditingController updatedController;
      late final TextSelection updatedControllerSelection;
      late final FocusNode focusNode;
      late final int constrainedBaseOffsetBasedOnTextLength;
      late final int constrainedExtentOffsetBasedOnTextLength;

      if (isMeasureUnitInputNotTheBase(
        measureUnitInputIndex,
        baseMeasureUnitIndex,
      )) {
        outdatedController =
            (listOfMeasureUnitInputs.value[measureUnitInputIndex] as dynamic)
                    .controller
                as TextEditingController;
        updatedController = TextEditingController.fromValue(
          outdatedController.value,
        );
        updatedControllerSelection = updatedController.selection;

        updatedController.text =
            (listOfMeasureUnits.value[measureUnitInputIndex] as dynamic).value;

        constrainedBaseOffsetBasedOnTextLength = updatedControllerSelection
            .baseOffset
            .clamp(0, updatedController.text.length);
        constrainedExtentOffsetBasedOnTextLength = updatedControllerSelection
            .extentOffset
            .clamp(0, updatedController.text.length);

        updatedController.selection = TextSelection(
          baseOffset: constrainedBaseOffsetBasedOnTextLength,
          extentOffset: constrainedExtentOffsetBasedOnTextLength,
        );

        focusNode =
            (listOfMeasureUnitInputs.value[measureUnitInputIndex] as dynamic)
                .focusNode;

        updatedMeasureUnitInput = getMeasureUnitInput(
          measureUnitInputIndex,
          updatedController,
          focusNode,
        );

        updatedListOfMeasureUnitInputs.add(updatedMeasureUnitInput);
      } else {
        updatedListOfMeasureUnitInputs.add(
          listOfMeasureUnitInputs.value[measureUnitInputIndex],
        );
      }
    }

    listOfMeasureUnitInputs.value = [...updatedListOfMeasureUnitInputs];
  }
}
