import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";

class GermanStringsValueObject extends DeviceLanguageStringsValueObject {
  @override
  final String NOT_VALID_EXPRESSION_ERROR_MESSAGE =
      "Fehler: Das ist kein gültiger Ausdruck";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_NAME = "Flächenumrechner";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Flächenumrechner gehen";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_NAME =
      "Body-Mass-Index-Rechner";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Body-Mass-Index-Rechner gehen";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_NAME = "Währungsumrechner";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Währungsumrechner gehen";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_NAME = "Massenumrechner";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Massenumrechner gehen";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_NAME = "Zahlensystem-Umrechner";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Zahlensystem-Umrechner gehen";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_NAME = "Geschwindigkeitsumrechner";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Geschwindigkeitsumrechner gehen";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_NAME = "Temperaturumrechner";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Temperaturumrechner gehen";

  @override
  final String TIME_AGGREGATOR_UTILITY_NAME = "Zeitsammler";

  @override
  final String TIME_AGGREGATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Zeitsammler gehen";

  @override
  final String TIME_CALCULATOR_UTILITY_NAME = "Zeitrechner";

  @override
  final String TIME_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Zeitrechner gehen";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_NAME = "Zeitumrechner";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Zeitumrechner gehen";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_NAME = "Längenumrechner";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Längenumrechner gehen";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_NAME = "Textinformations-Parser";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Verlauf öffnen";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Verlauf öffnen";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Verlauf schließen";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Verlauf schließen";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Zum Textinformations-Parser gehen";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Rechnerseite anzeigen";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Werkzeugseite anzeigen";

  @override
  String SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(String unitName) {
    return "\"$unitName\" als Basiseinheit auswählen";
  }

  @override
  String SELECT_UNIT_ELEMENT_TOOLTIP_MESSAGE(String unitName) {
    return "$unitName als Basis auswählen";
  }

  @override
  final String REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE = "Einheit entfernen";

  @override
  final String REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL = "Maßeinheit entfernen";

  @override
  final String ADD_UNIT_BUTTON_ACCESSIBILITY_LABEL = "Maßeinheit hinzufügen";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_TITLE = "Rechner";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_TITLE = "Werkzeuge";

  @override
  final String ADD_UNIT_BUTTON_TOOLTIP_MESSAGE = "Einheit hinzufügen";

  @override
  final String CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE = "Ergebnis";

  @override
  final String LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_TITLE = "Verlauf";

  @override
  String TEXT_INFORMATION_BREAKDOWN(String amountOfWords, String length) {
    return "$amountOfWords Wörter und $length Zeichen";
  }

  @override
  final String BACK_BUTTON_ACCESSIBILITY_LABEL =
      "Zum vorherigen Bildschirm zurückkehren";

  @override
  final String RESET_BUTTON_ACCESSIBILITY_LABEL = "Änderungen zurücksetzen";

  @override
  final String TEXT_AREA_PLACEHOLDER = "Geben Sie hier Text ein";

  @override
  final String TIME_HOUR_INPUT_TITLE = "Stunden";

  @override
  final String TIME_MINUTE_INPUT_TITLE = "Minuten";

  @override
  final String TIME_SECOND_INPUT_TITLE = "Sekunden";

  @override
  String CALCULATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "Das Ergebnis ist $hours:$minutes:$seconds";
  }

  @override
  final String ADD_BUTTON_TITLE = "Hinzufügen";

  @override
  final String SUBTRACT_BUTTON_TITLE = "Abziehen";

  @override
  final String ADD_TIME_BUTTON_ACCESSIBILITY_LABEL = "Stunden addieren";

  @override
  final String SUBTRACT_TIME_BUTTON_ACCESSIBILITY_LABEL =
      "Stunden subtrahieren";

  @override
  final String WEIGHT_INPUT_TITLE = "Gewicht (in kg)";

  @override
  final String HEIGHT_INPUT_TITLE = "Größe (in cm)";

  @override
  final String AGE_INPUT_PLACEHOLDER = "Alter eingeben";

  @override
  final String WEIGHT_INPUT_PLACEHOLDER = "Gewicht eingeben";

  @override
  final String HEIGHT_INPUT_PLACEHOLDER = "Größe eingeben";

  @override
  String BODY_MASS_INDEX_RESULT(String value, String category) {
    return "Ihr Body-Mass-Index ist: $value; $category";
  }

  @override
  final String UNDERWEIGHT_CATEGORY = "Untergewicht";

  @override
  final String NORMAL_WEIGHT_CATEGORY = "Normalgewicht";

  @override
  final String OVERWEIGHT_CATEGORY = "Übergewicht";

  @override
  final String OBESE_CATEGORY = "Adipositas";

  @override
  final String CALCULATE_BUTTON_TITLE = "Berechnen";

  @override
  final String CALCULATE_BODY_MASS_INDEX_BUTTON_ACCESSIBILITY_LABEL =
      "Body-Mass-Index berechnen";

  @override
  String CALCULATOR_CHARACTER_BUTTON_ACCESSIBILITY_LABEL(String character) {
    return "\"$character\" zum Ausdruck hinzufügen";
  }

  @override
  final String CALCULATOR_CLEAN_BUTTON_ACCESSIBILITY_LABEL = "Ausdruck löschen";

  @override
  final String CALCULATOR_BACKSPACE_BUTTON_ACCESSIBILITY_LABEL =
      "Letztes Zeichen aus dem Ausdruck entfernen";

  @override
  final String CALCULATOR_EQUAL_BUTTON_ACCESSIBILITY_LABEL =
      "Ausdruck auswerten";

  @override
  final String CALCULATOR_EXPAND_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Tastatur erweitern";

  @override
  final String FOREGROUND_BACKDROP_ACCESSIBILITY_LABEL = "Dialog schließen";

  @override
  final String LOADING_INDICATOR_ACCESSIBILITY_LABEL =
      "Bitte warten, Inhalt wird geladen";

  @override
  final String BACK_BUTTON_TOOLTIP_MESSAGE = "Zurück";

  @override
  final String RESET_BUTTON_TOOLTIP_MESSAGE = "Änderungen zurücksetzen";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL = "Binär";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT = "BIN";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL =
      "Binär als Basiszahlensystem auswählen";

  @override
  final String NUMBER_SYSTEM_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Zahlensystem auswählen";

  @override
  final String
  CLEAN_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_BUTTON_ACCESSIBILITY_LABEL =
      "Verlauf löschen";

  @override
  final String EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL =
      "Ausdruck wiederherstellen";

  @override
  String AGGREGATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "Die Gesamtsumme ist $hours:$minutes:$seconds";
  }

  @override
  String ADD_TIME_NEXT_BUTTON_ACCESSIBILITY_LABEL = "Nächste Zeit hinzufügen";

  @override
  String ADD_TIME_NEXT_BUTTON_TOOLTIP_MESSAGE = "Nächste Zeit hinzufügen";

  @override
  String REMOVE_TIME_BUTTON_ACCESSIBILITY_LABEL = "Zeit entfernen";

  @override
  String REMOVE_TIME_BUTTON_TOOLTIP_MESSAGE = "Zeit entfernen";

  @override
  String BASE_UNIT_LABEL = "Basiseinheit";

  @override
  final String ACRE_UNIT_LABEL = "Acre";

  @override
  final String ACRE_UNIT_ABBREVIATION = "ac";

  @override
  final String HECTARE_UNIT_LABEL = "Hektar";

  @override
  final String HECTARE_UNIT_ABBREVIATION = "ha";

  @override
  final String SQUARE_CENTIMETER_UNIT_LABEL = "Quadratzentimeter";

  @override
  final String SQUARE_CENTIMETER_UNIT_ABBREVIATION = "cm²";

  @override
  final String SQUARE_FOOT_UNIT_LABEL = "Quadratfuß";

  @override
  final String SQUARE_FOOT_UNIT_ABBREVIATION = "ft²";

  @override
  final String SQUARE_INCH_UNIT_LABEL = "Quadratzoll";

  @override
  final String SQUARE_INCH_UNIT_ABBREVIATION = "in²";

  @override
  final String SQUARE_KILOMETER_UNIT_LABEL = "Quadratkilometer";

  @override
  final String SQUARE_KILOMETER_UNIT_ABBREVIATION = "km²";

  @override
  final String SQUARE_METER_UNIT_LABEL = "Quadratmeter";

  @override
  final String SQUARE_METER_UNIT_ABBREVIATION = "m²";

  @override
  final String SQUARE_MILE_UNIT_LABEL = "Quadratmeile";

  @override
  final String SQUARE_MILE_UNIT_ABBREVIATION = "mi²";

  @override
  final String SQUARE_MILLIMETER_UNIT_LABEL = "Quadratmillimeter";

  @override
  final String SQUARE_MILLIMETER_UNIT_ABBREVIATION = "mm²";

  @override
  final String SQUARE_YARD_UNIT_LABEL = "Quadratyard";

  @override
  final String SQUARE_YARD_UNIT_ABBREVIATION = "yd²";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_LABEL = "Australischer Dollar";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_ABBREVIATION = "AUD";

  @override
  final String BRAZIL_REAL_UNIT_LABEL = "Brasilianischer Real";

  @override
  final String BRAZIL_REAL_UNIT_ABBREVIATION = "BRL";

  @override
  final String CANADA_DOLLAR_UNIT_LABEL = "Kanadischer Dollar";

  @override
  final String CANADA_DOLLAR_UNIT_ABBREVIATION = "CAD";

  @override
  final String EURO_UNIT_LABEL = "Euro";

  @override
  final String EURO_UNIT_ABBREVIATION = "EUR";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_LABEL = "Britische Pfund";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_ABBREVIATION = "GBP";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_LABEL = "Neuseeland-Dollar";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_ABBREVIATION = "NZD";

  @override
  final String SWITZERLAND_FRANC_UNIT_LABEL = "Schweizer Franken";

  @override
  final String SWITZERLAND_FRANC_UNIT_ABBREVIATION = "CHF";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_LABEL = "US-Dollar";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_ABBREVIATION = "USD";

  @override
  final String CENTIMETER_UNIT_LABEL = "Zentimeter";

  @override
  final String CENTIMETER_UNIT_ABBREVIATION = "cm";

  @override
  final String FOOT_UNIT_LABEL = "Fuß";

  @override
  final String FOOT_UNIT_ABBREVIATION = "ft";

  @override
  final String INCH_UNIT_LABEL = "Zoll";

  @override
  final String INCH_UNIT_ABBREVIATION = "in";

  @override
  final String KILOMETER_UNIT_LABEL = "Kilometer";

  @override
  final String KILOMETER_UNIT_ABBREVIATION = "km";

  @override
  final String METER_UNIT_LABEL = "Meter";

  @override
  final String METER_UNIT_ABBREVIATION = "m";

  @override
  final String MILE_UNIT_LABEL = "Meile";

  @override
  final String MILE_UNIT_ABBREVIATION = "mi";

  @override
  final String MILLIMETER_UNIT_LABEL = "Millimeter";

  @override
  final String MILLIMETER_UNIT_ABBREVIATION = "mm";

  @override
  final String NAUTICAL_MILE_UNIT_LABEL = "Seemeile";

  @override
  final String NAUTICAL_MILE_UNIT_ABBREVIATION = "nmi";

  @override
  final String YARD_UNIT_LABEL = "Yard";

  @override
  final String YARD_UNIT_ABBREVIATION = "yd";

  @override
  final String GRAM_UNIT_LABEL = "Gramm";

  @override
  final String GRAM_UNIT_ABBREVIATION = "g";

  @override
  final String KILOGRAM_UNIT_LABEL = "Kilogramm";

  @override
  final String KILOGRAM_UNIT_ABBREVIATION = "kg";

  @override
  final String MILLIGRAM_UNIT_LABEL = "Milligramm";

  @override
  final String MILLIGRAM_UNIT_ABBREVIATION = "mg";

  @override
  final String OUNCE_UNIT_LABEL = "Unze";

  @override
  final String OUNCE_UNIT_ABBREVIATION = "oz";

  @override
  final String POUND_UNIT_LABEL = "Pfund";

  @override
  final String POUND_UNIT_ABBREVIATION = "lb";

  @override
  final String TONNE_UNIT_LABEL = "Tonne";

  @override
  final String TONNE_UNIT_ABBREVIATION = "t";

  @override
  final String BINARY_NUMBER_SYSTEM_LABEL = "Binär";

  @override
  final String BINARY_NUMBER_SYSTEM_ABBREVIATION = "BIN";

  @override
  final String OCTAL_NUMBER_SYSTEM_LABEL = "Oktal";

  @override
  final String OCTAL_NUMBER_SYSTEM_ABBREVIATION = "OCT";

  @override
  final String DECIMAL_NUMBER_SYSTEM_LABEL = "Dezimal";

  @override
  final String DECIMAL_NUMBER_SYSTEM_ABBREVIATION = "DEC";

  @override
  final String HEXADECIMAL_NUMBER_SYSTEM_LABEL = "Hexadezimal";

  @override
  final String HEXADECIMAL_NUMBER_SYSTEM_ABBREVIATION = "HEX";

  @override
  final String FOOT_PER_SECOND_UNIT_LABEL = "Fuß pro Sekunde";

  @override
  final String FOOT_PER_SECOND_UNIT_ABBREVIATION = "ft/s";

  @override
  final String INCH_PER_SECOND_UNIT_LABEL = "Zoll pro Sekunde";

  @override
  final String INCH_PER_SECOND_UNIT_ABBREVIATION = "in/s";

  @override
  final String METER_PER_SECOND_UNIT_LABEL = "Meter pro Sekunde";

  @override
  final String METER_PER_SECOND_UNIT_ABBREVIATION = "m/s";

  @override
  final String KILOMETER_PER_SECOND_UNIT_LABEL = "Kilometer pro Sekunde";

  @override
  final String KILOMETER_PER_SECOND_UNIT_ABBREVIATION = "km/s";

  @override
  final String KILOMETER_PER_HOUR_UNIT_LABEL = "Kilometer pro Stunde";

  @override
  final String KILOMETER_PER_HOUR_UNIT_ABBREVIATION = "km/h";

  @override
  final String MILE_PER_SECOND_UNIT_LABEL = "Meilen pro Sekunde";

  @override
  final String MILE_PER_SECOND_UNIT_ABBREVIATION = "mi/s";

  @override
  final String MILE_PER_HOUR_UNIT_LABEL = "Meilen pro Stunde";

  @override
  final String MILE_PER_HOUR_UNIT_ABBREVIATION = "mph";

  @override
  final String KNOT_UNIT_LABEL = "Knoten";

  @override
  final String KNOT_UNIT_ABBREVIATION = "kn";

  @override
  final String MACH_UNIT_LABEL = "Mach";

  @override
  final String MACH_UNIT_ABBREVIATION = "Mach";

  @override
  final String LIGHTSPEED_UNIT_LABEL = "Lichtgeschwindigkeit";

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
  final String MILLISECOND_UNIT_LABEL = "Millisekunde";

  @override
  final String MILLISECOND_UNIT_ABBREVIATION = "ms";

  @override
  final String SECOND_UNIT_LABEL = "Sekunde";

  @override
  final String SECOND_UNIT_ABBREVIATION = "s";

  @override
  final String MINUTE_UNIT_LABEL = "Minute";

  @override
  final String MINUTE_UNIT_ABBREVIATION = "min";

  @override
  final String HOUR_UNIT_LABEL = "Stunde";

  @override
  final String HOUR_UNIT_ABBREVIATION = "h";

  @override
  final String DAY_UNIT_LABEL = "Tag";

  @override
  final String DAY_UNIT_ABBREVIATION = "d";

  @override
  final String WEEK_UNIT_LABEL = "Woche";

  @override
  final String WEEK_UNIT_ABBREVIATION = "wk";

  @override
  final String YEAR_UNIT_LABEL = "Jahr";

  @override
  final String YEAR_UNIT_ABBREVIATION = "yr";

  @override
  final String AREA_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Flächeneinheit auswählen";

  @override
  final String CURRENCY_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Währungseinheit auswählen";

  @override
  final String LENGTH_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Längeneinheit auswählen";

  @override
  final String MASS_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Masseneinheit auswählen";

  @override
  final String NUMBER_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Zahleneinheit auswählen";

  @override
  final String SPEED_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Geschwindigkeitseinheit auswählen";

  @override
  final String TEMPERATURE_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Temperatureinheit auswählen";

  @override
  final String TIME_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Zeiteinheit auswählen";

  @override
  final String CONVERTER_INPUT_PLACEHOLDER = "Wert eingeben";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_MESSAGE =
      "Gleichungsverlauf wurde gelöscht";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um Ihren Verlauf zu behalten";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_ACCESSIBILITY_LABEL =
      "Gelöschte Gleichungen wiederherstellen";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_TOOLTIP_MESSAGE =
      "Gleichungen wiederherstellen";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_MESSAGE =
      "Zeitrechner wurde zurückgesetzt";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Zeitrechner-Daten zu behalten";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Zeitrechner wiederherstellen";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Zeiten wiederherstellen";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_MESSAGE =
      "Body-Mass-Index-Rechner wurde zurückgesetzt";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um Ihre Body-Mass-Index-Daten zu behalten";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Body-Mass-Index-Rechner wiederherstellen";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Body-Mass-Index wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_MESSAGE =
      "Gesamte Zeit wurde zurückgesetzt";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die gesamte Zeit zu behalten";

  @override
  final String
  RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_ACCESSIBILITY_LABEL =
      "Gesamte Zeit wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_TOOLTIP_MESSAGE =
      "Gesamte Zeit wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_MESSAGE =
      "Flächeneinheiten wurden zurückgesetzt";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Flächeneinheiten zu behalten";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Flächeneinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Flächeneinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_MESSAGE =
      "Textinformationen wurden zurückgesetzt";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Textinformationen zu behalten";

  @override
  final String
  RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Textinformationen wiederherstellen";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Textinformationen wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_MESSAGE =
      "Währungseinheiten wurden zurückgesetzt";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Währungseinheiten zu behalten";

  @override
  final String
  RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Währungseinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Währungseinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_MESSAGE =
      "Längeneinheiten wurden zurückgesetzt";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Längeneinheiten zu behalten";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Längeneinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Längeneinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_MESSAGE =
      "Masseneinheiten wurden zurückgesetzt";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Masseneinheiten zu behalten";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Masseneinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Masseneinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_MESSAGE =
      "Zahlensysteme wurden zurückgesetzt";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Zahlensysteme zu behalten";

  @override
  final String
  RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Zahlensysteme wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_TOOLTIP_MESSAGE =
      "Zahlensysteme wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_MESSAGE =
      "Geschwindigkeitseinheiten wurden zurückgesetzt";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Geschwindigkeitseinheiten zu behalten";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Geschwindigkeitseinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Geschwindigkeitseinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_MESSAGE =
      "Temperatureinheiten wurden zurückgesetzt";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Temperatureinheiten zu behalten";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Temperatureinheiten wiederherstellen";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Temperatureinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_MESSAGE =
      "Zeiteinheiten wurden zurückgesetzt";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_DESCRIPTION =
      "Tippen Sie auf Wiederherstellen, um die Zeiteinheiten zu behalten";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Zeiteinheiten wiederherstellen";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Zeiteinheiten wiederherstellen";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_ACCESSIBILITY_LABEL =
      "Aktuelle Währungswerte erneut abrufen";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_TOOLTIP_MESSAGE =
      "Erneut versuchen";

  @override
  final String CURRENT_CURRENCY_VALUES_LAST_UPDATED_AT_DESCRIPTION =
      "Zuletzt aktualisiert:";

  @override
  final String CALCULATOR_ADD_BUTTON_ACCESSIBILITY_LABEL =
      "Plus-Zeichen zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_SUBTRACT_BUTTON_ACCESSIBILITY_LABEL =
      "Minus-Zeichen zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_MULTIPLY_BUTTON_ACCESSIBILITY_LABEL =
      "Mal-Zeichen zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_DIVIDE_BUTTON_ACCESSIBILITY_LABEL =
      "Geteilt-Zeichen zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_EQUALS_BUTTON_ACCESSIBILITY_LABEL =
      "Ausdruck auswerten";

  @override
  final String CALCULATOR_CLEAR_BUTTON_ACCESSIBILITY_LABEL = "Ausdruck löschen";

  @override
  final String CALCULATOR_POINT_BUTTON_ACCESSIBILITY_LABEL =
      "Dezimalpunkt zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_LEFT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Klammer auf zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_RIGHT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Klammer zu zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_PERCENTAGE_BUTTON_ACCESSIBILITY_LABEL =
      "Prozentzeichen zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_PI_BUTTON_ACCESSIBILITY_LABEL =
      "Pi zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_E_BUTTON_ACCESSIBILITY_LABEL =
      "e zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_ROOT_BUTTON_ACCESSIBILITY_LABEL =
      "Wurzelzeichen zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_POWER_BUTTON_ACCESSIBILITY_LABEL =
      "Potenzzeichen zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_FACTORIAL_BUTTON_ACCESSIBILITY_LABEL =
      "Fakultätszeichen zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_RECIPROCAL_BUTTON_ACCESSIBILITY_LABEL =
      "Kehrwert-Ausdruck hinzufügen";

  @override
  final String CALCULATOR_ZERO_BUTTON_ACCESSIBILITY_LABEL =
      "Null zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_ONE_BUTTON_ACCESSIBILITY_LABEL =
      "Eins zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_TWO_BUTTON_ACCESSIBILITY_LABEL =
      "Zwei zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_THREE_BUTTON_ACCESSIBILITY_LABEL =
      "Drei zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_FOUR_BUTTON_ACCESSIBILITY_LABEL =
      "Vier zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_FIVE_BUTTON_ACCESSIBILITY_LABEL =
      "Fünf zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_SIX_BUTTON_ACCESSIBILITY_LABEL =
      "Sechs zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_SEVEN_BUTTON_ACCESSIBILITY_LABEL =
      "Sieben zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_EIGHT_BUTTON_ACCESSIBILITY_LABEL =
      "Acht zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_NINE_BUTTON_ACCESSIBILITY_LABEL =
      "Neun zum Ausdruck hinzufügen";

  @override
  final String CALCULATOR_SHRINK_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Tastatur verkleinern";

  @override
  final String ADD_UNIT_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Nächste Einheit hinzufügen";

  @override
  final String ADD_UNIT_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Nächste Einheit hinzufügen";

  @override
  final String ADD_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Zahlensystem hinzufügen";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Nächstes Zahlensystem hinzufügen";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Nächstes Zahlensystem hinzufügen";

  @override
  String CURRENT_CURRENCY_VALUES_UPDATED_AT_TIME(
    String paddedCurrentHourOfDay,
    String currentMinuteOfDay,
    String periodOfTheDay,
    String currentMonthOfYear,
    String currentDayOfMonth,
    String currentYear,
  ) {
    return "$paddedCurrentHourOfDay:$currentMinuteOfDay - $currentDayOfMonth.$currentMonthOfYear.$currentYear";
  }
}
