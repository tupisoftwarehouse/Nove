import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/entities/reference_entity.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/abstract/theme_value_object.dart";
import "package:nove/user_interface/internals/theme/icon_styles.dart";
import "package:nove/user_interface/internals/value_objects/widget_style_value_objects/calculator_button_style_value_object.dart";

class CharacterButtonConfiguringTransactionScript {
  CharacterButtonConfiguringTransactionScript._();

  static void configureButton(
    CalculatorCharacter character,
    ReferenceEntity<Icon?> iconCharacter,
    ReferenceEntity<CalculatorButtonStyleValueObject> buttonStyle,
    ThemeValueObject theme,
    double applicationWindowHeight,
  ) {
    switch (character) {
      case CalculatorCharacter.ADD:
      case CalculatorCharacter.SUBTRACT:
      case CalculatorCharacter.MULTIPLY:
      case CalculatorCharacter.DIVIDE:
      case CalculatorCharacter.POWER:
      case CalculatorCharacter.POINT:
      case CalculatorCharacter.PI:
      case CalculatorCharacter.FACTORIAL:
      case CalculatorCharacter.LEFT_PARENTHESIS:
      case CalculatorCharacter.RIGHT_PARENTHESIS:
      case CalculatorCharacter.ROOT:
      case CalculatorCharacter.E:
      case CalculatorCharacter.RECIPROCAL:
      case CalculatorCharacter.PERCENTAGE:
        buttonStyle.value = theme.calculatorOperatorButton;

        break;
      case CalculatorCharacter.ZERO:
      case CalculatorCharacter.ONE:
      case CalculatorCharacter.TWO:
      case CalculatorCharacter.THREE:
      case CalculatorCharacter.FOUR:
      case CalculatorCharacter.FIVE:
      case CalculatorCharacter.SIX:
      case CalculatorCharacter.SEVEN:
      case CalculatorCharacter.EIGHT:
      case CalculatorCharacter.NINE:
        buttonStyle.value = theme.calculatorNumberButton;

        break;
      case CalculatorCharacter.EQUAL:
        buttonStyle.value = theme.calculatorEqualButton;

        break;
      case CalculatorCharacter.CLEAR:
        buttonStyle.value = theme.calculatorClearButton;

        break;
      case CalculatorCharacter.BACKSPACE:
        buttonStyle.value = theme.calculatorBackspaceButton;

        iconCharacter.value = isKeyboardCharacterSmall(applicationWindowHeight)
            ? HEADING_5_ICON(
                Symbols.backspace_rounded,
                buttonStyle.value.characterColor,
              )
            : HEADING_4_ICON(
                Symbols.backspace_rounded,
                buttonStyle.value.characterColor,
              );

        break;
      case CalculatorCharacter.EXPAND_KEYBOARD:
        buttonStyle.value = theme.calculatorResizeButton;

        iconCharacter.value = isKeyboardCharacterSmall(applicationWindowHeight)
            ? HEADING_5_ICON(
                Symbols.arrows_output_rounded,
                buttonStyle.value.characterColor,
              )
            : HEADING_4_ICON(
                Symbols.arrows_output_rounded,
                buttonStyle.value.characterColor,
              );

        break;
      case CalculatorCharacter.SHRINK_KEYBOARD:
        buttonStyle.value = theme.calculatorResizeButton;

        iconCharacter.value = isKeyboardCharacterSmall(applicationWindowHeight)
            ? HEADING_5_ICON(
                Symbols.arrows_input_rounded,
                buttonStyle.value.characterColor,
              )
            : HEADING_4_ICON(
                Symbols.arrows_input_rounded,
                buttonStyle.value.characterColor,
              );

        break;
    }
  }
}
