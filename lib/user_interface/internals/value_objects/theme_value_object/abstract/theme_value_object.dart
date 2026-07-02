import "package:flutter/services.dart";
import "package:flutter/widgets.dart" as widget;
import "package:nove/user_interface/internals/value_objects/widget_style_value_objects/calculator_button_style_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_style_value_objects/input_style_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_style_value_objects/surface_style_value_object.dart";

abstract class ThemeValueObject {
  abstract final widget.Color textEmphasis1Color;

  abstract final widget.Color textEmphasis2Color;

  abstract final widget.Color textEmphasis3Color;

  abstract final widget.Color textEmphasis4Color;

  abstract final widget.Color textEmphasis5Color;

  abstract final widget.Color textEmphasis6Color;

  abstract final widget.Color textEmphasis7Color;

  abstract final widget.Color textEmphasis8Color;

  abstract final widget.Color textEmphasis9Color;

  abstract final widget.Color iconEmphasis1Color;

  abstract final widget.Color iconEmphasis2Color;

  abstract final widget.Color iconEmphasis3Color;

  abstract final widget.Color iconEmphasis4Color;

  abstract final widget.Color iconEmphasis5Color;

  abstract final widget.Color iconEmphasis6Color;

  abstract final widget.Color iconEmphasis7Color;

  abstract final widget.Color iconEmphasis8Color;

  abstract final widget.Color iconEmphasis9Color;

  abstract final InputStyleValueObject input;

  abstract final InputStyleValueObject textArea;

  abstract final widget.Color selectedIndicatorColor;

  abstract final widget.Color unselectedIconColor;

  abstract final SurfaceStyleValueObject surface;

  abstract final SurfaceStyleValueObject elevatedSurface;

  abstract final widget.Color tapIndicatorColor;

  abstract final widget.Color loadingIndicatorColor;

  abstract final CalculatorButtonStyleValueObject calculatorClearButton;

  abstract final CalculatorButtonStyleValueObject calculatorOperatorButton;

  abstract final CalculatorButtonStyleValueObject calculatorBackspaceButton;

  abstract final CalculatorButtonStyleValueObject calculatorNumberButton;

  abstract final CalculatorButtonStyleValueObject calculatorEqualButton;

  abstract final CalculatorButtonStyleValueObject calculatorResizeButton;

  abstract final widget.Color navigationBarIndicatorColor;

  abstract final SystemUiOverlayStyle systemUiOverlayStyle;
}
