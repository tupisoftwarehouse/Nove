import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/constants/domains/time_aggregator_constants.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";

void main() {
  group("Test \"PhraseResolver\" Class", () {
    test(
      "Test If Method \"getCurrentCurrencyValuesUpdatedAtTimePhrase\" Returns Resolved Current Currency Values Updated At Time Phrase",
      () {
        final currentCurrencyValuesUpdatedAtTimePhraseInPostMeridiemPeriodOfDay =
            PhraseResolver.getCurrentCurrencyValuesUpdatedAtTimePhrase(
              CURRENT_CURRENCY_VALUES_UPDATED_AT_TIMESTAMP_IN_POST_MERIDIEM_PERIOD_OF_DAY
                  .millisecondsSinceEpoch,
              APPLICATION_LANGUAGE,
            );
        final currentCurrencyValuesUpdatedAtTimePhraseInAnteMeridiemPeriodOfDay =
            PhraseResolver.getCurrentCurrencyValuesUpdatedAtTimePhrase(
              CURRENT_CURRENCY_VALUES_UPDATED_AT_TIMESTAMP_IN_ANTE_MERIDIEM_PERIOD_OF_DAY
                  .millisecondsSinceEpoch,
              APPLICATION_LANGUAGE,
            );
        final currentCurrencyValuesUpdatedAtTimePhraseInTwentyFourHoursFormat =
            PhraseResolver.getCurrentCurrencyValuesUpdatedAtTimePhrase(
              CURRENT_CURRENCY_VALUES_UPDATED_AT_TIMESTAMP_IN_TWENTY_FOUR_HOURS_FORMAT
                  .millisecondsSinceEpoch,
              NON_ENGLISH_LANGUAGE,
            );

        expect(
          currentCurrencyValuesUpdatedAtTimePhraseInPostMeridiemPeriodOfDay,
          RESOLVED_CURRENT_CURRENCY_VALUES_UPDATED_AT_TIME_PHRASE_IN_POST_MERIDIEM_PERIOD_OF_DAY,
        );
        expect(
          currentCurrencyValuesUpdatedAtTimePhraseInAnteMeridiemPeriodOfDay,
          RESOLVED_CURRENT_CURRENCY_VALUES_UPDATED_AT_TIME_PHRASE_IN_ANTE_MERIDIEM_PERIOD_OF_DAY,
        );
        expect(
          currentCurrencyValuesUpdatedAtTimePhraseInTwentyFourHoursFormat,
          RESOLVED_CURRENT_CURRENCY_VALUES_UPDATED_AT_TIME_PHRASE_IN_TWENTY_FOUR_HOURS_FORMAT,
        );
      },
    );

    test(
      "Test If Method \"getTextInformationBreakdownPhrase\" Returns Resolved Text Information Breakdown Phrase",
      () {
        final textInformationBreakdownPhrase =
            PhraseResolver.getTextInformationBreakdownPhrase(
              TEXT_INFORMATION_FROM_SMALL_TEXT,
              APPLICATION_LANGUAGE,
            );

        expect(
          textInformationBreakdownPhrase,
          APPLICATION_LANGUAGE.TEXT_INFORMATION_BREAKDOWN(
            "$SMALL_TEXT_AMOUNT_OF_WORDS",
            "$SMALL_TEXT_LENGTH",
          ),
        );
      },
    );

    test(
      "Test If Method \"getBodyMassIndexResultPhrase\" Returns Resolved Body Mass Index Result Phrase",
      () {
        final underweightBodyMassIndexResultPhrase =
            PhraseResolver.getBodyMassIndexResultPhrase(
              UNDERWEIGHT_BODY_MASS_INDEX,
              APPLICATION_LANGUAGE,
            );
        final normalBodyMassIndexResultPhrase =
            PhraseResolver.getBodyMassIndexResultPhrase(
              NORMAL_BODY_MASS_INDEX,
              APPLICATION_LANGUAGE,
            );
        final overweightBodyMassIndexResultPhrase =
            PhraseResolver.getBodyMassIndexResultPhrase(
              OVERWEIGHT_BODY_MASS_INDEX,
              APPLICATION_LANGUAGE,
            );
        final obeseBodyMassIndexResultPhrase =
            PhraseResolver.getBodyMassIndexResultPhrase(
              OBESE_BODY_MASS_INDEX,
              APPLICATION_LANGUAGE,
            );

        expect(
          underweightBodyMassIndexResultPhrase,
          RESOLVED_UNDERWEIGHT_BODY_MASS_INDEX_RESULT_PHRASE,
        );
        expect(
          normalBodyMassIndexResultPhrase,
          RESOLVED_NORMAL_BODY_MASS_INDEX_RESULT_PHRASE,
        );
        expect(
          overweightBodyMassIndexResultPhrase,
          RESOLVED_OVERWEIGHT_BODY_MASS_INDEX_RESULT_PHRASE,
        );
        expect(
          obeseBodyMassIndexResultPhrase,
          RESOLVED_OBESE_BODY_MASS_INDEX_RESULT_PHRASE,
        );
      },
    );

    test(
      "Test If Method \"getAggregatedTimeResultPhrase\" Returns Resolved Aggregated Time Result Phrase",
      () {
        final aggregatedTimeResultPhrase =
            PhraseResolver.getAggregatedTimeResultPhrase(
              AGGREGATED_TIME,
              APPLICATION_LANGUAGE,
            );

        expect(
          aggregatedTimeResultPhrase,
          RESOLVED_AGGREGATED_TIME_RESULT_PHRASE,
        );
      },
    );

    test(
      "Test If Method \"getCalculatedTimeResultPhrase\" Returns Resolved Calculated Time Result Phrase",
      () {
        final calculatedTimeResultPhrase =
            PhraseResolver.getCalculatedTimeResultPhrase(
              CALCULATED_TIME,
              APPLICATION_LANGUAGE,
            );

        expect(
          calculatedTimeResultPhrase,
          RESOLVED_CALCULATED_TIME_RESULT_PHRASE,
        );
      },
    );
  });
}
