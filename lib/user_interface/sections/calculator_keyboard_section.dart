import "package:flutter/widgets.dart";
import "package:nove/user_interface/compositions/scientific_calculator_keyboard.dart";
import "package:nove/user_interface/compositions/horizontal_calculator_keyboard.dart";
import "package:nove/user_interface/compositions/not_scientific_calculator_keyboard.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class CalculatorKeyboardSection extends StatelessWidget {
  final CalculatorViewModel calculatorViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController expressionInputTextController;

  const CalculatorKeyboardSection({
    super.key,
    required this.calculatorViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.expressionInputTextController,
  });

  @override
  Widget build(BuildContext context) {
    final applicationWindowSize = MediaQuery.of(context).size;
    final applicationWindowOrientation = MediaQuery.of(context).orientation;

    if (isKeyboardScientific(
      applicationWindowOrientation,
      applicationWindowSize.height,
    )) {
      return ScientificCalculatorKeyboard(
        calculatorViewModel: calculatorViewModel,
        deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
        expressionInputTextController: expressionInputTextController,
      );
    } else if (isKeyboardHorizontal(
      applicationWindowOrientation,
      applicationWindowSize.width,
    )) {
      return HorizontalCalculatorKeyboard(
        calculatorViewModel: calculatorViewModel,
        deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
        expressionInputTextController: expressionInputTextController,
      );
    } else {
      return NotScientificCalculatorKeyboard(
        calculatorViewModel: calculatorViewModel,
        deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
        expressionInputTextController: expressionInputTextController,
      );
    }
  }
}
