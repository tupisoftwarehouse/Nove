import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";

class SpanishStringsValueObject extends DeviceLanguageStringsValueObject {
  @override
  final String NOT_VALID_EXPRESSION_ERROR_MESSAGE =
      "Error: la expresión no es válida";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_NAME = "Conversor de superficie";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al conversor de superficie";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_NAME =
      "Calculadora de índice de masa corporal";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir a la calculadora de índice de masa corporal";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_NAME = "Conversor de divisas";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al conversor de divisas";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_NAME = "Conversor de masa";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al conversor de masa";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_NAME =
      "Conversor de sistemas numéricos";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al conversor de sistemas numéricos";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_NAME = "Conversor de velocidad";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al conversor de velocidad";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_NAME =
      "Conversor de temperatura";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al conversor de temperatura";

  @override
  final String TIME_AGGREGATOR_UTILITY_NAME = "Agregador de tiempo";

  @override
  final String TIME_AGGREGATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al agregador de tiempo";

  @override
  final String TIME_CALCULATOR_UTILITY_NAME = "Calculadora de tiempo";

  @override
  final String TIME_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir a la calculadora de tiempo";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_NAME = "Conversor de tiempo";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al conversor de tiempo";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_NAME = "Conversor de longitud";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al conversor de longitud";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_NAME =
      "Analizador de información de texto";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Abrir historial";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Abrir historial de expresiones";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Cerrar historial";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Cerrar historial de expresiones";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir al analizador de información de texto";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Mostrar página de la calculadora";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Mostrar página de utilidades";

  @override
  String SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(String unitName) {
    return "Seleccionar \"$unitName\" como unidad base";
  }

  @override
  String SELECT_UNIT_ELEMENT_TOOLTIP_MESSAGE(String unitName) {
    return "Seleccionar $unitName como base";
  }

  @override
  final String REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE = "Eliminar unidad";

  @override
  final String REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL =
      "Eliminar unidad de medida";

  @override
  final String ADD_UNIT_BUTTON_ACCESSIBILITY_LABEL = "Añadir unidad de medida";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_TITLE = "Calculadora";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_TITLE = "Utilidades";

  @override
  final String ADD_UNIT_BUTTON_TOOLTIP_MESSAGE = "Añadir unidad";

  @override
  final String CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE = "Resultado";

  @override
  final String LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_TITLE = "Historial";

  @override
  String TEXT_INFORMATION_BREAKDOWN(String amountOfWords, String length) {
    return "$amountOfWords palabras y $length caracteres";
  }

  @override
  final String BACK_BUTTON_ACCESSIBILITY_LABEL =
      "Volver a la pantalla anterior";

  @override
  final String RESET_BUTTON_ACCESSIBILITY_LABEL = "Restablecer cambios";

  @override
  final String TEXT_AREA_PLACEHOLDER = "Escribe el texto aquí";

  @override
  final String TIME_HOUR_INPUT_TITLE = "Horas";

  @override
  final String TIME_MINUTE_INPUT_TITLE = "Minutos";

  @override
  final String TIME_SECOND_INPUT_TITLE = "Segundos";

  @override
  String CALCULATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "El resultado es $hours:$minutes:$seconds";
  }

  @override
  final String ADD_BUTTON_TITLE = "Añadir";

  @override
  final String SUBTRACT_BUTTON_TITLE = "Restar";

  @override
  final String ADD_TIME_BUTTON_ACCESSIBILITY_LABEL = "Sumar horas";

  @override
  final String SUBTRACT_TIME_BUTTON_ACCESSIBILITY_LABEL = "Restar horas";

  @override
  final String WEIGHT_INPUT_TITLE = "Peso (en kg)";

  @override
  final String HEIGHT_INPUT_TITLE = "Altura (en cm)";

  @override
  final String AGE_INPUT_PLACEHOLDER = "Introduce la edad";

  @override
  final String WEIGHT_INPUT_PLACEHOLDER = "Introduce el peso";

  @override
  final String HEIGHT_INPUT_PLACEHOLDER = "Introduce la altura";

  @override
  String BODY_MASS_INDEX_RESULT(String value, String category) {
    return "Tu índice de masa corporal es: $value; $category";
  }

  @override
  final String UNDERWEIGHT_CATEGORY = "Bajo peso";

  @override
  final String NORMAL_WEIGHT_CATEGORY = "Peso normal";

  @override
  final String OVERWEIGHT_CATEGORY = "Sobrepeso";

  @override
  final String OBESE_CATEGORY = "Obesidad";

  @override
  final String CALCULATE_BUTTON_TITLE = "Calcular";

  @override
  final String CALCULATE_BODY_MASS_INDEX_BUTTON_ACCESSIBILITY_LABEL =
      "Calcular índice de masa corporal";

  @override
  String CALCULATOR_CHARACTER_BUTTON_ACCESSIBILITY_LABEL(String character) {
    return "Añadir \"$character\" a la expresión";
  }

  @override
  final String CALCULATOR_CLEAN_BUTTON_ACCESSIBILITY_LABEL =
      "Limpiar expresión";

  @override
  final String CALCULATOR_BACKSPACE_BUTTON_ACCESSIBILITY_LABEL =
      "Eliminar el último carácter de la expresión";

  @override
  final String CALCULATOR_EQUAL_BUTTON_ACCESSIBILITY_LABEL =
      "Evaluar expresión";

  @override
  final String CALCULATOR_EXPAND_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Expandir teclado";

  @override
  final String FOREGROUND_BACKDROP_ACCESSIBILITY_LABEL = "Cerrar ventana";

  @override
  final String LOADING_INDICATOR_ACCESSIBILITY_LABEL =
      "Cargando contenido, por favor espera";

  @override
  final String BACK_BUTTON_TOOLTIP_MESSAGE = "Atrás";

  @override
  final String RESET_BUTTON_TOOLTIP_MESSAGE = "Restablecer cambios";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL = "Binario";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT = "BIN";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL =
      "Seleccionar binario como sistema numérico base";

  @override
  final String NUMBER_SYSTEM_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleccionar sistema numérico";

  @override
  final String
  CLEAN_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_BUTTON_ACCESSIBILITY_LABEL =
      "Limpiar historial";

  @override
  final String EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL =
      "Restaurar expresión";

  @override
  String AGGREGATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "El total es $hours:$minutes:$seconds";
  }

  @override
  String ADD_TIME_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir siguiente intervalo";

  @override
  String ADD_TIME_NEXT_BUTTON_TOOLTIP_MESSAGE = "Añadir siguiente intervalo";

  @override
  String REMOVE_TIME_BUTTON_ACCESSIBILITY_LABEL = "Eliminar tiempo";

  @override
  String REMOVE_TIME_BUTTON_TOOLTIP_MESSAGE = "Eliminar tiempo";

  @override
  String BASE_UNIT_LABEL = "Unidad base";

  @override
  final String ACRE_UNIT_LABEL = "Acre";

  @override
  final String ACRE_UNIT_ABBREVIATION = "ac";

  @override
  final String HECTARE_UNIT_LABEL = "Hectárea";

  @override
  final String HECTARE_UNIT_ABBREVIATION = "ha";

  @override
  final String SQUARE_CENTIMETER_UNIT_LABEL = "Centímetro cuadrado";

  @override
  final String SQUARE_CENTIMETER_UNIT_ABBREVIATION = "cm²";

  @override
  final String SQUARE_FOOT_UNIT_LABEL = "Pie cuadrado";

  @override
  final String SQUARE_FOOT_UNIT_ABBREVIATION = "ft²";

  @override
  final String SQUARE_INCH_UNIT_LABEL = "Pulgada cuadrada";

  @override
  final String SQUARE_INCH_UNIT_ABBREVIATION = "in²";

  @override
  final String SQUARE_KILOMETER_UNIT_LABEL = "Kilómetro cuadrado";

  @override
  final String SQUARE_KILOMETER_UNIT_ABBREVIATION = "km²";

  @override
  final String SQUARE_METER_UNIT_LABEL = "Metro cuadrado";

  @override
  final String SQUARE_METER_UNIT_ABBREVIATION = "m²";

  @override
  final String SQUARE_MILE_UNIT_LABEL = "Milla cuadrada";

  @override
  final String SQUARE_MILE_UNIT_ABBREVIATION = "mi²";

  @override
  final String SQUARE_MILLIMETER_UNIT_LABEL = "Milímetro cuadrado";

  @override
  final String SQUARE_MILLIMETER_UNIT_ABBREVIATION = "mm²";

  @override
  final String SQUARE_YARD_UNIT_LABEL = "Yarda cuadrada";

  @override
  final String SQUARE_YARD_UNIT_ABBREVIATION = "yd²";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_LABEL = "Dólar australiano";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_ABBREVIATION = "AUD";

  @override
  final String BRAZIL_REAL_UNIT_LABEL = "Real brasileño";

  @override
  final String BRAZIL_REAL_UNIT_ABBREVIATION = "BRL";

  @override
  final String CANADA_DOLLAR_UNIT_LABEL = "Dólar canadiense";

  @override
  final String CANADA_DOLLAR_UNIT_ABBREVIATION = "CAD";

  @override
  final String EURO_UNIT_LABEL = "Euro";

  @override
  final String EURO_UNIT_ABBREVIATION = "EUR";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_LABEL = "Libra esterlina";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_ABBREVIATION = "GBP";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_LABEL = "Dólar neozelandés";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_ABBREVIATION = "NZD";

  @override
  final String SWITZERLAND_FRANC_UNIT_LABEL = "Franco suizo";

  @override
  final String SWITZERLAND_FRANC_UNIT_ABBREVIATION = "CHF";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_LABEL = "Dólar estadounidense";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_ABBREVIATION = "USD";

  @override
  final String CENTIMETER_UNIT_LABEL = "Centímetro";

  @override
  final String CENTIMETER_UNIT_ABBREVIATION = "cm";

  @override
  final String FOOT_UNIT_LABEL = "Pie";

  @override
  final String FOOT_UNIT_ABBREVIATION = "ft";

  @override
  final String INCH_UNIT_LABEL = "Pulgada";

  @override
  final String INCH_UNIT_ABBREVIATION = "in";

  @override
  final String KILOMETER_UNIT_LABEL = "Kilómetro";

  @override
  final String KILOMETER_UNIT_ABBREVIATION = "km";

  @override
  final String METER_UNIT_LABEL = "Metro";

  @override
  final String METER_UNIT_ABBREVIATION = "m";

  @override
  final String MILE_UNIT_LABEL = "Milla";

  @override
  final String MILE_UNIT_ABBREVIATION = "mi";

  @override
  final String MILLIMETER_UNIT_LABEL = "Milímetro";

  @override
  final String MILLIMETER_UNIT_ABBREVIATION = "mm";

  @override
  final String NAUTICAL_MILE_UNIT_LABEL = "Milla náutica";

  @override
  final String NAUTICAL_MILE_UNIT_ABBREVIATION = "nmi";

  @override
  final String YARD_UNIT_LABEL = "Yarda";

  @override
  final String YARD_UNIT_ABBREVIATION = "yd";

  @override
  final String GRAM_UNIT_LABEL = "Gramo";

  @override
  final String GRAM_UNIT_ABBREVIATION = "g";

  @override
  final String KILOGRAM_UNIT_LABEL = "Kilogramo";

  @override
  final String KILOGRAM_UNIT_ABBREVIATION = "kg";

  @override
  final String MILLIGRAM_UNIT_LABEL = "Miligramo";

  @override
  final String MILLIGRAM_UNIT_ABBREVIATION = "mg";

  @override
  final String OUNCE_UNIT_LABEL = "Onza";

  @override
  final String OUNCE_UNIT_ABBREVIATION = "oz";

  @override
  final String POUND_UNIT_LABEL = "Libra";

  @override
  final String POUND_UNIT_ABBREVIATION = "lb";

  @override
  final String TONNE_UNIT_LABEL = "Tonelada";

  @override
  final String TONNE_UNIT_ABBREVIATION = "t";

  @override
  final String BINARY_NUMBER_SYSTEM_LABEL = "Binario";

  @override
  final String BINARY_NUMBER_SYSTEM_ABBREVIATION = "BIN";

  @override
  final String OCTAL_NUMBER_SYSTEM_LABEL = "Octal";

  @override
  final String OCTAL_NUMBER_SYSTEM_ABBREVIATION = "OCT";

  @override
  final String DECIMAL_NUMBER_SYSTEM_LABEL = "Decimal";

  @override
  final String DECIMAL_NUMBER_SYSTEM_ABBREVIATION = "DEC";

  @override
  final String HEXADECIMAL_NUMBER_SYSTEM_LABEL = "Hexadecimal";

  @override
  final String HEXADECIMAL_NUMBER_SYSTEM_ABBREVIATION = "HEX";

  @override
  final String FOOT_PER_SECOND_UNIT_LABEL = "Pies por segundo";

  @override
  final String FOOT_PER_SECOND_UNIT_ABBREVIATION = "ft/s";

  @override
  final String INCH_PER_SECOND_UNIT_LABEL = "Pulgadas por segundo";

  @override
  final String INCH_PER_SECOND_UNIT_ABBREVIATION = "in/s";

  @override
  final String METER_PER_SECOND_UNIT_LABEL = "Metros por segundo";

  @override
  final String METER_PER_SECOND_UNIT_ABBREVIATION = "m/s";

  @override
  final String KILOMETER_PER_SECOND_UNIT_LABEL = "Kilómetros por segundo";

  @override
  final String KILOMETER_PER_SECOND_UNIT_ABBREVIATION = "km/s";

  @override
  final String KILOMETER_PER_HOUR_UNIT_LABEL = "Kilómetros por hora";

  @override
  final String KILOMETER_PER_HOUR_UNIT_ABBREVIATION = "km/h";

  @override
  final String MILE_PER_SECOND_UNIT_LABEL = "Millas por segundo";

  @override
  final String MILE_PER_SECOND_UNIT_ABBREVIATION = "mi/s";

  @override
  final String MILE_PER_HOUR_UNIT_LABEL = "Millas por hora";

  @override
  final String MILE_PER_HOUR_UNIT_ABBREVIATION = "mph";

  @override
  final String KNOT_UNIT_LABEL = "Nudo";

  @override
  final String KNOT_UNIT_ABBREVIATION = "kn";

  @override
  final String MACH_UNIT_LABEL = "Mach";

  @override
  final String MACH_UNIT_ABBREVIATION = "Mach";

  @override
  final String LIGHTSPEED_UNIT_LABEL = "Velocidad de la luz";

  @override
  final String LIGHTSPEED_UNIT_ABBREVIATION = "c";

  @override
  final String CELSIUS_UNIT_LABEL = "Celsius";

  @override
  final String CELSIUS_UNIT_ABBREVIATION = "°C";

  @override
  final String FAHRENHEIT_UNIT_LABEL = "Fahrenheit";

  @override
  final String FAHRENHEIT_UNIT_ABBREVIATION = "°F";

  @override
  final String KELVIN_UNIT_LABEL = "Kelvin";

  @override
  final String KELVIN_UNIT_ABBREVIATION = "K";

  @override
  final String MILLISECOND_UNIT_LABEL = "Milisegundo";

  @override
  final String MILLISECOND_UNIT_ABBREVIATION = "ms";

  @override
  final String SECOND_UNIT_LABEL = "Segundo";

  @override
  final String SECOND_UNIT_ABBREVIATION = "s";

  @override
  final String MINUTE_UNIT_LABEL = "Minuto";

  @override
  final String MINUTE_UNIT_ABBREVIATION = "min";

  @override
  final String HOUR_UNIT_LABEL = "Hora";

  @override
  final String HOUR_UNIT_ABBREVIATION = "h";

  @override
  final String DAY_UNIT_LABEL = "Día";

  @override
  final String DAY_UNIT_ABBREVIATION = "d";

  @override
  final String WEEK_UNIT_LABEL = "Semana";

  @override
  final String WEEK_UNIT_ABBREVIATION = "sem";

  @override
  final String YEAR_UNIT_LABEL = "Año";

  @override
  final String YEAR_UNIT_ABBREVIATION = "año";

  @override
  final String AREA_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleccionar unidad de superficie";

  @override
  final String CURRENCY_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleccionar divisa";

  @override
  final String LENGTH_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleccionar unidad de longitud";

  @override
  final String MASS_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleccionar unidad de masa";

  @override
  final String NUMBER_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleccionar unidad numérica";

  @override
  final String SPEED_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleccionar unidad de velocidad";

  @override
  final String TEMPERATURE_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleccionar unidad de temperatura";

  @override
  final String TIME_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleccionar unidad de tiempo";

  @override
  final String CONVERTER_INPUT_PLACEHOLDER = "Introduce un valor";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_MESSAGE =
      "Se ha borrado el historial de ecuaciones";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_DESCRIPTION =
      "Pulsa restaurar para recuperar el historial";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar ecuaciones borradas";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar ecuaciones";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_MESSAGE =
      "La calculadora de tiempo se ha reiniciado";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_DESCRIPTION =
      "Pulsa restaurar para conservar los datos de tiempo";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar calculadora de tiempo";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar tiempos";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_MESSAGE =
      "La calculadora de índice de masa corporal se ha reiniciado";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_DESCRIPTION =
      "Pulsa restaurar para conservar tus datos de IMC";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar calculadora de IMC";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar índice de masa corporal";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_MESSAGE =
      "El tiempo total se ha reiniciado";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_DESCRIPTION =
      "Pulsa restaurar para conservar el tiempo total";

  @override
  final String
  RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar tiempo total";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar tiempo total";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_MESSAGE =
      "Las unidades de superficie se han reiniciado";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_DESCRIPTION =
      "Pulsa restaurar para conservar las unidades de superficie";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de superficie";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de superficie";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_MESSAGE =
      "La información de texto se ha reiniciado";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_DESCRIPTION =
      "Pulsa restaurar para conservar la información de texto";

  @override
  final String
  RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar información de texto";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar información de texto";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_MESSAGE =
      "Las divisas se han reiniciado";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_DESCRIPTION =
      "Pulsa restaurar para conservar las divisas";

  @override
  final String
  RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar divisas";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar divisas";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_MESSAGE =
      "Las unidades de longitud se han reiniciado";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_DESCRIPTION =
      "Pulsa restaurar para conservar las unidades de longitud";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de longitud";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de longitud";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_MESSAGE =
      "Las unidades de masa se han reiniciado";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_DESCRIPTION =
      "Pulsa restaurar para conservar las unidades de masa";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de masa";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de masa";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_MESSAGE =
      "Los sistemas numéricos se han reiniciado";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_DESCRIPTION =
      "Pulsa restaurar para conservar los sistemas numéricos";

  @override
  final String
  RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar sistemas numéricos";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar sistemas numéricos";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_MESSAGE =
      "Las unidades de velocidad se han reiniciado";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_DESCRIPTION =
      "Pulsa restaurar para conservar las unidades de velocidad";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de velocidad";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de velocidad";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_MESSAGE =
      "Las unidades de temperatura se han reiniciado";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_DESCRIPTION =
      "Pulsa restaurar para conservar las unidades de temperatura";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de temperatura";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de temperatura";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_MESSAGE =
      "Las unidades de tiempo se han reiniciado";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_DESCRIPTION =
      "Pulsa restaurar para conservar las unidades de tiempo";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de tiempo";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de tiempo";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_ACCESSIBILITY_LABEL =
      "Reintentar descarga de valores de divisas";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_TOOLTIP_MESSAGE =
      "Reintentar";

  @override
  final String CURRENT_CURRENCY_VALUES_LAST_UPDATED_AT_DESCRIPTION =
      "Última actualización:";

  @override
  final String CALCULATOR_ADD_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir suma a la expresión";

  @override
  final String CALCULATOR_SUBTRACT_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir resta a la expresión";

  @override
  final String CALCULATOR_MULTIPLY_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir multiplicación a la expresión";

  @override
  final String CALCULATOR_DIVIDE_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir división a la expresión";

  @override
  final String CALCULATOR_EQUALS_BUTTON_ACCESSIBILITY_LABEL =
      "Evaluar expresión";

  @override
  final String CALCULATOR_CLEAR_BUTTON_ACCESSIBILITY_LABEL =
      "Limpiar expresión";

  @override
  final String CALCULATOR_POINT_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir punto decimal a la expresión";

  @override
  final String CALCULATOR_LEFT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir paréntesis de apertura";

  @override
  final String CALCULATOR_RIGHT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir paréntesis de cierre";

  @override
  final String CALCULATOR_PERCENTAGE_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir porcentaje";

  @override
  final String CALCULATOR_PI_BUTTON_ACCESSIBILITY_LABEL = "Añadir número Pi";

  @override
  final String CALCULATOR_E_BUTTON_ACCESSIBILITY_LABEL = "Añadir constante e";

  @override
  final String CALCULATOR_ROOT_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir raíz cuadrada";

  @override
  final String CALCULATOR_POWER_BUTTON_ACCESSIBILITY_LABEL = "Añadir potencia";

  @override
  final String CALCULATOR_FACTORIAL_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir factorial";

  @override
  final String CALCULATOR_RECIPROCAL_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir recíproco";

  @override
  final String CALCULATOR_ZERO_BUTTON_ACCESSIBILITY_LABEL = "Añadir cero";

  @override
  final String CALCULATOR_ONE_BUTTON_ACCESSIBILITY_LABEL = "Añadir uno";

  @override
  final String CALCULATOR_TWO_BUTTON_ACCESSIBILITY_LABEL = "Añadir dos";

  @override
  final String CALCULATOR_THREE_BUTTON_ACCESSIBILITY_LABEL = "Añadir tres";

  @override
  final String CALCULATOR_FOUR_BUTTON_ACCESSIBILITY_LABEL = "Añadir cuatro";

  @override
  final String CALCULATOR_FIVE_BUTTON_ACCESSIBILITY_LABEL = "Añadir cinco";

  @override
  final String CALCULATOR_SIX_BUTTON_ACCESSIBILITY_LABEL = "Añadir seis";

  @override
  final String CALCULATOR_SEVEN_BUTTON_ACCESSIBILITY_LABEL = "Añadir siete";

  @override
  final String CALCULATOR_EIGHT_BUTTON_ACCESSIBILITY_LABEL = "Añadir ocho";

  @override
  final String CALCULATOR_NINE_BUTTON_ACCESSIBILITY_LABEL = "Añadir nueve";

  @override
  final String CALCULATOR_SHRINK_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Contraer teclado";

  @override
  final String ADD_UNIT_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir siguiente unidad";

  @override
  final String ADD_UNIT_NEXT_BUTTON_TOOLTIP_MESSAGE = "Añadir siguiente unidad";

  @override
  final String ADD_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir sistema numérico";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Añadir siguiente sistema numérico";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Añadir siguiente sistema numérico";

  @override
  String CURRENT_CURRENCY_VALUES_UPDATED_AT_TIME(
    String paddedCurrentHourOfDay,
    String currentMinuteOfDay,
    String periodOfTheDay,
    String currentMonthOfYear,
    String currentDayOfMonth,
    String currentYear,
  ) {
    return "$paddedCurrentHourOfDay:$currentMinuteOfDay - $currentDayOfMonth/$currentMonthOfYear/$currentYear";
  }
}
