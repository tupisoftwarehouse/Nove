import "package:flutter/widgets.dart";

class ListOfMeasureUnitInputDataLoadingTransactionScript {
  ListOfMeasureUnitInputDataLoadingTransactionScript._();

  static void loadListOfMeasureUnitInputData<T, U>(
    ValueNotifier<List<U>> listOfMeasureUnitInputs,
    ValueNotifier<List<T>> listOfMeasureUnits,
    Widget Function(
      int measureUnitInputIndex,
      TextEditingController controller,
      FocusNode focusNode,
    )
    getMeasureUnitInput,
  ) {
    final updatedListOfMeasureUnitInputs = <U>[];

    listOfMeasureUnitInputs.value = [];

    for (
      var measureUnitInputIndex = 0;
      measureUnitInputIndex < listOfMeasureUnits.value.length;
      measureUnitInputIndex++
    ) {
      final controller = TextEditingController(
        text:
            (listOfMeasureUnits.value[measureUnitInputIndex] as dynamic).value,
      );
      final focusNode = FocusNode();

      final updatedMeasureUnitInput = getMeasureUnitInput(
        measureUnitInputIndex,
        controller,
        focusNode,
      );

      updatedListOfMeasureUnitInputs.add(updatedMeasureUnitInput as U);
    }

    listOfMeasureUnitInputs.value = updatedListOfMeasureUnitInputs;
  }
}
