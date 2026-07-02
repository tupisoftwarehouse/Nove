import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";

class EnglishStringsValueObject extends DeviceLanguageStringsValueObject {
  @override
  final String NOT_VALID_EXPRESSION_ERROR_MESSAGE =
      "Error: That's not a valid expression";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_NAME = "Area converter";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to area converter";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_NAME =
      "Body Mass Index Calculator";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to Body Mass Index Calculator";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_NAME = "Currency converter";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to currency converter";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_NAME = "Mass converter";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to mass converter";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_NAME = "Number converter";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to number converter";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_NAME = "Speed converter";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to speed converter";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_NAME =
      "Temperature converter";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to temperature converter";

  @override
  final String TIME_AGGREGATOR_UTILITY_NAME = "Time aggregator";

  @override
  final String TIME_AGGREGATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to time aggregator";

  @override
  final String TIME_CALCULATOR_UTILITY_NAME = "Time calculator";

  @override
  final String TIME_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to time calculator";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_NAME = "Time converter";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to time converter";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_NAME = "Length converter";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to length converter";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_NAME = "Text information parser";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Open expression history";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Open expression history";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Close expression history";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Close expression history";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Go to the text information parser";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Show calculator page";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Show utilities page";

  @override
  String SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(String unitName) {
    return "Select \"$unitName\" as conversion base";
  }

  @override
  String SELECT_UNIT_ELEMENT_TOOLTIP_MESSAGE(String unitName) {
    return "Select $unitName as base";
  }

  @override
  final String REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE = "Remove unit";

  @override
  final String REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL =
      "Remove unit of measure";

  @override
  final String ADD_UNIT_BUTTON_ACCESSIBILITY_LABEL = "Add unit of measure";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_TITLE = "Calculator";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_TITLE = "Utilities";

  @override
  final String ADD_UNIT_BUTTON_TOOLTIP_MESSAGE = "Add unit";

  @override
  final String CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE = "Result";

  @override
  final String LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_TITLE = "History";

  @override
  String TEXT_INFORMATION_BREAKDOWN(String amountOfWords, String length) {
    return "$amountOfWords words and $length characters";
  }

  @override
  final String BACK_BUTTON_ACCESSIBILITY_LABEL =
      "Return to the previous screen";

  @override
  final String RESET_BUTTON_ACCESSIBILITY_LABEL = "Reset changes";

  @override
  final String TEXT_AREA_PLACEHOLDER = "Type some text here";

  @override
  final String TIME_HOUR_INPUT_TITLE = "Hours";

  @override
  final String TIME_MINUTE_INPUT_TITLE = "Minutes";

  @override
  final String TIME_SECOND_INPUT_TITLE = "Seconds";

  @override
  String CALCULATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "The result is $hours:$minutes:$seconds";
  }

  @override
  final String ADD_BUTTON_TITLE = "Add";

  @override
  final String SUBTRACT_BUTTON_TITLE = "Subtract";

  @override
  final String ADD_TIME_BUTTON_ACCESSIBILITY_LABEL =
      "Perform addition on hours";

  @override
  final String SUBTRACT_TIME_BUTTON_ACCESSIBILITY_LABEL =
      "Perform subtraction on hours";

  @override
  final String WEIGHT_INPUT_TITLE = "Weight (in kg)";

  @override
  final String HEIGHT_INPUT_TITLE = "Height (in cm)";

  @override
  final String AGE_INPUT_PLACEHOLDER = "Enter an age";

  @override
  final String WEIGHT_INPUT_PLACEHOLDER = "Enter a weight";

  @override
  final String HEIGHT_INPUT_PLACEHOLDER = "Enter a height";

  @override
  String BODY_MASS_INDEX_RESULT(String value, String category) {
    return "Your Body Mass Index is: $value; $category";
  }

  @override
  final String UNDERWEIGHT_CATEGORY = "Underweight";

  @override
  final String NORMAL_WEIGHT_CATEGORY = "Normal weight";

  @override
  final String OVERWEIGHT_CATEGORY = "Overweight";

  @override
  final String OBESE_CATEGORY = "Obese";

  @override
  final String CALCULATE_BUTTON_TITLE = "Calculate";

  @override
  final String CALCULATE_BODY_MASS_INDEX_BUTTON_ACCESSIBILITY_LABEL =
      "Calculate body mass index";

  @override
  String CALCULATOR_CHARACTER_BUTTON_ACCESSIBILITY_LABEL(String character) {
    return "Add \"$character\" to expression";
  }

  @override
  final String CALCULATOR_CLEAN_BUTTON_ACCESSIBILITY_LABEL = "Clear expression";

  @override
  final String CALCULATOR_BACKSPACE_BUTTON_ACCESSIBILITY_LABEL =
      "Remove last character from expression";

  @override
  final String CALCULATOR_EQUAL_BUTTON_ACCESSIBILITY_LABEL =
      "Evaluate expression";

  @override
  final String CALCULATOR_EXPAND_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Expand keyboard";

  @override
  final String FOREGROUND_BACKDROP_ACCESSIBILITY_LABEL = "Dismiss dialogue";

  @override
  final String LOADING_INDICATOR_ACCESSIBILITY_LABEL =
      "Please wait, content is loading";

  @override
  final String BACK_BUTTON_TOOLTIP_MESSAGE = "Go back";

  @override
  final String RESET_BUTTON_TOOLTIP_MESSAGE = "Reset changes";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL = "Binary";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT = "BIN";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL =
      "Select binary as base number system";

  @override
  final String NUMBER_SYSTEM_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Select number system";

  @override
  final String
  CLEAN_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_BUTTON_ACCESSIBILITY_LABEL =
      "Clear history";

  @override
  final String EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL =
      "Restore expression";

  @override
  String AGGREGATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "The total is $hours:$minutes:$seconds";
  }

  @override
  String ADD_TIME_NEXT_BUTTON_ACCESSIBILITY_LABEL = "Add next time";

  @override
  String ADD_TIME_NEXT_BUTTON_TOOLTIP_MESSAGE = "Add next time";

  @override
  String REMOVE_TIME_BUTTON_ACCESSIBILITY_LABEL = "Remove time";

  @override
  String REMOVE_TIME_BUTTON_TOOLTIP_MESSAGE = "Remove time";

  @override
  String BASE_UNIT_LABEL = "Base unit";

  @override
  final String ACRE_UNIT_LABEL = "Acre";

  @override
  final String ACRE_UNIT_ABBREVIATION = "ac";

  @override
  final String HECTARE_UNIT_LABEL = "Hectare";

  @override
  final String HECTARE_UNIT_ABBREVIATION = "ha";

  @override
  final String SQUARE_CENTIMETER_UNIT_LABEL = "Square centimetre";

  @override
  final String SQUARE_CENTIMETER_UNIT_ABBREVIATION = "cm²";

  @override
  final String SQUARE_FOOT_UNIT_LABEL = "Square foot";

  @override
  final String SQUARE_FOOT_UNIT_ABBREVIATION = "ft²";

  @override
  final String SQUARE_INCH_UNIT_LABEL = "Square inch";

  @override
  final String SQUARE_INCH_UNIT_ABBREVIATION = "in²";

  @override
  final String SQUARE_KILOMETER_UNIT_LABEL = "Square kilometre";

  @override
  final String SQUARE_KILOMETER_UNIT_ABBREVIATION = "km²";

  @override
  final String SQUARE_METER_UNIT_LABEL = "Square metre";

  @override
  final String SQUARE_METER_UNIT_ABBREVIATION = "m²";

  @override
  final String SQUARE_MILE_UNIT_LABEL = "Square mile";

  @override
  final String SQUARE_MILE_UNIT_ABBREVIATION = "mi²";

  @override
  final String SQUARE_MILLIMETER_UNIT_LABEL = "Square millimetre";

  @override
  final String SQUARE_MILLIMETER_UNIT_ABBREVIATION = "mm²";

  @override
  final String SQUARE_YARD_UNIT_LABEL = "Square yard";

  @override
  final String SQUARE_YARD_UNIT_ABBREVIATION = "yd²";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_LABEL = "Australian Dollar";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_ABBREVIATION = "AUD";

  @override
  final String BRAZIL_REAL_UNIT_LABEL = "Brazilian Real";

  @override
  final String BRAZIL_REAL_UNIT_ABBREVIATION = "BRL";

  @override
  final String CANADA_DOLLAR_UNIT_LABEL = "Canadian Dollar";

  @override
  final String CANADA_DOLLAR_UNIT_ABBREVIATION = "CAD";

  @override
  final String EURO_UNIT_LABEL = "Euro";

  @override
  final String EURO_UNIT_ABBREVIATION = "EUR";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_LABEL = "Pound Sterling";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_ABBREVIATION = "GBP";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_LABEL = "New Zealand Dollar";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_ABBREVIATION = "NZD";

  @override
  final String SWITZERLAND_FRANC_UNIT_LABEL = "Swiss Franc";

  @override
  final String SWITZERLAND_FRANC_UNIT_ABBREVIATION = "CHF";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_LABEL = "US Dollar";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_ABBREVIATION = "USD";

  @override
  final String CENTIMETER_UNIT_LABEL = "Centimetre";

  @override
  final String CENTIMETER_UNIT_ABBREVIATION = "cm";

  @override
  final String FOOT_UNIT_LABEL = "Foot";

  @override
  final String FOOT_UNIT_ABBREVIATION = "ft";

  @override
  final String INCH_UNIT_LABEL = "Inch";

  @override
  final String INCH_UNIT_ABBREVIATION = "in";

  @override
  final String KILOMETER_UNIT_LABEL = "Kilometre";

  @override
  final String KILOMETER_UNIT_ABBREVIATION = "km";

  @override
  final String METER_UNIT_LABEL = "Metre";

  @override
  final String METER_UNIT_ABBREVIATION = "m";

  @override
  final String MILE_UNIT_LABEL = "Mile";

  @override
  final String MILE_UNIT_ABBREVIATION = "mi";

  @override
  final String MILLIMETER_UNIT_LABEL = "Millimetre";

  @override
  final String MILLIMETER_UNIT_ABBREVIATION = "mm";

  @override
  final String NAUTICAL_MILE_UNIT_LABEL = "Nautical mile";

  @override
  final String NAUTICAL_MILE_UNIT_ABBREVIATION = "nmi";

  @override
  final String YARD_UNIT_LABEL = "Yard";

  @override
  final String YARD_UNIT_ABBREVIATION = "yd";

  @override
  final String GRAM_UNIT_LABEL = "Gram";

  @override
  final String GRAM_UNIT_ABBREVIATION = "g";

  @override
  final String KILOGRAM_UNIT_LABEL = "Kilogram";

  @override
  final String KILOGRAM_UNIT_ABBREVIATION = "kg";

  @override
  final String MILLIGRAM_UNIT_LABEL = "Milligram";

  @override
  final String MILLIGRAM_UNIT_ABBREVIATION = "mg";

  @override
  final String OUNCE_UNIT_LABEL = "Ounce";

  @override
  final String OUNCE_UNIT_ABBREVIATION = "oz";

  @override
  final String POUND_UNIT_LABEL = "Pound";

  @override
  final String POUND_UNIT_ABBREVIATION = "lb";

  @override
  final String TONNE_UNIT_LABEL = "Tonne";

  @override
  final String TONNE_UNIT_ABBREVIATION = "t";

  @override
  final String BINARY_NUMBER_SYSTEM_LABEL = "Binary";

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
  final String FOOT_PER_SECOND_UNIT_LABEL = "Foot per second";

  @override
  final String FOOT_PER_SECOND_UNIT_ABBREVIATION = "ft/s";

  @override
  final String INCH_PER_SECOND_UNIT_LABEL = "Inch per second";

  @override
  final String INCH_PER_SECOND_UNIT_ABBREVIATION = "in/s";

  @override
  final String METER_PER_SECOND_UNIT_LABEL = "Metre per second";

  @override
  final String METER_PER_SECOND_UNIT_ABBREVIATION = "m/s";

  @override
  final String KILOMETER_PER_SECOND_UNIT_LABEL = "Kilometre per second";

  @override
  final String KILOMETER_PER_SECOND_UNIT_ABBREVIATION = "km/s";

  @override
  final String KILOMETER_PER_HOUR_UNIT_LABEL = "Kilometre per hour";

  @override
  final String KILOMETER_PER_HOUR_UNIT_ABBREVIATION = "km/h";

  @override
  final String MILE_PER_SECOND_UNIT_LABEL = "Mile per second";

  @override
  final String MILE_PER_SECOND_UNIT_ABBREVIATION = "mi/s";

  @override
  final String MILE_PER_HOUR_UNIT_LABEL = "Miles per hour";

  @override
  final String MILE_PER_HOUR_UNIT_ABBREVIATION = "mph";

  @override
  final String KNOT_UNIT_LABEL = "Knot";

  @override
  final String KNOT_UNIT_ABBREVIATION = "kn";

  @override
  final String MACH_UNIT_LABEL = "Mach";

  @override
  final String MACH_UNIT_ABBREVIATION = "Mach";

  @override
  final String LIGHTSPEED_UNIT_LABEL = "Speed of light";

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
  final String MILLISECOND_UNIT_LABEL = "Millisecond";

  @override
  final String MILLISECOND_UNIT_ABBREVIATION = "ms";

  @override
  final String SECOND_UNIT_LABEL = "Second";

  @override
  final String SECOND_UNIT_ABBREVIATION = "s";

  @override
  final String MINUTE_UNIT_LABEL = "Minute";

  @override
  final String MINUTE_UNIT_ABBREVIATION = "min";

  @override
  final String HOUR_UNIT_LABEL = "Hour";

  @override
  final String HOUR_UNIT_ABBREVIATION = "h";

  @override
  final String DAY_UNIT_LABEL = "Day";

  @override
  final String DAY_UNIT_ABBREVIATION = "d";

  @override
  final String WEEK_UNIT_LABEL = "Week";

  @override
  final String WEEK_UNIT_ABBREVIATION = "wk";

  @override
  final String YEAR_UNIT_LABEL = "Year";

  @override
  final String YEAR_UNIT_ABBREVIATION = "yr";

  @override
  final String AREA_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL = "Select area unit";

  @override
  final String CURRENCY_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Select currency unit";

  @override
  final String LENGTH_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Select length unit";

  @override
  final String MASS_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL = "Select mass unit";

  @override
  final String NUMBER_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Select number unit";

  @override
  final String SPEED_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Select speed unit";

  @override
  final String TEMPERATURE_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Select temperature unit";

  @override
  final String TIME_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL = "Select time unit";

  @override
  final String CONVERTER_INPUT_PLACEHOLDER = "Enter a value";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_MESSAGE =
      "Equation history has been cleared";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_DESCRIPTION =
      "Tap restore to keep your equation history";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_ACCESSIBILITY_LABEL =
      "Restore deleted equations";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_TOOLTIP_MESSAGE =
      "Restore equations";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_MESSAGE =
      "Time calculator has been reset";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_DESCRIPTION =
      "Tap restore to keep the time calculator data";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restore time calculator";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restore times";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_MESSAGE =
      "Body Mass Index calculator has been reset";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_DESCRIPTION =
      "Tap restore to keep your Body Mass Index data";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restore Body Mass Index calculator";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restore Body Mass Index";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_MESSAGE =
      "Aggregated time has been reset";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_DESCRIPTION =
      "Tap restore to keep aggregated time";

  @override
  final String
  RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_ACCESSIBILITY_LABEL =
      "Restore aggregated time";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_TOOLTIP_MESSAGE =
      "Restore aggregated time";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_MESSAGE =
      "Area units have been reset";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_DESCRIPTION =
      "Tap restore to keep area units";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restore area units";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restore area units";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_MESSAGE =
      "Text information has been reset";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_DESCRIPTION =
      "Tap restore to keep text information";

  @override
  final String
  RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restore text information";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restore text information";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_MESSAGE =
      "Currency units have been reset";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_DESCRIPTION =
      "Tap restore to keep currency units";

  @override
  final String
  RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restore currency units";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restore currency units";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_MESSAGE =
      "Length units have been reset";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_DESCRIPTION =
      "Tap restore to keep length units";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restore length units";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restore length units";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_MESSAGE =
      "Mass units have been reset";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_DESCRIPTION =
      "Tap restore to keep mass units";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restore mass units";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restore mass units";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_MESSAGE =
      "Number systems have been reset";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_DESCRIPTION =
      "Tap restore to keep number systems";

  @override
  final String
  RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Restore number systems";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_TOOLTIP_MESSAGE =
      "Restore number systems";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_MESSAGE =
      "Speed units have been reset";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_DESCRIPTION =
      "Tap restore to keep speed units";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restore speed units";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restore speed units";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_MESSAGE =
      "Temperature units have been reset";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_DESCRIPTION =
      "Tap restore to keep temperature units";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restore temperature units";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restore temperature units";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_MESSAGE =
      "Time units have been reset";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_DESCRIPTION =
      "Tap restore to keep time units";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restore time units";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restore time units";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_ACCESSIBILITY_LABEL =
      "Retry fetching current currency values";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_TOOLTIP_MESSAGE =
      "Retry fetching";

  @override
  final String CURRENT_CURRENCY_VALUES_LAST_UPDATED_AT_DESCRIPTION =
      "Last updated:";

  @override
  final String CALCULATOR_ADD_BUTTON_ACCESSIBILITY_LABEL =
      "Add addition character to expression";

  @override
  final String CALCULATOR_SUBTRACT_BUTTON_ACCESSIBILITY_LABEL =
      "Add subtraction character to expression";

  @override
  final String CALCULATOR_MULTIPLY_BUTTON_ACCESSIBILITY_LABEL =
      "Add multiplication character to expression";

  @override
  final String CALCULATOR_DIVIDE_BUTTON_ACCESSIBILITY_LABEL =
      "Add division character to expression";

  @override
  final String CALCULATOR_EQUALS_BUTTON_ACCESSIBILITY_LABEL =
      "Evaluate expression";

  @override
  final String CALCULATOR_CLEAR_BUTTON_ACCESSIBILITY_LABEL = "Clear expression";

  @override
  final String CALCULATOR_POINT_BUTTON_ACCESSIBILITY_LABEL =
      "Add decimal point to expression";

  @override
  final String CALCULATOR_LEFT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Add opening bracket to expression";

  @override
  final String CALCULATOR_RIGHT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Add closing bracket to expression";

  @override
  final String CALCULATOR_PERCENTAGE_BUTTON_ACCESSIBILITY_LABEL =
      "Add percentage character to expression";

  @override
  final String CALCULATOR_PI_BUTTON_ACCESSIBILITY_LABEL =
      "Add pi character to expression";

  @override
  final String CALCULATOR_E_BUTTON_ACCESSIBILITY_LABEL =
      "Add e character to expression";

  @override
  final String CALCULATOR_ROOT_BUTTON_ACCESSIBILITY_LABEL =
      "Add root character to expression";

  @override
  final String CALCULATOR_POWER_BUTTON_ACCESSIBILITY_LABEL =
      "Add power character to expression";

  @override
  final String CALCULATOR_FACTORIAL_BUTTON_ACCESSIBILITY_LABEL =
      "Add factorial character to expression";

  @override
  final String CALCULATOR_RECIPROCAL_BUTTON_ACCESSIBILITY_LABEL =
      "Add reciprocal sub-expression to expression";

  @override
  final String CALCULATOR_ZERO_BUTTON_ACCESSIBILITY_LABEL =
      "Add zero to expression";

  @override
  final String CALCULATOR_ONE_BUTTON_ACCESSIBILITY_LABEL =
      "Add one to expression";

  @override
  final String CALCULATOR_TWO_BUTTON_ACCESSIBILITY_LABEL =
      "Add two to expression";

  @override
  final String CALCULATOR_THREE_BUTTON_ACCESSIBILITY_LABEL =
      "Add three to expression";

  @override
  final String CALCULATOR_FOUR_BUTTON_ACCESSIBILITY_LABEL =
      "Add four to expression";

  @override
  final String CALCULATOR_FIVE_BUTTON_ACCESSIBILITY_LABEL =
      "Add five to expression";

  @override
  final String CALCULATOR_SIX_BUTTON_ACCESSIBILITY_LABEL =
      "Add six to expression";

  @override
  final String CALCULATOR_SEVEN_BUTTON_ACCESSIBILITY_LABEL =
      "Add seven to expression";

  @override
  final String CALCULATOR_EIGHT_BUTTON_ACCESSIBILITY_LABEL =
      "Add eight to expression";

  @override
  final String CALCULATOR_NINE_BUTTON_ACCESSIBILITY_LABEL =
      "Add nine to expression";

  @override
  final String CALCULATOR_SHRINK_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Shrink keyboard";

  @override
  final String ADD_UNIT_NEXT_BUTTON_ACCESSIBILITY_LABEL = "Add next unit";

  @override
  final String ADD_UNIT_NEXT_BUTTON_TOOLTIP_MESSAGE = "Add next unit";

  @override
  final String ADD_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Add number system";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Add next number system";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Add next number system";

  @override
  String CURRENT_CURRENCY_VALUES_UPDATED_AT_TIME(
    String paddedCurrentHourOfDay,
    String currentMinuteOfDay,
    String periodOfTheDay,
    String currentMonthOfYear,
    String currentDayOfMonth,
    String currentYear,
  ) {
    return "$paddedCurrentHourOfDay:$currentMinuteOfDay $periodOfTheDay - $currentMonthOfYear/$currentDayOfMonth/$currentYear";
  }
}
