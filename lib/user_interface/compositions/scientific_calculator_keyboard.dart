import "package:flutter/widgets.dart";
import "package:nove/domain/calculator/character.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/user_interface/internals/transaction_scripts/calculator_handling/calculator_expression_backspacing_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/calculator_handling/calculator_expression_character_adding_transaction_script.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/character_button.dart";

class ScientificCalculatorKeyboard extends StatefulWidget {
  final CalculatorViewModel calculatorViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController expressionInputTextController;

  const ScientificCalculatorKeyboard({
    super.key,
    required this.calculatorViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.expressionInputTextController,
  });

  @override
  State<StatefulWidget> createState() {
    return _ScientificCalculatorKeyboardState();
  }
}

class _ScientificCalculatorKeyboardState
    extends State<ScientificCalculatorKeyboard> {
  late final ValueNotifier<bool> _isAnimated;

  @override
  void initState() {
    super.initState();

    _isAnimated = ValueNotifier<bool>(false);
  }

  @override
  Widget build(BuildContext _) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ValueListenableBuilder(
        valueListenable:
            widget.deviceLanguageStringsViewModel.deviceLanguageStrings,
        builder: (_, deviceLanguageStrings, _) {
          return LayoutBuilder(
            builder: (_, constraints) {
              return ValueListenableBuilder(
                valueListenable: widget
                    .calculatorViewModel
                    .isScientificCalculatorKeyboardExpanded,
                builder: (_, isCalculatorKeyboardScientific, _) {
                  return ValueListenableBuilder(
                    valueListenable: _isAnimated,
                    builder: (_, isAnimated, _) {
                      return Column(
                        spacing: 8,
                        children: [
                          AnimatedContainer(
                            height:
                                (constraints.maxHeight - 8) *
                                (isCalculatorKeyboardScientific ? (2 / 7) : 0),
                            width: constraints.maxWidth,
                            duration: isAnimated
                                ? AnimationDuration.MEDIUM.value
                                : AnimationDuration.NONE.value,
                            curve: Curves.easeInOutCirc,
                            onEnd: () {
                              _isAnimated.value = false;
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.ROOT,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_ROOT_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.SQUARED_ROOT,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.E,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_E_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.E,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character:
                                              CalculatorCharacter.RECIPROCAL,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_RECIPROCAL_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.RECIPROCAL,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character:
                                              CalculatorCharacter.PERCENTAGE,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_PERCENTAGE_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.PERCENTAGE,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.PI,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_PI_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.PI,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character:
                                              CalculatorCharacter.FACTORIAL,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_FACTORIAL_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.FACTORIAL,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter
                                              .LEFT_PARENTHESIS,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_LEFT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.LEFT_PARENTHESIS,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter
                                              .RIGHT_PARENTHESIS,
                                          accessibilityLabel: "",
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.RIGHT_PARENTHESIS,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            height:
                                (constraints.maxHeight - 8) *
                                (isCalculatorKeyboardScientific ? (5 / 7) : 1),
                            duration: isAnimated
                                ? AnimationDuration.MEDIUM.value
                                : AnimationDuration.NONE.value,
                            curve: isAnimated
                                ? Curves.easeInOutCirc
                                : Curves.linear,
                            onEnd: () {
                              _isAnimated.value = false;
                            },
                            child: Column(
                              spacing: 8,
                              children: [
                                Expanded(
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.CLEAR,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_CLEAR_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap:
                                              widget.calculatorViewModel.clean,
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.POWER,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_POWER_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.POWER,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.DIVIDE,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_DIVIDE_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.DIVIDE,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character:
                                              CalculatorCharacter.BACKSPACE,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_BACKSPACE_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionBackspacingTransactionScript.backspaceExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.SEVEN,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_SEVEN_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.SEVEN,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.EIGHT,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_EIGHT_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.EIGHT,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.NINE,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_NINE_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.NINE,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character:
                                              CalculatorCharacter.MULTIPLY,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_MULTIPLY_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.MULTIPLY,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.FOUR,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_FOUR_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.FOUR,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.FIVE,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_FIVE_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.FIVE,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.SIX,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_SIX_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.SIX,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character:
                                              CalculatorCharacter.SUBTRACT,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_SUBTRACT_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.MINUS,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.ONE,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_ONE_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.ONE,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.TWO,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_TWO_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.TWO,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.THREE,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_THREE_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.THREE,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.ADD,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_ADD_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.PLUS,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Flexible(
                                        child: CharacterButton(
                                          character:
                                              isCalculatorKeyboardScientific
                                              ? CalculatorCharacter
                                                    .SHRINK_KEYBOARD
                                              : CalculatorCharacter
                                                    .EXPAND_KEYBOARD,
                                          accessibilityLabel:
                                              isCalculatorKeyboardScientific
                                              ? deviceLanguageStrings
                                                    .CALCULATOR_SHRINK_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL
                                              : deviceLanguageStrings
                                                    .CALCULATOR_EXPAND_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            _isAnimated.value = true;

                                            widget.calculatorViewModel
                                                .toggleScientificCalculatorKeyboardState();
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.ZERO,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_ZERO_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.ZERO,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.POINT,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_POINT_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: () {
                                            CalculatorExpressionCharacterAddingTransactionScript.addCharacterToExpression(
                                              widget
                                                  .expressionInputTextController,
                                              widget.calculatorViewModel,
                                              Character.POINT,
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: CharacterButton(
                                          character: CalculatorCharacter.EQUAL,
                                          accessibilityLabel: deviceLanguageStrings
                                              .CALCULATOR_EQUALS_BUTTON_ACCESSIBILITY_LABEL,
                                          onTap: widget
                                              .calculatorViewModel
                                              .evaluate,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
