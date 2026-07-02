import "package:nove/data/currency/currency_values_value_object.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";

final CURRENCY_VALUE_SERVICE_URL = Uri.parse(
  "https://api.frankfurter.dev/v2/rates?base=USD&quotes=EUR,GBP,CHF,BRL,CAD,AUD,NZD",
);

const MARSHALLED_CURRENCY_VALUES_FROM_SERVICE = '''
[
  {
    "date": "2026-03-25",
    "base": "USD",
    "quote": "AUD",
    "rate": 1.4200
  },
  {
    "date": "2026-03-25",
    "base": "USD",
    "quote": "BRL",
    "rate": 5.2600
  },
  {
    "date": "2026-03-25",
    "base": "USD",
    "quote": "CAD",
    "rate": 1.3700
  },
  {
    "date": "2026-03-25",
    "base": "USD",
    "quote": "CHF",
    "rate": 0.7900
  },
  {
    "date": "2026-03-25",
    "base": "USD",
    "quote": "EUR",
    "rate": 0.8600
  },
  {
    "date": "2026-03-25",
    "base": "USD",
    "quote": "GBP",
    "rate": 0.7500
  },
  {
    "date": "2026-03-25",
    "base": "USD",
    "quote": "NZD",
    "rate": 1.7163
  }
]
''';

const CURRENCY_CODE_KEY = "quote";

const CURRENCY_VALUE_KEY = "rate";

const UNITED_KINGDOM_POUND_CURRENCY_CODE = "GBP";

const SWITZERLAND_FRANC_CURRENCY_CODE = "CHF";

const AUSTRALIA_DOLLAR_CURRENCY_CODE = "AUD";

const BRAZIL_REAL_CURRENCY_CODE = "BRL";

const CANADA_DOLLAR_CURRENCY_CODE = "CAD";

const NEW_ZEALAND_DOLLAR_CURRENCY_CODE = "NZD";

const EURO_CURRENCY_CODE = "EUR";

const FAILED_CURRENT_CURRENCY_VALUES_REQUEST_ERROR_MESSAGE =
    "Current Currency Values Request Has Failed!";

const ONE_DAY = Duration(days: 1);

const TWO_DAYS = Duration(days: 2);

const ONE_QUARTER_OF_A_BUSINESS_DAY = Duration(hours: 3);

DateTime FIRST_QUARTER_OF_THE_DAY(DateTime currentTimeOfTheDay) {
  return DateTime(
    currentTimeOfTheDay.year,
    currentTimeOfTheDay.month,
    currentTimeOfTheDay.day,
    9,
  );
}

DateTime SECOND_QUARTER_OF_THE_DAY(DateTime currentTimeOfTheDay) {
  return DateTime(
    currentTimeOfTheDay.year,
    currentTimeOfTheDay.month,
    currentTimeOfTheDay.day,
    12,
  );
}

DateTime THIRD_QUARTER_OF_THE_DAY(DateTime currentTimeOfTheDay) {
  return DateTime(
    currentTimeOfTheDay.year,
    currentTimeOfTheDay.month,
    currentTimeOfTheDay.day,
    15,
  );
}

DateTime FORTH_QUARTER_OF_THE_DAY(DateTime currentTimeOfTheDay) {
  return DateTime(
    currentTimeOfTheDay.year,
    currentTimeOfTheDay.month,
    currentTimeOfTheDay.day,
    18,
  );
}

final BEFORE_FIRST_QUARTER_OF_THE_DAY = DateTime(2026, 4, 17, 8, 30);

final BEFORE_SECOND_QUARTER_OF_THE_DAY = DateTime(2026, 4, 17, 11, 30);

final BEFORE_THIRD_QUARTER_OF_THE_DAY = DateTime(2026, 4, 17, 14, 30);

final BEFORE_FORTH_QUARTER_OF_THE_DAY = DateTime(2026, 4, 17, 17, 30);

final AFTER_FORTH_QUARTER_OF_THE_DAY = DateTime(2026, 4, 17, 18, 30);

final WORKING_DAY_TIME_OF_THE_DAY = DateTime(2026, 4, 17, 9, 30);

final SATURDAY_TIME_OF_THE_DAY = DateTime(2026, 4, 18, 9, 30);

final SUNDAY_TIME_OF_THE_DAY = DateTime(2026, 4, 19, 9, 30);

final CURRENCY_VALUES = CurrencyValuesValueObject(
  0.75,
  0.79,
  1.42,
  5.26,
  1.37,
  1.72,
  0.86,
);

final CURRENT_CURRENCY_VALUES = CurrentCurrencyValuesValueObject(
  CURRENCY_VALUES,
  DateTime.now().millisecondsSinceEpoch,
  DateTime.now().millisecondsSinceEpoch +
      ONE_QUARTER_OF_A_BUSINESS_DAY.inMilliseconds,
);

final OUT_DATED_CURRENT_CURRENCY_VALUES = CurrentCurrencyValuesValueObject(
  CURRENCY_VALUES,
  DateTime.now().millisecondsSinceEpoch,
  DateTime.now().millisecondsSinceEpoch -
      ONE_QUARTER_OF_A_BUSINESS_DAY.inMilliseconds,
);

final UP_TO_DATE_CURRENT_CURRENCY_VALUES = CurrentCurrencyValuesValueObject(
  CURRENCY_VALUES,
  DateTime.now().millisecondsSinceEpoch,
  DateTime.now().millisecondsSinceEpoch +
      ONE_QUARTER_OF_A_BUSINESS_DAY.inMilliseconds,
);

final MARSHALLED_CURRENCY_VALUES =
    """{"unitedKingdomPound":${CURRENCY_VALUES.unitedKingdomPound},"switzerlandFranc":${CURRENCY_VALUES.switzerlandFranc},"australiaDollar":${CURRENCY_VALUES.australiaDollar},"brazilReal":${CURRENCY_VALUES.brazilReal},"canadaDollar":${CURRENCY_VALUES.canadaDollar},"newZealandDollar":${CURRENCY_VALUES.newZealandDollar},"euro":${CURRENCY_VALUES.euro}}""";

final MARSHALLED_CURRENT_CURRENCY_VALUES =
    """{"currencyValues":$MARSHALLED_CURRENCY_VALUES,"updatedAt":${CURRENT_CURRENCY_VALUES.updatedAt},"updatableAt":${CURRENT_CURRENCY_VALUES.updatableAt}}""";

final MARSHALLABLE_CURRENCY_VALUES = {
  "unitedKingdomPound": CURRENCY_VALUES.unitedKingdomPound,
  "switzerlandFranc": CURRENCY_VALUES.switzerlandFranc,
  "australiaDollar": CURRENCY_VALUES.australiaDollar,
  "brazilReal": CURRENCY_VALUES.brazilReal,
  "canadaDollar": CURRENCY_VALUES.canadaDollar,
  "newZealandDollar": CURRENCY_VALUES.newZealandDollar,
  "euro": CURRENCY_VALUES.euro,
};

const MEANINGFUL_CURRENCY_VALUE_CHARACTERS_AFTER_DECIMAL_POINT = 2;

final OUTDATED_CURRENCY_VALUES = CurrencyValuesValueObject(0, 0, 0, 0, 0, 0, 0);

const CURRENT_CURRENCY_VALUE_FETCHING_MAXIMUM_ATTEMPTS = 3;

const CURRENT_CURRENCY_VALUE_FETCHING_EXPECTED_TIMEOUT = Duration(seconds: 2);

const NOT_FIXED_CURRENCY_VALUE = 2.5831;

const FIXED_CURRENCY_VALUE = 2.58;
