import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";

class ItalianStringsValueObject extends DeviceLanguageStringsValueObject {
  @override
  final String NOT_VALID_EXPRESSION_ERROR_MESSAGE =
      "Errore: l'espressione non è valida";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_NAME = "Convertitore di superficie";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al convertitore di superficie";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_NAME =
      "Calcolatore dell'indice di massa corporea";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al calcolatore dell'indice di massa corporea";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_NAME = "Convertitore di valuta";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al convertitore di valuta";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_NAME = "Convertitore di massa";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al convertitore di massa";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_NAME =
      "Convertitore di sistemi numerici";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al convertitore di sistemi numerici";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_NAME = "Convertitore di velocità";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al convertitore di velocità";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_NAME =
      "Convertitore di temperatura";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al convertitore di temperatura";

  @override
  final String TIME_AGGREGATOR_UTILITY_NAME = "Aggregatore di tempo";

  @override
  final String TIME_AGGREGATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai all'aggregatore di tempo";

  @override
  final String TIME_CALCULATOR_UTILITY_NAME = "Calcolatore di tempo";

  @override
  final String TIME_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al calcolatore di tempo";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_NAME = "Convertitore di tempo";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al convertitore di tempo";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_NAME = "Convertitore di lunghezza";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai al convertitore di lunghezza";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_NAME =
      "Analizzatore di informazioni testuali";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Apri cronologia espressioni";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Apri cronologia espressioni";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Chiudi cronologia espressioni";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Chiudi cronologia espressioni";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Vai all'analizzatore di informazioni testuali";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Mostra pagina calcolatrice";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Mostra pagina utilità";

  @override
  String SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(String unitName) {
    return "Seleziona \"$unitName\" come unità di base";
  }

  @override
  String SELECT_UNIT_ELEMENT_TOOLTIP_MESSAGE(String unitName) {
    return "Seleziona $unitName come base";
  }

  @override
  final String REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE = "Rimuovi unità";

  @override
  final String REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL =
      "Rimuovi unità di misura";

  @override
  final String ADD_UNIT_BUTTON_ACCESSIBILITY_LABEL = "Aggiungi unità di misura";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_TITLE = "Calcolatrice";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_TITLE = "Utilità";

  @override
  final String ADD_UNIT_BUTTON_TOOLTIP_MESSAGE = "Aggiungi unità";

  @override
  final String CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE = "Risultato";

  @override
  final String LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_TITLE =
      "Cronologia";

  @override
  String TEXT_INFORMATION_BREAKDOWN(String amountOfWords, String length) {
    return "$amountOfWords parole e $length caratteri";
  }

  @override
  final String BACK_BUTTON_ACCESSIBILITY_LABEL =
      "Torna alla schermata precedente";

  @override
  final String RESET_BUTTON_ACCESSIBILITY_LABEL = "Annulla modifiche";

  @override
  final String TEXT_AREA_PLACEHOLDER = "Scrivi qui il testo";

  @override
  final String TIME_HOUR_INPUT_TITLE = "Ore";

  @override
  final String TIME_MINUTE_INPUT_TITLE = "Minuti";

  @override
  final String TIME_SECOND_INPUT_TITLE = "Secondi";

  @override
  String CALCULATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "Il risultato è $hours:$minutes:$seconds";
  }

  @override
  final String ADD_BUTTON_TITLE = "Aggiungi";

  @override
  final String SUBTRACT_BUTTON_TITLE = "Sottrai";

  @override
  final String ADD_TIME_BUTTON_ACCESSIBILITY_LABEL =
      "Esegui addizione sulle ore";

  @override
  final String SUBTRACT_TIME_BUTTON_ACCESSIBILITY_LABEL =
      "Esegui sottrazione sulle ore";

  @override
  final String WEIGHT_INPUT_TITLE = "Peso (in kg)";

  @override
  final String HEIGHT_INPUT_TITLE = "Altezza (in cm)";

  @override
  final String AGE_INPUT_PLACEHOLDER = "Inserisci l'età";

  @override
  final String WEIGHT_INPUT_PLACEHOLDER = "Inserisci il peso";

  @override
  final String HEIGHT_INPUT_PLACEHOLDER = "Inserisci l'altezza";

  @override
  String BODY_MASS_INDEX_RESULT(String value, String category) {
    return "Il tuo indice di massa corporea è: $value; $category";
  }

  @override
  final String UNDERWEIGHT_CATEGORY = "Sottopeso";

  @override
  final String NORMAL_WEIGHT_CATEGORY = "Normopeso";

  @override
  final String OVERWEIGHT_CATEGORY = "Sovrappeso";

  @override
  final String OBESE_CATEGORY = "Obeso";

  @override
  final String CALCULATE_BUTTON_TITLE = "Calcola";

  @override
  final String CALCULATE_BODY_MASS_INDEX_BUTTON_ACCESSIBILITY_LABEL =
      "Calcola indice di massa corporea";

  @override
  String CALCULATOR_CHARACTER_BUTTON_ACCESSIBILITY_LABEL(String character) {
    return "Aggiungi \"$character\" all'espressione";
  }

  @override
  final String CALCULATOR_CLEAN_BUTTON_ACCESSIBILITY_LABEL =
      "Cancella espressione";

  @override
  final String CALCULATOR_BACKSPACE_BUTTON_ACCESSIBILITY_LABEL =
      "Rimuovi l'ultimo carattere dall'espressione";

  @override
  final String CALCULATOR_EQUAL_BUTTON_ACCESSIBILITY_LABEL =
      "Valuta espressione";

  @override
  final String CALCULATOR_EXPAND_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Espandi tastiera";

  @override
  final String FOREGROUND_BACKDROP_ACCESSIBILITY_LABEL = "Chiudi finestra";

  @override
  final String LOADING_INDICATOR_ACCESSIBILITY_LABEL =
      "Attendere, caricamento dei contenuti";

  @override
  final String BACK_BUTTON_TOOLTIP_MESSAGE = "Indietro";

  @override
  final String RESET_BUTTON_TOOLTIP_MESSAGE = "Annulla modifiche";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL = "Binario";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT = "BIN";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL =
      "Seleziona binario come sistema numerico di base";

  @override
  final String NUMBER_SYSTEM_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleziona sistema numerico";

  @override
  final String
  CLEAN_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_BUTTON_ACCESSIBILITY_LABEL =
      "Cancella cronologia";

  @override
  final String EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL =
      "Ripristina espressione";

  @override
  String AGGREGATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "Il totale è $hours:$minutes:$seconds";
  }

  @override
  String ADD_TIME_NEXT_BUTTON_ACCESSIBILITY_LABEL = "Aggiungi tempo successivo";

  @override
  String ADD_TIME_NEXT_BUTTON_TOOLTIP_MESSAGE = "Aggiungi tempo successivo";

  @override
  String REMOVE_TIME_BUTTON_ACCESSIBILITY_LABEL = "Rimuovi tempo";

  @override
  String REMOVE_TIME_BUTTON_TOOLTIP_MESSAGE = "Rimuovi tempo";

  @override
  String BASE_UNIT_LABEL = "Unità di base";

  @override
  final String ACRE_UNIT_LABEL = "Acro";

  @override
  final String ACRE_UNIT_ABBREVIATION = "ac";

  @override
  final String HECTARE_UNIT_LABEL = "Ettaro";

  @override
  final String HECTARE_UNIT_ABBREVIATION = "ha";

  @override
  final String SQUARE_CENTIMETER_UNIT_LABEL = "Centimetro quadrato";

  @override
  final String SQUARE_CENTIMETER_UNIT_ABBREVIATION = "cm²";

  @override
  final String SQUARE_FOOT_UNIT_LABEL = "Piede quadrato";

  @override
  final String SQUARE_FOOT_UNIT_ABBREVIATION = "ft²";

  @override
  final String SQUARE_INCH_UNIT_LABEL = "Pollice quadrato";

  @override
  final String SQUARE_INCH_UNIT_ABBREVIATION = "in²";

  @override
  final String SQUARE_KILOMETER_UNIT_LABEL = "Chilometro quadrato";

  @override
  final String SQUARE_KILOMETER_UNIT_ABBREVIATION = "km²";

  @override
  final String SQUARE_METER_UNIT_LABEL = "Metro quadrato";

  @override
  final String SQUARE_METER_UNIT_ABBREVIATION = "m²";

  @override
  final String SQUARE_MILE_UNIT_LABEL = "Miglio quadrato";

  @override
  final String SQUARE_MILE_UNIT_ABBREVIATION = "mi²";

  @override
  final String SQUARE_MILLIMETER_UNIT_LABEL = "Millimetro quadrato";

  @override
  final String SQUARE_MILLIMETER_UNIT_ABBREVIATION = "mm²";

  @override
  final String SQUARE_YARD_UNIT_LABEL = "Iarda quadrata";

  @override
  final String SQUARE_YARD_UNIT_ABBREVIATION = "yd²";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_LABEL = "Dollaro australiano";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_ABBREVIATION = "AUD";

  @override
  final String BRAZIL_REAL_UNIT_LABEL = "Real brasiliano";

  @override
  final String BRAZIL_REAL_UNIT_ABBREVIATION = "BRL";

  @override
  final String CANADA_DOLLAR_UNIT_LABEL = "Dollaro canadese";

  @override
  final String CANADA_DOLLAR_UNIT_ABBREVIATION = "CAD";

  @override
  final String EURO_UNIT_LABEL = "Euro";

  @override
  final String EURO_UNIT_ABBREVIATION = "EUR";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_LABEL = "Sterlina britannica";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_ABBREVIATION = "GBP";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_LABEL = "Dollaro neozelandese";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_ABBREVIATION = "NZD";

  @override
  final String SWITZERLAND_FRANC_UNIT_LABEL = "Franco svizzero";

  @override
  final String SWITZERLAND_FRANC_UNIT_ABBREVIATION = "CHF";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_LABEL = "Dollaro statunitense";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_ABBREVIATION = "USD";

  @override
  final String CENTIMETER_UNIT_LABEL = "Centimetro";

  @override
  final String CENTIMETER_UNIT_ABBREVIATION = "cm";

  @override
  final String FOOT_UNIT_LABEL = "Piede";

  @override
  final String FOOT_UNIT_ABBREVIATION = "ft";

  @override
  final String INCH_UNIT_LABEL = "Pollice";

  @override
  final String INCH_UNIT_ABBREVIATION = "in";

  @override
  final String KILOMETER_UNIT_LABEL = "Chilometro";

  @override
  final String KILOMETER_UNIT_ABBREVIATION = "km";

  @override
  final String METER_UNIT_LABEL = "Metro";

  @override
  final String METER_UNIT_ABBREVIATION = "m";

  @override
  final String MILE_UNIT_LABEL = "Miglio";

  @override
  final String MILE_UNIT_ABBREVIATION = "mi";

  @override
  final String MILLIMETER_UNIT_LABEL = "Millimetro";

  @override
  final String MILLIMETER_UNIT_ABBREVIATION = "mm";

  @override
  final String NAUTICAL_MILE_UNIT_LABEL = "Miglio nautico";

  @override
  final String NAUTICAL_MILE_UNIT_ABBREVIATION = "nmi";

  @override
  final String YARD_UNIT_LABEL = "Iarda";

  @override
  final String YARD_UNIT_ABBREVIATION = "yd";

  @override
  final String GRAM_UNIT_LABEL = "Grammo";

  @override
  final String GRAM_UNIT_ABBREVIATION = "g";

  @override
  final String KILOGRAM_UNIT_LABEL = "Chilogrammo";

  @override
  final String KILOGRAM_UNIT_ABBREVIATION = "kg";

  @override
  final String MILLIGRAM_UNIT_LABEL = "Milligrammo";

  @override
  final String MILLIGRAM_UNIT_ABBREVIATION = "mg";

  @override
  final String OUNCE_UNIT_LABEL = "Oncia";

  @override
  final String OUNCE_UNIT_ABBREVIATION = "oz";

  @override
  final String POUND_UNIT_LABEL = "Libbra";

  @override
  final String POUND_UNIT_ABBREVIATION = "lb";

  @override
  final String TONNE_UNIT_LABEL = "Tonnellata";

  @override
  final String TONNE_UNIT_ABBREVIATION = "t";

  @override
  final String BINARY_NUMBER_SYSTEM_LABEL = "Binario";

  @override
  final String BINARY_NUMBER_SYSTEM_ABBREVIATION = "BIN";

  @override
  final String OCTAL_NUMBER_SYSTEM_LABEL = "Ottale";

  @override
  final String OCTAL_NUMBER_SYSTEM_ABBREVIATION = "OCT";

  @override
  final String DECIMAL_NUMBER_SYSTEM_LABEL = "Decimale";

  @override
  final String DECIMAL_NUMBER_SYSTEM_ABBREVIATION = "DEC";

  @override
  final String HEXADECIMAL_NUMBER_SYSTEM_LABEL = "Esadecimale";

  @override
  final String HEXADECIMAL_NUMBER_SYSTEM_ABBREVIATION = "HEX";

  @override
  final String FOOT_PER_SECOND_UNIT_LABEL = "Piedi al secondo";

  @override
  final String FOOT_PER_SECOND_UNIT_ABBREVIATION = "ft/s";

  @override
  final String INCH_PER_SECOND_UNIT_LABEL = "Pollici al secondo";

  @override
  final String INCH_PER_SECOND_UNIT_ABBREVIATION = "in/s";

  @override
  final String METER_PER_SECOND_UNIT_LABEL = "Metri al secondo";

  @override
  final String METER_PER_SECOND_UNIT_ABBREVIATION = "m/s";

  @override
  final String KILOMETER_PER_SECOND_UNIT_LABEL = "Chilometri al secondo";

  @override
  final String KILOMETER_PER_SECOND_UNIT_ABBREVIATION = "km/s";

  @override
  final String KILOMETER_PER_HOUR_UNIT_LABEL = "Chilometri orari";

  @override
  final String KILOMETER_PER_HOUR_UNIT_ABBREVIATION = "km/h";

  @override
  final String MILE_PER_SECOND_UNIT_LABEL = "Miglia al secondo";

  @override
  final String MILE_PER_SECOND_UNIT_ABBREVIATION = "mi/s";

  @override
  final String MILE_PER_HOUR_UNIT_LABEL = "Miglia orarie";

  @override
  final String MILE_PER_HOUR_UNIT_ABBREVIATION = "mph";

  @override
  final String KNOT_UNIT_LABEL = "Nodo";

  @override
  final String KNOT_UNIT_ABBREVIATION = "kn";

  @override
  final String MACH_UNIT_LABEL = "Mach";

  @override
  final String MACH_UNIT_ABBREVIATION = "Mach";

  @override
  final String LIGHTSPEED_UNIT_LABEL = "Velocità della luce";

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
  final String MILLISECOND_UNIT_LABEL = "Millisecondo";

  @override
  final String MILLISECOND_UNIT_ABBREVIATION = "ms";

  @override
  final String SECOND_UNIT_LABEL = "Secondo";

  @override
  final String SECOND_UNIT_ABBREVIATION = "s";

  @override
  final String MINUTE_UNIT_LABEL = "Minuto";

  @override
  final String MINUTE_UNIT_ABBREVIATION = "min";

  @override
  final String HOUR_UNIT_LABEL = "Ora";

  @override
  final String HOUR_UNIT_ABBREVIATION = "h";

  @override
  final String DAY_UNIT_LABEL = "Giorno";

  @override
  final String DAY_UNIT_ABBREVIATION = "d";

  @override
  final String WEEK_UNIT_LABEL = "Settimana";

  @override
  final String WEEK_UNIT_ABBREVIATION = "sett";

  @override
  final String YEAR_UNIT_LABEL = "Anno";

  @override
  final String YEAR_UNIT_ABBREVIATION = "anno";

  @override
  final String AREA_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleziona unità di superficie";

  @override
  final String CURRENCY_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleziona unità di valuta";

  @override
  final String LENGTH_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleziona unità di lunghezza";

  @override
  final String MASS_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleziona unità di massa";

  @override
  final String NUMBER_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleziona unità numerica";

  @override
  final String SPEED_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleziona unità di velocità";

  @override
  final String TEMPERATURE_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleziona unità di temperatura";

  @override
  final String TIME_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Seleziona unità di tempo";

  @override
  final String CONVERTER_INPUT_PLACEHOLDER = "Inserisci un valore";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_MESSAGE =
      "La cronologia delle equazioni è stata cancellata";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_DESCRIPTION =
      "Tocca ripristina per mantenere la cronologia delle equazioni";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina equazioni eliminate";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina equazioni";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_MESSAGE =
      "Il calcolatore di tempo è stato resettato";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_DESCRIPTION =
      "Tocca ripristina per mantenere i dati del calcolatore di tempo";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina calcolatore di tempo";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina orari";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_MESSAGE =
      "Il calcolatore dell'indice di massa corporea è stato resettato";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_DESCRIPTION =
      "Tocca ripristina per mantenere i dati dell'indice di massa corporea";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina calcolatore dell'indice di massa corporea";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina indice di massa corporea";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_MESSAGE =
      "Il tempo aggregato è stato resettato";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_DESCRIPTION =
      "Tocca ripristina per mantenere il tempo aggregato";

  @override
  final String
  RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina tempo aggregato";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina tempo aggregato";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_MESSAGE =
      "Le unità di superficie sono state resettate";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_DESCRIPTION =
      "Tocca ripristina per mantenere le unità di superficie";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina unità di superficie";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina unità di superficie";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_MESSAGE =
      "Le informazioni testuali sono state resettate";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_DESCRIPTION =
      "Tocca ripristina per mantenere le informazioni testuali";

  @override
  final String
  RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina informazioni testuali";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina informazioni testuali";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_MESSAGE =
      "Le unità di valuta sono state resettate";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_DESCRIPTION =
      "Tocca ripristina per mantenere le unità di valuta";

  @override
  final String
  RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina unità di valuta";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina unità di valuta";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_MESSAGE =
      "Le unità di lunghezza sono state resettate";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_DESCRIPTION =
      "Tocca ripristina per mantenere le unità di lunghezza";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina unità di lunghezza";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina unità di lunghezza";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_MESSAGE =
      "Le unità di massa sono state resettate";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_DESCRIPTION =
      "Tocca ripristina per mantenere le unità di massa";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina unità di massa";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina unità di massa";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_MESSAGE =
      "I sistemi numerici sono stati resettati";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_DESCRIPTION =
      "Tocca ripristina per mantenere i sistemi numerici";

  @override
  final String
  RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina sistemi numerici";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina sistemi numerici";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_MESSAGE =
      "Le unità di velocità sono state resettate";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_DESCRIPTION =
      "Tocca ripristina per mantenere le unità di velocità";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina unità di velocità";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina unità di velocità";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_MESSAGE =
      "Le unità di temperatura sono state resettate";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_DESCRIPTION =
      "Tocca ripristina per mantenere le unità di temperatura";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina unità di temperatura";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina unità di temperatura";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_MESSAGE =
      "Le unità di tempo sono state resettate";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_DESCRIPTION =
      "Tocca ripristina per mantenere le unità di tempo";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Ripristina unità di tempo";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Ripristina unità di tempo";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_ACCESSIBILITY_LABEL =
      "Riprova a scaricare i valori attuali delle valute";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_TOOLTIP_MESSAGE = "Riprova";

  @override
  final String CURRENT_CURRENCY_VALUES_LAST_UPDATED_AT_DESCRIPTION =
      "Ultimo aggiornamento:";

  @override
  final String CALCULATOR_ADD_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere addizione all'espressione";

  @override
  final String CALCULATOR_SUBTRACT_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere sottrazione all'espressione";

  @override
  final String CALCULATOR_MULTIPLY_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere moltiplicazione all'espressione";

  @override
  final String CALCULATOR_DIVIDE_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere divisione all'espressione";

  @override
  final String CALCULATOR_EQUALS_BUTTON_ACCESSIBILITY_LABEL =
      "Valuta espressione";

  @override
  final String CALCULATOR_CLEAR_BUTTON_ACCESSIBILITY_LABEL =
      "Cancella espressione";

  @override
  final String CALCULATOR_POINT_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi punto decimale all'espressione";

  @override
  final String CALCULATOR_LEFT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi parentesi aperta all'espressione";

  @override
  final String CALCULATOR_RIGHT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi parentesi chiusa all'espressione";

  @override
  final String CALCULATOR_PERCENTAGE_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere percentuale all'espressione";

  @override
  final String CALCULATOR_PI_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere pi greco all'espressione";

  @override
  final String CALCULATOR_E_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere e all'espressione";

  @override
  final String CALCULATOR_ROOT_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere radice all'espressione";

  @override
  final String CALCULATOR_POWER_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere potenza all'espressione";

  @override
  final String CALCULATOR_FACTORIAL_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi carattere fattoriale all'espressione";

  @override
  final String CALCULATOR_RECIPROCAL_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi sotto-espressione reciproca all'espressione";

  @override
  final String CALCULATOR_ZERO_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi zero all'espressione";

  @override
  final String CALCULATOR_ONE_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi uno all'espressione";

  @override
  final String CALCULATOR_TWO_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi due all'espressione";

  @override
  final String CALCULATOR_THREE_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi tre all'espressione";

  @override
  final String CALCULATOR_FOUR_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi quattro all'espressione";

  @override
  final String CALCULATOR_FIVE_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi cinque all'espressione";

  @override
  final String CALCULATOR_SIX_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi sei all'espressione";

  @override
  final String CALCULATOR_SEVEN_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi sette all'espressione";

  @override
  final String CALCULATOR_EIGHT_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi otto all'espressione";

  @override
  final String CALCULATOR_NINE_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi nove all'espressione";

  @override
  final String CALCULATOR_SHRINK_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Riduci tastiera";

  @override
  final String ADD_UNIT_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi unità successiva";

  @override
  final String ADD_UNIT_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Aggiungi unità successiva";

  @override
  final String ADD_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi sistema numerico";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Aggiungi sistema numerico successivo";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Aggiungi sistema numerico successivo";

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
