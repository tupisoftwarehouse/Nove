import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";

class PortugueseStringsValueObject extends DeviceLanguageStringsValueObject {
  @override
  final String NOT_VALID_EXPRESSION_ERROR_MESSAGE =
      "Erro: a expressão não é válida";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_NAME = "Conversor de área";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o conversor de área";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_NAME =
      "Calculadora de Índice de Massa Corporal";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para a calculadora de IMC";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_NAME = "Conversor de moedas";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o conversor de moedas";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_NAME = "Conversor de massa";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o conversor de massa";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_NAME =
      "Conversor de sistemas numéricos";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o conversor de sistemas numéricos";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_NAME = "Conversor de velocidade";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o conversor de velocidade";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_NAME =
      "Conversor de temperatura";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o conversor de temperatura";

  @override
  final String TIME_AGGREGATOR_UTILITY_NAME = "Agregador de tempo";

  @override
  final String TIME_AGGREGATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o agregador de tempo";

  @override
  final String TIME_CALCULATOR_UTILITY_NAME = "Calculadora de tempo";

  @override
  final String TIME_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para a calculadora de tempo";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_NAME = "Conversor de tempo";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o conversor de tempo";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_NAME = "Conversor de comprimento";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o conversor de comprimento";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_NAME =
      "Analisador de informações de texto";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Abrir histórico";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Abrir histórico de expressões";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Fechar histórico";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Fechar histórico de expressões";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Ir para o analisador de informações de texto";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Mostrar página da calculadora";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Mostrar página de utilitários";

  @override
  String SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(String unitName) {
    return "Selecionar \"$unitName\" como unidade base";
  }

  @override
  String SELECT_UNIT_ELEMENT_TOOLTIP_MESSAGE(String unitName) {
    return "Selecionar $unitName como base";
  }

  @override
  final String REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE = "Remover unidade";

  @override
  final String REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL =
      "Remover unidade de medida";

  @override
  final String ADD_UNIT_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar unidade de medida";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_TITLE = "Calculadora";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_TITLE = "Utilitários";

  @override
  final String ADD_UNIT_BUTTON_TOOLTIP_MESSAGE = "Adicionar unidade";

  @override
  final String CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE = "Resultado";

  @override
  final String LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_TITLE = "Histórico";

  @override
  String TEXT_INFORMATION_BREAKDOWN(String amountOfWords, String length) {
    return "$amountOfWords palavras e $length caracteres";
  }

  @override
  final String BACK_BUTTON_ACCESSIBILITY_LABEL = "Voltar para a tela anterior";

  @override
  final String RESET_BUTTON_ACCESSIBILITY_LABEL = "Redefinir alterações";

  @override
  final String TEXT_AREA_PLACEHOLDER = "Digite o texto aqui";

  @override
  final String TIME_HOUR_INPUT_TITLE = "Horas";

  @override
  final String TIME_MINUTE_INPUT_TITLE = "Minutos";

  @override
  final String TIME_SECOND_INPUT_TITLE = "Segundos";

  @override
  String CALCULATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "O resultado é $hours:$minutes:$seconds";
  }

  @override
  final String ADD_BUTTON_TITLE = "Adicionar";

  @override
  final String SUBTRACT_BUTTON_TITLE = "Subtrair";

  @override
  final String ADD_TIME_BUTTON_ACCESSIBILITY_LABEL = "Somar horas";

  @override
  final String SUBTRACT_TIME_BUTTON_ACCESSIBILITY_LABEL = "Subtrair horas";

  @override
  final String WEIGHT_INPUT_TITLE = "Peso (em kg)";

  @override
  final String HEIGHT_INPUT_TITLE = "Altura (em cm)";

  @override
  final String AGE_INPUT_PLACEHOLDER = "Digite a idade";

  @override
  final String WEIGHT_INPUT_PLACEHOLDER = "Digite o peso";

  @override
  final String HEIGHT_INPUT_PLACEHOLDER = "Digite a altura";

  @override
  String BODY_MASS_INDEX_RESULT(String value, String category) {
    return "Seu IMC é: $value; $category";
  }

  @override
  final String UNDERWEIGHT_CATEGORY = "Abaixo do peso";

  @override
  final String NORMAL_WEIGHT_CATEGORY = "Peso normal";

  @override
  final String OVERWEIGHT_CATEGORY = "Sobrepeso";

  @override
  final String OBESE_CATEGORY = "Obesidade";

  @override
  final String CALCULATE_BUTTON_TITLE = "Calcular";

  @override
  final String CALCULATE_BODY_MASS_INDEX_BUTTON_ACCESSIBILITY_LABEL =
      "Calcular índice de massa corporal";

  @override
  String CALCULATOR_CHARACTER_BUTTON_ACCESSIBILITY_LABEL(String character) {
    return "Adicionar \"$character\" à expressão";
  }

  @override
  final String CALCULATOR_CLEAN_BUTTON_ACCESSIBILITY_LABEL = "Limpar expressão";

  @override
  final String CALCULATOR_BACKSPACE_BUTTON_ACCESSIBILITY_LABEL =
      "Remover o último caractere da expressão";

  @override
  final String CALCULATOR_EQUAL_BUTTON_ACCESSIBILITY_LABEL =
      "Avaliar expressão";

  @override
  final String CALCULATOR_EXPAND_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Expandir teclado";

  @override
  final String FOREGROUND_BACKDROP_ACCESSIBILITY_LABEL = "Fechar janela";

  @override
  final String LOADING_INDICATOR_ACCESSIBILITY_LABEL =
      "Carregando conteúdo, por favor aguarde";

  @override
  final String BACK_BUTTON_TOOLTIP_MESSAGE = "Voltar";

  @override
  final String RESET_BUTTON_TOOLTIP_MESSAGE = "Redefinir alterações";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL = "Binário";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT = "BIN";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL =
      "Selecionar binário como sistema numérico base";

  @override
  final String NUMBER_SYSTEM_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Selecionar sistema numérico";

  @override
  final String
  CLEAN_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_BUTTON_ACCESSIBILITY_LABEL =
      "Limpar histórico";

  @override
  final String EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL =
      "Restaurar expressão";

  @override
  String AGGREGATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "O total é $hours:$minutes:$seconds";
  }

  @override
  String ADD_TIME_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar próximo intervalo";

  @override
  String ADD_TIME_NEXT_BUTTON_TOOLTIP_MESSAGE = "Adicionar próximo intervalo";

  @override
  String REMOVE_TIME_BUTTON_ACCESSIBILITY_LABEL = "Remover tempo";

  @override
  String REMOVE_TIME_BUTTON_TOOLTIP_MESSAGE = "Remover tempo";

  @override
  String BASE_UNIT_LABEL = "Unidade base";

  @override
  final String ACRE_UNIT_LABEL = "Acre";

  @override
  final String ACRE_UNIT_ABBREVIATION = "ac";

  @override
  final String HECTARE_UNIT_LABEL = "Hectare";

  @override
  final String HECTARE_UNIT_ABBREVIATION = "ha";

  @override
  final String SQUARE_CENTIMETER_UNIT_LABEL = "Centímetro quadrado";

  @override
  final String SQUARE_CENTIMETER_UNIT_ABBREVIATION = "cm²";

  @override
  final String SQUARE_FOOT_UNIT_LABEL = "Pé quadrado";

  @override
  final String SQUARE_FOOT_UNIT_ABBREVIATION = "ft²";

  @override
  final String SQUARE_INCH_UNIT_LABEL = "Polegada quadrada";

  @override
  final String SQUARE_INCH_UNIT_ABBREVIATION = "in²";

  @override
  final String SQUARE_KILOMETER_UNIT_LABEL = "Quilômetro quadrado";

  @override
  final String SQUARE_KILOMETER_UNIT_ABBREVIATION = "km²";

  @override
  final String SQUARE_METER_UNIT_LABEL = "Metro quadrado";

  @override
  final String SQUARE_METER_UNIT_ABBREVIATION = "m²";

  @override
  final String SQUARE_MILE_UNIT_LABEL = "Milha quadrada";

  @override
  final String SQUARE_MILE_UNIT_ABBREVIATION = "mi²";

  @override
  final String SQUARE_MILLIMETER_UNIT_LABEL = "Milímetro quadrado";

  @override
  final String SQUARE_MILLIMETER_UNIT_ABBREVIATION = "mm²";

  @override
  final String SQUARE_YARD_UNIT_LABEL = "Jarda quadrada";

  @override
  final String SQUARE_YARD_UNIT_ABBREVIATION = "yd²";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_LABEL = "Dólar australiano";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_ABBREVIATION = "AUD";

  @override
  final String BRAZIL_REAL_UNIT_LABEL = "Real brasileiro";

  @override
  final String BRAZIL_REAL_UNIT_ABBREVIATION = "BRL";

  @override
  final String CANADA_DOLLAR_UNIT_LABEL = "Dólar canadense";

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
  final String NEW_ZEALAND_DOLLAR_UNIT_LABEL = "Dólar neozelandês";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_ABBREVIATION = "NZD";

  @override
  final String SWITZERLAND_FRANC_UNIT_LABEL = "Franco suíço";

  @override
  final String SWITZERLAND_FRANC_UNIT_ABBREVIATION = "CHF";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_LABEL = "Dólar americano";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_ABBREVIATION = "USD";

  @override
  final String CENTIMETER_UNIT_LABEL = "Centímetro";

  @override
  final String CENTIMETER_UNIT_ABBREVIATION = "cm";

  @override
  final String FOOT_UNIT_LABEL = "Pé";

  @override
  final String FOOT_UNIT_ABBREVIATION = "ft";

  @override
  final String INCH_UNIT_LABEL = "Polegada";

  @override
  final String INCH_UNIT_ABBREVIATION = "in";

  @override
  final String KILOMETER_UNIT_LABEL = "Quilômetro";

  @override
  final String KILOMETER_UNIT_ABBREVIATION = "km";

  @override
  final String METER_UNIT_LABEL = "Metro";

  @override
  final String METER_UNIT_ABBREVIATION = "m";

  @override
  final String MILE_UNIT_LABEL = "Milha";

  @override
  final String MILE_UNIT_ABBREVIATION = "mi";

  @override
  final String MILLIMETER_UNIT_LABEL = "Milímetro";

  @override
  final String MILLIMETER_UNIT_ABBREVIATION = "mm";

  @override
  final String NAUTICAL_MILE_UNIT_LABEL = "Milha náutica";

  @override
  final String NAUTICAL_MILE_UNIT_ABBREVIATION = "nmi";

  @override
  final String YARD_UNIT_LABEL = "Jarda";

  @override
  final String YARD_UNIT_ABBREVIATION = "yd";

  @override
  final String GRAM_UNIT_LABEL = "Grama";

  @override
  final String GRAM_UNIT_ABBREVIATION = "g";

  @override
  final String KILOGRAM_UNIT_LABEL = "Quilograma";

  @override
  final String KILOGRAM_UNIT_ABBREVIATION = "kg";

  @override
  final String MILLIGRAM_UNIT_LABEL = "Miligrama";

  @override
  final String MILLIGRAM_UNIT_ABBREVIATION = "mg";

  @override
  final String OUNCE_UNIT_LABEL = "Onça";

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
  final String BINARY_NUMBER_SYSTEM_LABEL = "Binário";

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
  final String FOOT_PER_SECOND_UNIT_LABEL = "Pés por segundo";

  @override
  final String FOOT_PER_SECOND_UNIT_ABBREVIATION = "ft/s";

  @override
  final String INCH_PER_SECOND_UNIT_LABEL = "Polegadas por segundo";

  @override
  final String INCH_PER_SECOND_UNIT_ABBREVIATION = "in/s";

  @override
  final String METER_PER_SECOND_UNIT_LABEL = "Metros por segundo";

  @override
  final String METER_PER_SECOND_UNIT_ABBREVIATION = "m/s";

  @override
  final String KILOMETER_PER_SECOND_UNIT_LABEL = "Quilômetros por segundo";

  @override
  final String KILOMETER_PER_SECOND_UNIT_ABBREVIATION = "km/s";

  @override
  final String KILOMETER_PER_HOUR_UNIT_LABEL = "Quilômetros por hora";

  @override
  final String KILOMETER_PER_HOUR_UNIT_ABBREVIATION = "km/h";

  @override
  final String MILE_PER_SECOND_UNIT_LABEL = "Milhas por segundo";

  @override
  final String MILE_PER_SECOND_UNIT_ABBREVIATION = "mi/s";

  @override
  final String MILE_PER_HOUR_UNIT_LABEL = "Milhas por hora";

  @override
  final String MILE_PER_HOUR_UNIT_ABBREVIATION = "mph";

  @override
  final String KNOT_UNIT_LABEL = "Nó";

  @override
  final String KNOT_UNIT_ABBREVIATION = "kn";

  @override
  final String MACH_UNIT_LABEL = "Mach";

  @override
  final String MACH_UNIT_ABBREVIATION = "Mach";

  @override
  final String LIGHTSPEED_UNIT_LABEL = "Velocidade da luz";

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
  final String MILLISECOND_UNIT_LABEL = "Milissegundo";

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
  final String DAY_UNIT_LABEL = "Dia";

  @override
  final String DAY_UNIT_ABBREVIATION = "d";

  @override
  final String WEEK_UNIT_LABEL = "Semana";

  @override
  final String WEEK_UNIT_ABBREVIATION = "sem";

  @override
  final String YEAR_UNIT_LABEL = "Ano";

  @override
  final String YEAR_UNIT_ABBREVIATION = "ano";

  @override
  final String AREA_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Selecionar unidade de área";

  @override
  final String CURRENCY_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Selecionar moeda";

  @override
  final String LENGTH_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Selecionar unidade de comprimento";

  @override
  final String MASS_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Selecionar unidade de massa";

  @override
  final String NUMBER_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Selecionar unidade numérica";

  @override
  final String SPEED_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Selecionar unidade de velocidade";

  @override
  final String TEMPERATURE_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Selecionar unidade de temperatura";

  @override
  final String TIME_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Selecionar unidade de tempo";

  @override
  final String CONVERTER_INPUT_PLACEHOLDER = "Digite um valor";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_MESSAGE =
      "O histórico de equações foi apagado";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_DESCRIPTION =
      "Toque em restaurar para manter o histórico";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar equações apagadas";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar equações";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_MESSAGE =
      "A calculadora de tempo foi redefinida";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_DESCRIPTION =
      "Toque em restaurar para manter os dados de tempo";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar calculadora de tempo";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar tempos";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_MESSAGE =
      "A calculadora de IMC foi redefinida";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_DESCRIPTION =
      "Toque em restaurar para manter seus dados de IMC";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar calculadora de IMC";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar IMC";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_MESSAGE =
      "O tempo total foi redefinido";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_DESCRIPTION =
      "Toque em restaurar para manter o tempo total";

  @override
  final String
  RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar tempo total";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar tempo total";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_MESSAGE =
      "As unidades de área foram redefinidas";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_DESCRIPTION =
      "Toque em restaurar para manter as unidades de área";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de área";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de área";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_MESSAGE =
      "As informações de texto foram redefinidas";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_DESCRIPTION =
      "Toque em restaurar para manter as informações de texto";

  @override
  final String
  RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar informações de texto";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar informações de texto";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_MESSAGE =
      "As moedas foram redefinidas";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_DESCRIPTION =
      "Toque em restaurar para manter as moedas";

  @override
  final String
  RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar moedas";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar moedas";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_MESSAGE =
      "As unidades de comprimento foram redefinidas";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_DESCRIPTION =
      "Toque em restaurar para manter as unidades de comprimento";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de comprimento";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de comprimento";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_MESSAGE =
      "As unidades de massa foram redefinidas";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_DESCRIPTION =
      "Toque em restaurar para manter as unidades de massa";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de massa";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de massa";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_MESSAGE =
      "Os sistemas numéricos foram redefinidos";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_DESCRIPTION =
      "Toque em restaurar para manter os sistemas numéricos";

  @override
  final String
  RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar sistemas numéricos";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar sistemas numéricos";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_MESSAGE =
      "As unidades de velocidade foram redefinidas";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_DESCRIPTION =
      "Toque em restaurar para manter as unidades de velocidade";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de velocidade";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de velocidade";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_MESSAGE =
      "As unidades de temperatura foram redefinidas";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_DESCRIPTION =
      "Toque em restaurar para manter as unidades de temperatura";

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
      "As unidades de tempo foram redefinidas";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_DESCRIPTION =
      "Toque em restaurar para manter as unidades de tempo";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurar unidades de tempo";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurar unidades de tempo";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_ACCESSIBILITY_LABEL =
      "Tentar baixar os valores de moeda novamente";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_TOOLTIP_MESSAGE =
      "Tentar novamente";

  @override
  final String CURRENT_CURRENCY_VALUES_LAST_UPDATED_AT_DESCRIPTION =
      "Última atualização:";

  @override
  final String CALCULATOR_ADD_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar soma à expressão";

  @override
  final String CALCULATOR_SUBTRACT_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar subtração à expressão";

  @override
  final String CALCULATOR_MULTIPLY_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar multiplicação à expressão";

  @override
  final String CALCULATOR_DIVIDE_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar divisão à expressão";

  @override
  final String CALCULATOR_EQUALS_BUTTON_ACCESSIBILITY_LABEL =
      "Avaliar expressão";

  @override
  final String CALCULATOR_CLEAR_BUTTON_ACCESSIBILITY_LABEL = "Limpar expressão";

  @override
  final String CALCULATOR_POINT_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar ponto decimal";

  @override
  final String CALCULATOR_LEFT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar parêntese de abertura";

  @override
  final String CALCULATOR_RIGHT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar parêntese de fechamento";

  @override
  final String CALCULATOR_PERCENTAGE_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar porcentagem";

  @override
  final String CALCULATOR_PI_BUTTON_ACCESSIBILITY_LABEL = "Adicionar número Pi";

  @override
  final String CALCULATOR_E_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar constante e";

  @override
  final String CALCULATOR_ROOT_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar raiz quadrada";

  @override
  final String CALCULATOR_POWER_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar potência";

  @override
  final String CALCULATOR_FACTORIAL_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar fatorial";

  @override
  final String CALCULATOR_RECIPROCAL_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar recíproco";

  @override
  final String CALCULATOR_ZERO_BUTTON_ACCESSIBILITY_LABEL = "Adicionar zero";

  @override
  final String CALCULATOR_ONE_BUTTON_ACCESSIBILITY_LABEL = "Adicionar um";

  @override
  final String CALCULATOR_TWO_BUTTON_ACCESSIBILITY_LABEL = "Adicionar dois";

  @override
  final String CALCULATOR_THREE_BUTTON_ACCESSIBILITY_LABEL = "Adicionar três";

  @override
  final String CALCULATOR_FOUR_BUTTON_ACCESSIBILITY_LABEL = "Adicionar quatro";

  @override
  final String CALCULATOR_FIVE_BUTTON_ACCESSIBILITY_LABEL = "Adicionar cinco";

  @override
  final String CALCULATOR_SIX_BUTTON_ACCESSIBILITY_LABEL = "Adicionar seis";

  @override
  final String CALCULATOR_SEVEN_BUTTON_ACCESSIBILITY_LABEL = "Adicionar sete";

  @override
  final String CALCULATOR_EIGHT_BUTTON_ACCESSIBILITY_LABEL = "Adicionar oito";

  @override
  final String CALCULATOR_NINE_BUTTON_ACCESSIBILITY_LABEL = "Adicionar nove";

  @override
  final String CALCULATOR_SHRINK_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Recolher teclado";

  @override
  final String ADD_UNIT_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar próxima unidade";

  @override
  final String ADD_UNIT_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Adicionar próxima unidade";

  @override
  final String ADD_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar sistema numérico";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Adicionar próximo sistema numérico";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Adicionar próximo sistema numérico";

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
