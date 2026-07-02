import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/entities/reference_entity.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/user_interface/internals/theme/icon_styles.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/character_button_configuring_transaction_script.dart";
import "package:nove/user_interface/internals/value_objects/widget_style_value_objects/calculator_button_style_value_object.dart";

void main() {
  group("Test \"CharacterButtonConfiguringTransactionScript\" Class", () {
    late ReferenceEntity<Icon?> iconCharacter;
    late ReferenceEntity<CalculatorButtonStyleValueObject> buttonStyle;

    setUp(() {
      iconCharacter = ReferenceEntity<Icon?>();

      buttonStyle = ReferenceEntity<CalculatorButtonStyleValueObject>();
    });

    test(
      "Test If Method \"configureButton\" Configures Operator Button Style",
      () {
        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.ADD,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.SUBTRACT,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.MULTIPLY,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.DIVIDE,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.POWER,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.POINT,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.PI,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.FACTORIAL,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.LEFT_PARENTHESIS,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.RIGHT_PARENTHESIS,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.ROOT,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.E,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.RECIPROCAL,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.PERCENTAGE,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorOperatorButton);
      },
    );

    test(
      "Test If Method \"configureButton\" Configures Number Button Style",
      () {
        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.ZERO,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.ONE,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.TWO,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.THREE,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.FOUR,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.FIVE,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.SIX,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.SEVEN,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.EIGHT,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.NINE,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorNumberButton);
      },
    );

    test(
      "Test If Method \"configureButton\" Configures Equal Button Style",
      () {
        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.EQUAL,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorEqualButton);
      },
    );

    test(
      "Test If Method \"configureButton\" Configures Clear Button Style",
      () {
        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.CLEAR,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorClearButton);
      },
    );

    test(
      "Test If Method \"configureButton\" Configures Backspace Button Icon And Style",
      () {
        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.BACKSPACE,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorBackspaceButton);
        expect(iconCharacter.value!.icon, Symbols.backspace_rounded);
        expect(
          iconCharacter.value!.size,
          HEADING_4_ICON(
            Symbols.backspace_rounded,
            APPLICATION_THEME.calculatorBackspaceButton.characterColor,
          ).size,
        );

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.BACKSPACE,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT - 1,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorBackspaceButton);
        expect(iconCharacter.value!.icon, Symbols.backspace_rounded);
        expect(
          iconCharacter.value!.size,
          HEADING_5_ICON(
            Symbols.backspace_rounded,
            APPLICATION_THEME.calculatorBackspaceButton.characterColor,
          ).size,
        );
      },
    );

    test(
      "Test If Method \"configureButton\" Configures Expand Keyboard Button Icon And Style",
      () {
        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.EXPAND_KEYBOARD,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorResizeButton);
        expect(iconCharacter.value!.icon, Symbols.arrows_output_rounded);
        expect(
          iconCharacter.value!.size,
          HEADING_4_ICON(
            Symbols.arrows_output_rounded,
            APPLICATION_THEME.calculatorResizeButton.characterColor,
          ).size,
        );

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.EXPAND_KEYBOARD,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT - 1,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorResizeButton);
        expect(iconCharacter.value!.icon, Symbols.arrows_output_rounded);
        expect(
          iconCharacter.value!.size,
          HEADING_5_ICON(
            Symbols.arrows_output_rounded,
            APPLICATION_THEME.calculatorResizeButton.characterColor,
          ).size,
        );
      },
    );

    test(
      "Test If Method \"configureButton\" Configures Shrink Keyboard Button Icon And Style",
      () {
        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.SHRINK_KEYBOARD,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorResizeButton);
        expect(iconCharacter.value!.icon, Symbols.arrows_input_rounded);
        expect(
          iconCharacter.value!.size,
          HEADING_4_ICON(
            Symbols.arrows_input_rounded,
            APPLICATION_THEME.calculatorResizeButton.characterColor,
          ).size,
        );

        CharacterButtonConfiguringTransactionScript.configureButton(
          CalculatorCharacter.SHRINK_KEYBOARD,
          iconCharacter,
          buttonStyle,
          APPLICATION_THEME,
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT - 1,
        );

        expect(buttonStyle.value, APPLICATION_THEME.calculatorResizeButton);
        expect(iconCharacter.value!.icon, Symbols.arrows_input_rounded);
        expect(
          iconCharacter.value!.size,
          HEADING_5_ICON(
            Symbols.arrows_input_rounded,
            APPLICATION_THEME.calculatorResizeButton.characterColor,
          ).size,
        );
      },
    );
  });
}
