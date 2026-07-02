import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/internals/entities/reference_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/character_button_configuring_transaction_script.dart";
import "package:nove/user_interface/internals/value_objects/widget_style_value_objects/calculator_button_style_value_object.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class CharacterButton extends StatefulWidget {
  final CalculatorCharacter character;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const CharacterButton({
    super.key,
    required this.character,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _CharacterButtonState();
  }
}

class _CharacterButtonState extends State<CharacterButton> {
  late final ThemeViewModel _themeViewModel;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final applicationWindowSize = MediaQuery.of(context).size;
    final iconCharacter = ReferenceEntity<Icon?>()..value = null;
    final buttonStyle = ReferenceEntity<CalculatorButtonStyleValueObject>();

    CharacterButtonConfiguringTransactionScript.configureButton(
      widget.character,
      iconCharacter,
      buttonStyle,
      _themeViewModel.theme.value,
      applicationWindowSize.height,
    );

    return ValueListenableBuilder(
      valueListenable: _themeViewModel.theme,
      builder: (_, theme, _) {
        return Semantics(
          button: true,
          label: widget.accessibilityLabel,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              isKeyboardCharacterSmall(applicationWindowSize.height) ? 9 : 13,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: buttonStyle.value.backgroundColor,
              ),
              child: TapIndicator(
                indicatorColor: theme.tapIndicatorColor,
                isHapticFeedbackEnabled: true,
                onTap: widget.onTap,
                child: Center(
                  child: SelectionContainer.disabled(
                    child:
                        iconCharacter.value ??
                        Text(
                          widget.character.value,
                          maxLines: 1,
                          style:
                              isKeyboardCharacterSmall(
                                applicationWindowSize.height,
                              )
                              ? HEADING_5(buttonStyle.value.characterColor)
                              : HEADING_4(buttonStyle.value.characterColor),
                        ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return SizedBox(
    height: 90,
    width: 90,
    child: CharacterButton(
      character: CalculatorCharacter.EQUAL,
      accessibilityLabel: "",
      onTap: () {},
    ),
  );
}
