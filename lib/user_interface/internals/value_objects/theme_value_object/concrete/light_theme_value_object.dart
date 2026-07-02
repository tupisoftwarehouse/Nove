import "package:flutter/services.dart";
import "package:flutter/widgets.dart" as widget;
import "package:nove/user_interface/internals/value_objects/widget_style_value_objects/calculator_button_style_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_style_value_objects/input_style_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_style_value_objects/surface_style_value_object.dart";
import "package:nove/user_interface/internals/value_objects/theme_value_object/abstract/theme_value_object.dart";
import "package:nove/user_interface/internals/theme/colors.dart";

class LightThemeValueObject extends ThemeValueObject {
  @override
  final widget.Color textEmphasis1Color = NEUTRALS_100;

  @override
  final widget.Color textEmphasis2Color = NEUTRALS_200;

  @override
  final widget.Color textEmphasis3Color = NEUTRALS_300;

  @override
  final widget.Color textEmphasis4Color = NEUTRALS_400;

  @override
  final widget.Color textEmphasis5Color = NEUTRALS_500;

  @override
  final widget.Color textEmphasis6Color = NEUTRALS_600;

  @override
  final widget.Color textEmphasis7Color = NEUTRALS_700;

  @override
  final widget.Color textEmphasis8Color = NEUTRALS_800;

  @override
  final widget.Color textEmphasis9Color = NEUTRALS_900;

  @override
  final widget.Color iconEmphasis1Color = NEUTRALS_100;

  @override
  final widget.Color iconEmphasis2Color = NEUTRALS_200;

  @override
  final widget.Color iconEmphasis3Color = NEUTRALS_300;

  @override
  final widget.Color iconEmphasis4Color = NEUTRALS_400;

  @override
  final widget.Color iconEmphasis5Color = NEUTRALS_500;

  @override
  final widget.Color iconEmphasis6Color = NEUTRALS_600;

  @override
  final widget.Color iconEmphasis7Color = NEUTRALS_700;

  @override
  final widget.Color iconEmphasis8Color = NEUTRALS_800;

  @override
  final widget.Color iconEmphasis9Color = NEUTRALS_900;

  @override
  final InputStyleValueObject input = InputStyleValueObject(
    NEUTRALS_900,
    NEUTRALS_400,
    NEUTRALS_100,
  );

  @override
  final InputStyleValueObject textArea = InputStyleValueObject(
    NEUTRALS_900,
    NEUTRALS_400,
    TRANSPARENT,
  );

  @override
  final widget.Color selectedIndicatorColor = SECONDARY_300;

  @override
  final widget.Color unselectedIconColor = NEUTRALS_300;

  @override
  final SurfaceStyleValueObject surface = SurfaceStyleValueObject(
    NEUTRALS_50,
    TRANSPARENT,
  );

  @override
  final SurfaceStyleValueObject elevatedSurface = SurfaceStyleValueObject(
    NEUTRALS_50,
    NEUTRALS_300,
  );

  @override
  final widget.Color tapIndicatorColor = NEUTRALS_900;

  @override
  final widget.Color loadingIndicatorColor = PRIMARY_900;

  @override
  final CalculatorButtonStyleValueObject calculatorClearButton =
      CalculatorButtonStyleValueObject(DANGER_600, TRANSPARENT);

  @override
  final CalculatorButtonStyleValueObject calculatorOperatorButton =
      CalculatorButtonStyleValueObject(SECONDARY_600, TRANSPARENT);

  @override
  final CalculatorButtonStyleValueObject calculatorBackspaceButton =
      CalculatorButtonStyleValueObject(WARNING_600, TRANSPARENT);

  @override
  final CalculatorButtonStyleValueObject calculatorNumberButton =
      CalculatorButtonStyleValueObject(NEUTRALS_900, TRANSPARENT);

  @override
  final CalculatorButtonStyleValueObject calculatorEqualButton =
      CalculatorButtonStyleValueObject(NEUTRALS_50, SUCCESS_600);

  @override
  final CalculatorButtonStyleValueObject calculatorResizeButton =
      CalculatorButtonStyleValueObject(INFORMATION_600, TRANSPARENT);

  @override
  final widget.Color navigationBarIndicatorColor = SECONDARY_300;

  @override
  final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: TRANSPARENT,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}
