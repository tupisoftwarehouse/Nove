import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_category.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_value_object.dart";
import "package:nove/domain/text_information_parser/text_information_value_object.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/formatter/user_interface_formatter.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/concrete/english_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";

class PhraseResolver {
  PhraseResolver._();

  static String getCurrentCurrencyValuesUpdatedAtTimePhrase(
    int currentCurrencyValuesUpdatedAtTimestamp,
    DeviceLanguageStringsValueObject deviceLanguageStringsValueObject,
  ) {
    final currentCurrencyValuesUpdatedAt = DateTime.fromMillisecondsSinceEpoch(
      currentCurrencyValuesUpdatedAtTimestamp,
    );
    final periodOfTheDay = isTimeBeforeNoon(currentCurrencyValuesUpdatedAt.hour)
        ? ANTE_MERIDIEM_PERIOD_OF_DAY_ACRONYMOUS
        : POST_MERIDIEM_PERIOD_OF_DAY_ACRONYMOUS;
    final parsedCurrentHourOfDay =
        (isTimeBeforeNoon(currentCurrencyValuesUpdatedAt.hour)
        ? currentCurrencyValuesUpdatedAt.hour
        : currentCurrencyValuesUpdatedAt.hour - NOON_HOUR_OF_DAY);
    final currentHourOfDay =
        deviceLanguageStringsValueObject is EnglishStringsValueObject
        ? parsedCurrentHourOfDay
        : currentCurrencyValuesUpdatedAt.hour;
    final paddedCurrentHourOfDay = UserInterfaceFormatter.getPaddedValue(
      "$currentHourOfDay",
    );
    final currentMinuteOfDay = UserInterfaceFormatter.getPaddedValue(
      "${currentCurrencyValuesUpdatedAt.minute}",
    );
    final currentMonthOfYear = UserInterfaceFormatter.getPaddedValue(
      "${currentCurrencyValuesUpdatedAt.month}",
    );
    final currentDayOfMonth = UserInterfaceFormatter.getPaddedValue(
      "${currentCurrencyValuesUpdatedAt.day}",
    );

    return deviceLanguageStringsValueObject
        .CURRENT_CURRENCY_VALUES_UPDATED_AT_TIME(
          paddedCurrentHourOfDay,
          currentMinuteOfDay,
          periodOfTheDay,
          currentMonthOfYear,
          currentDayOfMonth,
          "${currentCurrencyValuesUpdatedAt.year}",
        );
  }

  static String getTextInformationBreakdownPhrase(
    TextInformationValueObject textInformation,
    DeviceLanguageStringsValueObject deviceLanguageStringsValueObject,
  ) {
    final castedAmountOfWords = textInformation.amountOfWords.toString();
    final castedLength = textInformation.length.toString();

    return deviceLanguageStringsValueObject.TEXT_INFORMATION_BREAKDOWN(
      castedAmountOfWords,
      castedLength,
    );
  }

  static String getBodyMassIndexResultPhrase(
    BodyMassIndexValueObject bodyMassIndexValueObject,
    DeviceLanguageStringsValueObject deviceLanguageStringsValueObject,
  ) {
    final parsedValue = UserInterfaceFormatter.getRoundNumberValue(
      "${bodyMassIndexValueObject.value}",
    );
    late final String category;

    switch (bodyMassIndexValueObject.category) {
      case BodyMassIndexCategory.UNDERWEIGHT:
        category = deviceLanguageStringsValueObject.UNDERWEIGHT_CATEGORY;

        break;
      case BodyMassIndexCategory.NORMAL_WEIGHT:
        category = deviceLanguageStringsValueObject.NORMAL_WEIGHT_CATEGORY;

        break;
      case BodyMassIndexCategory.OVERWEIGHT:
        category = deviceLanguageStringsValueObject.OVERWEIGHT_CATEGORY;

        break;
      case BodyMassIndexCategory.OBESE:
        category = deviceLanguageStringsValueObject.OBESE_CATEGORY;

        break;
    }

    return deviceLanguageStringsValueObject.BODY_MASS_INDEX_RESULT(
      parsedValue,
      category,
    );
  }

  static String getCalculatedTimeResultPhrase(
    TimeValueObject aggregatedTime,
    DeviceLanguageStringsValueObject deviceLanguageStringsValueObject,
  ) {
    final parsedHour = UserInterfaceFormatter.getPaddedValue(
      "${aggregatedTime.hours}",
    );
    final parsedMinute = UserInterfaceFormatter.getPaddedValue(
      "${aggregatedTime.minutes}",
    );
    final parsedSecond = UserInterfaceFormatter.getPaddedValue(
      "${aggregatedTime.seconds}",
    );

    return deviceLanguageStringsValueObject.CALCULATED_TIME_RESULT(
      parsedHour,
      parsedMinute,
      parsedSecond,
    );
  }

  static String getAggregatedTimeResultPhrase(
    TimeValueObject aggregatedTime,
    DeviceLanguageStringsValueObject deviceLanguageStringsValueObject,
  ) {
    final parsedHour = UserInterfaceFormatter.getPaddedValue(
      "${aggregatedTime.hours}",
    );
    final parsedMinute = UserInterfaceFormatter.getPaddedValue(
      "${aggregatedTime.minutes}",
    );
    final parsedSecond = UserInterfaceFormatter.getPaddedValue(
      "${aggregatedTime.seconds}",
    );

    return deviceLanguageStringsValueObject.AGGREGATED_TIME_RESULT(
      parsedHour,
      parsedMinute,
      parsedSecond,
    );
  }
}
