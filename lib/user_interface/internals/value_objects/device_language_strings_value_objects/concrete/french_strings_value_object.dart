import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";

class FrenchStringsValueObject extends DeviceLanguageStringsValueObject {
  @override
  final String NOT_VALID_EXPRESSION_ERROR_MESSAGE =
      "Erreur : cette expression n'est pas valide";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_NAME = "Convertisseur de surface";

  @override
  final String AREA_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au convertisseur de surface";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_NAME =
      "Calculateur d'indice de masse corporelle";

  @override
  final String BODY_MASS_INDEX_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au calculateur d'indice de masse corporelle";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_NAME =
      "Convertisseur de devises";

  @override
  final String CURRENCY_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au convertisseur de devises";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_NAME = "Convertisseur de masse";

  @override
  final String MASS_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au convertisseur de masse";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_NAME =
      "Convertisseur de base numérique";

  @override
  final String NUMBER_SYSTEM_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au convertisseur de base numérique";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_NAME = "Convertisseur de vitesse";

  @override
  final String SPEED_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au convertisseur de vitesse";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_NAME =
      "Convertisseur de température";

  @override
  final String TEMPERATURE_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au convertisseur de température";

  @override
  final String TIME_AGGREGATOR_UTILITY_NAME = "Agrégateur de temps";

  @override
  final String TIME_AGGREGATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller à l'agrégateur de temps";

  @override
  final String TIME_CALCULATOR_UTILITY_NAME = "Calculateur de temps";

  @override
  final String TIME_CALCULATOR_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au calculateur de temps";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_NAME = "Convertisseur de temps";

  @override
  final String TIME_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au convertisseur de temps";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_NAME = "Convertisseur de longueur";

  @override
  final String LENGTH_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller au convertisseur de longueur";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_NAME =
      "Analyseur d'informations textuelles";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Ouvrir l'historique des expressions";

  @override
  final String EXPAND_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Ouvrir l'historique des expressions";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE =
      "Fermer l'historique des expressions";

  @override
  final String SHRINK_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL =
      "Fermer l'historique des expressions";

  @override
  final String TEXT_INFORMATION_PARSER_UTILITY_BANNER_ACCESSIBILITY_LABEL =
      "Aller à l'analyseur d'informations textuelles";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Afficher la page de la calculatrice";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_ELEMENT_ACCESSIBILITY_LABEL =
      "Afficher la page des utilitaires";

  @override
  String SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(String unitName) {
    return "Sélectionner \"$unitName\" comme unité de base";
  }

  @override
  String SELECT_UNIT_ELEMENT_TOOLTIP_MESSAGE(String unitName) {
    return "Sélectionner $unitName comme base";
  }

  @override
  final String REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE = "Supprimer l'unité";

  @override
  final String REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL =
      "Supprimer l'unité de mesure";

  @override
  final String ADD_UNIT_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter une unité de mesure";

  @override
  final String NAVIGATION_BAR_CALCULATOR_PAGE_TITLE = "Calculatrice";

  @override
  final String NAVIGATION_BAR_UTILITIES_PAGE_TITLE = "Utilitaires";

  @override
  final String ADD_UNIT_BUTTON_TOOLTIP_MESSAGE = "Ajouter l'unité";

  @override
  final String CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE = "Résultat";

  @override
  final String LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_TITLE =
      "Historique";

  @override
  String TEXT_INFORMATION_BREAKDOWN(String amountOfWords, String length) {
    return "$amountOfWords mots et $length caractères";
  }

  @override
  final String BACK_BUTTON_ACCESSIBILITY_LABEL = "Revenir à l'écran précédent";

  @override
  final String RESET_BUTTON_ACCESSIBILITY_LABEL =
      "Réinitialiser les modifications";

  @override
  final String TEXT_AREA_PLACEHOLDER = "Tapez votre texte ici";

  @override
  final String TIME_HOUR_INPUT_TITLE = "Heures";

  @override
  final String TIME_MINUTE_INPUT_TITLE = "Minutes";

  @override
  final String TIME_SECOND_INPUT_TITLE = "Secondes";

  @override
  String CALCULATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "Le résultat est $hours:$minutes:$seconds";
  }

  @override
  final String ADD_BUTTON_TITLE = "Ajouter";

  @override
  final String SUBTRACT_BUTTON_TITLE = "Soustraire";

  @override
  final String ADD_TIME_BUTTON_ACCESSIBILITY_LABEL =
      "Effectuer une addition sur les heures";

  @override
  final String SUBTRACT_TIME_BUTTON_ACCESSIBILITY_LABEL =
      "Effectuer une soustraction sur les heures";

  @override
  final String WEIGHT_INPUT_TITLE = "Poids (en kg)";

  @override
  final String HEIGHT_INPUT_TITLE = "Taille (en cm)";

  @override
  final String AGE_INPUT_PLACEHOLDER = "Entrez un âge";

  @override
  final String WEIGHT_INPUT_PLACEHOLDER = "Entrez un poids";

  @override
  final String HEIGHT_INPUT_PLACEHOLDER = "Entrez une taille";

  @override
  String BODY_MASS_INDEX_RESULT(String value, String category) {
    return "Votre indice de masse corporelle est : $value ; $category";
  }

  @override
  final String UNDERWEIGHT_CATEGORY = "Insuffisance pondérale";

  @override
  final String NORMAL_WEIGHT_CATEGORY = "Poids normal";

  @override
  final String OVERWEIGHT_CATEGORY = "Surpoids";

  @override
  final String OBESE_CATEGORY = "Obèse";

  @override
  final String CALCULATE_BUTTON_TITLE = "Calculer";

  @override
  final String CALCULATE_BODY_MASS_INDEX_BUTTON_ACCESSIBILITY_LABEL =
      "Calculer l'indice de masse corporelle";

  @override
  String CALCULATOR_CHARACTER_BUTTON_ACCESSIBILITY_LABEL(String character) {
    return "Ajouter \"$character\" à l'expression";
  }

  @override
  final String CALCULATOR_CLEAN_BUTTON_ACCESSIBILITY_LABEL =
      "Effacer l'expression";

  @override
  final String CALCULATOR_BACKSPACE_BUTTON_ACCESSIBILITY_LABEL =
      "Supprimer le dernier caractère de l'expression";

  @override
  final String CALCULATOR_EQUAL_BUTTON_ACCESSIBILITY_LABEL =
      "Évaluer l'expression";

  @override
  final String CALCULATOR_EXPAND_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Agrandir le clavier";

  @override
  final String FOREGROUND_BACKDROP_ACCESSIBILITY_LABEL =
      "Fermer la boîte de dialogue";

  @override
  final String LOADING_INDICATOR_ACCESSIBILITY_LABEL =
      "Veuillez patienter, le contenu est en cours de chargement";

  @override
  final String BACK_BUTTON_TOOLTIP_MESSAGE = "Retourner";

  @override
  final String RESET_BUTTON_TOOLTIP_MESSAGE = "Réinitialiser les modifications";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_LABEL = "Binaire";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_SHORTCUT = "BIN";

  @override
  final String SELECT_BINARY_NUMBER_SYSTEM_DROPDOWN_ITEM_ACCESSIBILITY_LABEL =
      "Sélectionner binaire comme base du système numérique";

  @override
  final String NUMBER_SYSTEM_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Sélectionner le système numérique";

  @override
  final String
  CLEAN_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_BUTTON_ACCESSIBILITY_LABEL =
      "Effacer l'historique";

  @override
  final String EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL =
      "Restaurer l'expression";

  @override
  String AGGREGATED_TIME_RESULT(String hours, String minutes, String seconds) {
    return "Le total est $hours:$minutes:$seconds";
  }

  @override
  String ADD_TIME_NEXT_BUTTON_ACCESSIBILITY_LABEL = "Ajouter la durée suivante";

  @override
  String ADD_TIME_NEXT_BUTTON_TOOLTIP_MESSAGE = "Ajouter la durée suivante";

  @override
  String REMOVE_TIME_BUTTON_ACCESSIBILITY_LABEL = "Supprimer la durée";

  @override
  String REMOVE_TIME_BUTTON_TOOLTIP_MESSAGE = "Supprimer la durée";

  @override
  String BASE_UNIT_LABEL = "Unité de base";

  @override
  final String ACRE_UNIT_LABEL = "Acre";

  @override
  final String ACRE_UNIT_ABBREVIATION = "ac";

  @override
  final String HECTARE_UNIT_LABEL = "Hectare";

  @override
  final String HECTARE_UNIT_ABBREVIATION = "ha";

  @override
  final String SQUARE_CENTIMETER_UNIT_LABEL = "Centimètre carré";

  @override
  final String SQUARE_CENTIMETER_UNIT_ABBREVIATION = "cm²";

  @override
  final String SQUARE_FOOT_UNIT_LABEL = "Pied carré";

  @override
  final String SQUARE_FOOT_UNIT_ABBREVIATION = "ft²";

  @override
  final String SQUARE_INCH_UNIT_LABEL = "Pouce carré";

  @override
  final String SQUARE_INCH_UNIT_ABBREVIATION = "in²";

  @override
  final String SQUARE_KILOMETER_UNIT_LABEL = "Kilomètre carré";

  @override
  final String SQUARE_KILOMETER_UNIT_ABBREVIATION = "km²";

  @override
  final String SQUARE_METER_UNIT_LABEL = "Mètre carré";

  @override
  final String SQUARE_METER_UNIT_ABBREVIATION = "m²";

  @override
  final String SQUARE_MILE_UNIT_LABEL = "Mille carré";

  @override
  final String SQUARE_MILE_UNIT_ABBREVIATION = "mi²";

  @override
  final String SQUARE_MILLIMETER_UNIT_LABEL = "Millimètre carré";

  @override
  final String SQUARE_MILLIMETER_UNIT_ABBREVIATION = "mm²";

  @override
  final String SQUARE_YARD_UNIT_LABEL = "Yard carré";

  @override
  final String SQUARE_YARD_UNIT_ABBREVIATION = "yd²";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_LABEL = "Dollar australien";

  @override
  final String AUSTRALIA_DOLLAR_UNIT_ABBREVIATION = "AUD";

  @override
  final String BRAZIL_REAL_UNIT_LABEL = "Réal brésilien";

  @override
  final String BRAZIL_REAL_UNIT_ABBREVIATION = "BRL";

  @override
  final String CANADA_DOLLAR_UNIT_LABEL = "Dollar canadien";

  @override
  final String CANADA_DOLLAR_UNIT_ABBREVIATION = "CAD";

  @override
  final String EURO_UNIT_LABEL = "Euro";

  @override
  final String EURO_UNIT_ABBREVIATION = "EUR";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_LABEL = "Livre sterling";

  @override
  final String UNITED_KINGDOM_POUND_UNIT_ABBREVIATION = "GBP";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_LABEL = "Dollar néo-zélandais";

  @override
  final String NEW_ZEALAND_DOLLAR_UNIT_ABBREVIATION = "NZD";

  @override
  final String SWITZERLAND_FRANC_UNIT_LABEL = "Franc suisse";

  @override
  final String SWITZERLAND_FRANC_UNIT_ABBREVIATION = "CHF";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_LABEL = "Dollar américain";

  @override
  final String UNITED_STATES_DOLLAR_UNIT_ABBREVIATION = "USD";

  @override
  final String CENTIMETER_UNIT_LABEL = "Centimètre";

  @override
  final String CENTIMETER_UNIT_ABBREVIATION = "cm";

  @override
  final String FOOT_UNIT_LABEL = "Pied";

  @override
  final String FOOT_UNIT_ABBREVIATION = "ft";

  @override
  final String INCH_UNIT_LABEL = "Pouce";

  @override
  final String INCH_UNIT_ABBREVIATION = "in";

  @override
  final String KILOMETER_UNIT_LABEL = "Kilomètre";

  @override
  final String KILOMETER_UNIT_ABBREVIATION = "km";

  @override
  final String METER_UNIT_LABEL = "Mètre";

  @override
  final String METER_UNIT_ABBREVIATION = "m";

  @override
  final String MILE_UNIT_LABEL = "Mille";

  @override
  final String MILE_UNIT_ABBREVIATION = "mi";

  @override
  final String MILLIMETER_UNIT_LABEL = "Millimètre";

  @override
  final String MILLIMETER_UNIT_ABBREVIATION = "mm";

  @override
  final String NAUTICAL_MILE_UNIT_LABEL = "Mille nautique";

  @override
  final String NAUTICAL_MILE_UNIT_ABBREVIATION = "nmi";

  @override
  final String YARD_UNIT_LABEL = "Yard";

  @override
  final String YARD_UNIT_ABBREVIATION = "yd";

  @override
  final String GRAM_UNIT_LABEL = "Gramme";

  @override
  final String GRAM_UNIT_ABBREVIATION = "g";

  @override
  final String KILOGRAM_UNIT_LABEL = "Kilogramme";

  @override
  final String KILOGRAM_UNIT_ABBREVIATION = "kg";

  @override
  final String MILLIGRAM_UNIT_LABEL = "Milligramme";

  @override
  final String MILLIGRAM_UNIT_ABBREVIATION = "mg";

  @override
  final String OUNCE_UNIT_LABEL = "Once";

  @override
  final String OUNCE_UNIT_ABBREVIATION = "oz";

  @override
  final String POUND_UNIT_LABEL = "Livre";

  @override
  final String POUND_UNIT_ABBREVIATION = "lb";

  @override
  final String TONNE_UNIT_LABEL = "Tonne";

  @override
  final String TONNE_UNIT_ABBREVIATION = "t";

  @override
  final String BINARY_NUMBER_SYSTEM_LABEL = "Binaire";

  @override
  final String BINARY_NUMBER_SYSTEM_ABBREVIATION = "BIN";

  @override
  final String OCTAL_NUMBER_SYSTEM_LABEL = "Octal";

  @override
  final String OCTAL_NUMBER_SYSTEM_ABBREVIATION = "OCT";

  @override
  final String DECIMAL_NUMBER_SYSTEM_LABEL = "Décimal";

  @override
  final String DECIMAL_NUMBER_SYSTEM_ABBREVIATION = "DEC";

  @override
  final String HEXADECIMAL_NUMBER_SYSTEM_LABEL = "Hexadécimal";

  @override
  final String HEXADECIMAL_NUMBER_SYSTEM_ABBREVIATION = "HEX";

  @override
  final String FOOT_PER_SECOND_UNIT_LABEL = "Pied par seconde";

  @override
  final String FOOT_PER_SECOND_UNIT_ABBREVIATION = "ft/s";

  @override
  final String INCH_PER_SECOND_UNIT_LABEL = "Pouce par seconde";

  @override
  final String INCH_PER_SECOND_UNIT_ABBREVIATION = "in/s";

  @override
  final String METER_PER_SECOND_UNIT_LABEL = "Mètre par seconde";

  @override
  final String METER_PER_SECOND_UNIT_ABBREVIATION = "m/s";

  @override
  final String KILOMETER_PER_SECOND_UNIT_LABEL = "Kilomètre par seconde";

  @override
  final String KILOMETER_PER_SECOND_UNIT_ABBREVIATION = "km/s";

  @override
  final String KILOMETER_PER_HOUR_UNIT_LABEL = "Kilomètre par heure";

  @override
  final String KILOMETER_PER_HOUR_UNIT_ABBREVIATION = "km/h";

  @override
  final String MILE_PER_SECOND_UNIT_LABEL = "Mille par seconde";

  @override
  final String MILE_PER_SECOND_UNIT_ABBREVIATION = "mi/s";

  @override
  final String MILE_PER_HOUR_UNIT_LABEL = "Milles par heure";

  @override
  final String MILE_PER_HOUR_UNIT_ABBREVIATION = "mph";

  @override
  final String KNOT_UNIT_LABEL = "Nœud";

  @override
  final String KNOT_UNIT_ABBREVIATION = "kn";

  @override
  final String MACH_UNIT_LABEL = "Mach";

  @override
  final String MACH_UNIT_ABBREVIATION = "Mach";

  @override
  final String LIGHTSPEED_UNIT_LABEL = "Vitesse de la lumière";

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
  final String MILLISECOND_UNIT_LABEL = "Milliseconde";

  @override
  final String MILLISECOND_UNIT_ABBREVIATION = "ms";

  @override
  final String SECOND_UNIT_LABEL = "Seconde";

  @override
  final String SECOND_UNIT_ABBREVIATION = "s";

  @override
  final String MINUTE_UNIT_LABEL = "Minute";

  @override
  final String MINUTE_UNIT_ABBREVIATION = "min";

  @override
  final String HOUR_UNIT_LABEL = "Heure";

  @override
  final String HOUR_UNIT_ABBREVIATION = "h";

  @override
  final String DAY_UNIT_LABEL = "Jour";

  @override
  final String DAY_UNIT_ABBREVIATION = "d";

  @override
  final String WEEK_UNIT_LABEL = "Semaine";

  @override
  final String WEEK_UNIT_ABBREVIATION = "wk";

  @override
  final String YEAR_UNIT_LABEL = "Année";

  @override
  final String YEAR_UNIT_ABBREVIATION = "yr";

  @override
  final String AREA_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Sélectionner l'unité de surface";

  @override
  final String CURRENCY_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Sélectionner l'unité monétaire";

  @override
  final String LENGTH_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Sélectionner l'unité de longueur";

  @override
  final String MASS_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Sélectionner l'unité de masse";

  @override
  final String NUMBER_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Sélectionner l'unité numérique";

  @override
  final String SPEED_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Sélectionner l'unité de vitesse";

  @override
  final String TEMPERATURE_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Sélectionner l'unité de température";

  @override
  final String TIME_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL =
      "Sélectionner l'unité de temps";

  @override
  final String CONVERTER_INPUT_PLACEHOLDER = "Entrez une valeur";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_MESSAGE =
      "L'historique des équations a été effacé";

  @override
  final String RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_DESCRIPTION =
      "Appuyez sur restaurer pour conserver votre historique d'équations";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les équations supprimées";

  @override
  final String
  RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les équations";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_MESSAGE =
      "Le calculateur de temps a été réinitialisé";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les données du calculateur de temps";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer le calculateur de temps";

  @override
  final String RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les durées";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_MESSAGE =
      "Le calculateur d'indice de masse corporelle a été réinitialisé";

  @override
  final String RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_DESCRIPTION =
      "Appuyez sur restaurer pour conserver vos données d'indice de masse corporelle";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer le calculateur d'indice de masse corporelle";

  @override
  final String
  RESTORE_DELETED_BODY_MASS_INDEX_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer l'indice de masse corporelle";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_MESSAGE =
      "Le temps agrégé a été réinitialisé";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_DESCRIPTION =
      "Appuyez sur restaurer pour conserver le temps agrégé";

  @override
  final String
  RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer le temps agrégé";

  @override
  final String RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer le temps agrégé";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_MESSAGE =
      "Les unités de surface ont été réinitialisées";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les unités de surface";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les unités de surface";

  @override
  final String RESTORE_DELETED_LIST_OF_AREA_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les unités de surface";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_MESSAGE =
      "Les informations textuelles ont été réinitialisées";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les informations textuelles";

  @override
  final String
  RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les informations textuelles";

  @override
  final String RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les informations textuelles";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_MESSAGE =
      "Les unités monétaires ont été réinitialisées";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les unités monétaires";

  @override
  final String
  RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les unités monétaires";

  @override
  final String RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les unités monétaires";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_MESSAGE =
      "Les unités de longueur ont été réinitialisées";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les unités de longueur";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les unités de longueur";

  @override
  final String RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les unités de longueur";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_MESSAGE =
      "Les unités de masse ont été réinitialisées";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les unités de masse";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les unités de masse";

  @override
  final String RESTORE_DELETED_LIST_OF_MASS_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les unités de masse";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_MESSAGE =
      "Les systèmes numériques ont été réinitialisés";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les systèmes numériques";

  @override
  final String
  RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les systèmes numériques";

  @override
  final String RESTORE_DELETED_LIST_OF_NUMBER_SYSTEM_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les systèmes numériques";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_MESSAGE =
      "Les unités de vitesse ont été réinitialisées";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les unités de vitesse";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les unités de vitesse";

  @override
  final String RESTORE_DELETED_LIST_OF_SPEED_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les unités de vitesse";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_MESSAGE =
      "Les unités de température ont été réinitialisées";

  @override
  final String RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les unités de température";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les unités de température";

  @override
  final String
  RESTORE_DELETED_LIST_OF_TEMPERATURE_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les unités de température";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_MESSAGE =
      "Les unités de temps ont été réinitialisées";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_DESCRIPTION =
      "Appuyez sur restaurer pour conserver les unités de temps";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_ACCESSIBILITY_LABEL =
      "Restaurer les unités de temps";

  @override
  final String RESTORE_DELETED_LIST_OF_TIME_UNITS_BUTTON_TOOLTIP_MESSAGE =
      "Restaurer les unités de temps";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_ACCESSIBILITY_LABEL =
      "Réessayer de récupérer les valeurs actuelles des devises";

  @override
  final String CURRENT_CURRENCY_VALUES_RETRY_BUTTON_TOOLTIP_MESSAGE =
      "Réessayer la récupération";

  @override
  final String CURRENT_CURRENCY_VALUES_LAST_UPDATED_AT_DESCRIPTION =
      "Dernière mise à jour :";

  @override
  final String CALCULATOR_ADD_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère d'addition à l'expression";

  @override
  final String CALCULATOR_SUBTRACT_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère de soustraction à l'expression";

  @override
  final String CALCULATOR_MULTIPLY_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère de multiplication à l'expression";

  @override
  final String CALCULATOR_DIVIDE_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère de division à l'expression";

  @override
  final String CALCULATOR_EQUALS_BUTTON_ACCESSIBILITY_LABEL =
      "Évaluer l'expression";

  @override
  final String CALCULATOR_CLEAR_BUTTON_ACCESSIBILITY_LABEL =
      "Effacer l'expression";

  @override
  final String CALCULATOR_POINT_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter un point décimal à l'expression";

  @override
  final String CALCULATOR_LEFT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter une parenthèse ouvrante à l'expression";

  @override
  final String CALCULATOR_RIGHT_PARENTHESIS_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter une parenthèse fermante à l'expression";

  @override
  final String CALCULATOR_PERCENTAGE_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère de pourcentage à l'expression";

  @override
  final String CALCULATOR_PI_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère pi à l'expression";

  @override
  final String CALCULATOR_E_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère e à l'expression";

  @override
  final String CALCULATOR_ROOT_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère racine à l'expression";

  @override
  final String CALCULATOR_POWER_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère puissance à l'expression";

  @override
  final String CALCULATOR_FACTORIAL_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le caractère factorielle à l'expression";

  @override
  final String CALCULATOR_RECIPROCAL_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter la sous-expression inverse à l'expression";

  @override
  final String CALCULATOR_ZERO_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter zéro à l'expression";

  @override
  final String CALCULATOR_ONE_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter un à l'expression";

  @override
  final String CALCULATOR_TWO_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter deux à l'expression";

  @override
  final String CALCULATOR_THREE_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter trois à l'expression";

  @override
  final String CALCULATOR_FOUR_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter quatre à l'expression";

  @override
  final String CALCULATOR_FIVE_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter cinq à l'expression";

  @override
  final String CALCULATOR_SIX_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter six à l'expression";

  @override
  final String CALCULATOR_SEVEN_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter sept à l'expression";

  @override
  final String CALCULATOR_EIGHT_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter huit à l'expression";

  @override
  final String CALCULATOR_NINE_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter neuf à l'expression";

  @override
  final String CALCULATOR_SHRINK_KEYBOARD_BUTTON_ACCESSIBILITY_LABEL =
      "Réduire le clavier";

  @override
  final String ADD_UNIT_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter l'unité suivante";

  @override
  final String ADD_UNIT_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Ajouter l'unité suivante";

  @override
  final String ADD_NUMBER_SYSTEM_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter un système numérique";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_ACCESSIBILITY_LABEL =
      "Ajouter le système numérique suivant";

  @override
  final String ADD_NUMBER_SYSTEM_NEXT_BUTTON_TOOLTIP_MESSAGE =
      "Ajouter le système numérique suivant";

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
