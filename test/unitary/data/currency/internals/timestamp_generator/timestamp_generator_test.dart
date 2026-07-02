import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/internals/timestamp_generator/timestamp_generator.dart";

void main() {
  group("Test \"TimestampGenerator\" Class", () {
    test(
      "Test If Method \"getUpdatedAtTimestamp\" Returns Closet Hour Of The Day To Update Currency Values Timestamp",
      () {
        final updatedAtTimestampBeforeFirstQuarterOfTheDay =
            TimestampGenerator.getUpdatedAtTimestamp(
              BEFORE_FIRST_QUARTER_OF_THE_DAY,
            );
        final updatedAtTimestampBeforeSecondQuarterOfTheDay =
            TimestampGenerator.getUpdatedAtTimestamp(
              BEFORE_SECOND_QUARTER_OF_THE_DAY,
            );
        final updatedAtTimestampBeforeThirdQuarterOfTheDay =
            TimestampGenerator.getUpdatedAtTimestamp(
              BEFORE_THIRD_QUARTER_OF_THE_DAY,
            );
        final updatedAtTimestampBeforeForthQuarterOfTheDay =
            TimestampGenerator.getUpdatedAtTimestamp(
              BEFORE_FORTH_QUARTER_OF_THE_DAY,
            );
        final updatedAtTimestampAfterForthQuarterOfTheDay =
            TimestampGenerator.getUpdatedAtTimestamp(
              AFTER_FORTH_QUARTER_OF_THE_DAY,
            );

        expect(
          updatedAtTimestampBeforeFirstQuarterOfTheDay,
          FORTH_QUARTER_OF_THE_DAY(
            BEFORE_FIRST_QUARTER_OF_THE_DAY,
          ).subtract(ONE_DAY).millisecondsSinceEpoch,
        );
        expect(
          updatedAtTimestampBeforeSecondQuarterOfTheDay,
          FIRST_QUARTER_OF_THE_DAY(
            BEFORE_SECOND_QUARTER_OF_THE_DAY,
          ).millisecondsSinceEpoch,
        );
        expect(
          updatedAtTimestampBeforeThirdQuarterOfTheDay,
          SECOND_QUARTER_OF_THE_DAY(
            BEFORE_THIRD_QUARTER_OF_THE_DAY,
          ).millisecondsSinceEpoch,
        );
        expect(
          updatedAtTimestampBeforeForthQuarterOfTheDay,
          THIRD_QUARTER_OF_THE_DAY(
            BEFORE_FORTH_QUARTER_OF_THE_DAY,
          ).millisecondsSinceEpoch,
        );
        expect(
          updatedAtTimestampAfterForthQuarterOfTheDay,
          FORTH_QUARTER_OF_THE_DAY(
            AFTER_FORTH_QUARTER_OF_THE_DAY,
          ).millisecondsSinceEpoch,
        );
      },
    );

    test(
      "Test If Method \"getUpdatedAtTimestamp\" Returns Closet Time That Currency Values Has Been Updated In A Wording Day If Current Time Of The Day Is On A Weekend",
      () {
        final updatedAtTimestampOnSaturday =
            TimestampGenerator.getUpdatedAtTimestamp(SATURDAY_TIME_OF_THE_DAY);
        final updatedAtTimestampOnSunday =
            TimestampGenerator.getUpdatedAtTimestamp(SUNDAY_TIME_OF_THE_DAY);

        expect(
          updatedAtTimestampOnSaturday,
          FORTH_QUARTER_OF_THE_DAY(
            SATURDAY_TIME_OF_THE_DAY,
          ).subtract(ONE_DAY).millisecondsSinceEpoch,
        );
        expect(
          updatedAtTimestampOnSunday,
          FORTH_QUARTER_OF_THE_DAY(
            SUNDAY_TIME_OF_THE_DAY,
          ).subtract(TWO_DAYS).millisecondsSinceEpoch,
        );
      },
    );

    test(
      "Test If Method \"getUpdatableAtTimestamp\" Returns Timestamp To Update Currency Values",
      () {
        final updatableAtTimestampBeforeFirstQuarterOfTheDay =
            TimestampGenerator.getUpdatableAtTimestamp(
              BEFORE_FIRST_QUARTER_OF_THE_DAY,
            );
        final updatableAtTimestampBeforeSecondQuarterOfTheDay =
            TimestampGenerator.getUpdatableAtTimestamp(
              BEFORE_SECOND_QUARTER_OF_THE_DAY,
            );
        final updatableAtTimestampBeforeThirdQuarterOfTheDay =
            TimestampGenerator.getUpdatableAtTimestamp(
              BEFORE_THIRD_QUARTER_OF_THE_DAY,
            );
        final updatableAtTimestampBeforeForthQuarterOfTheDay =
            TimestampGenerator.getUpdatableAtTimestamp(
              BEFORE_FORTH_QUARTER_OF_THE_DAY,
            );
        final updatableAtTimestampAfterForthQuarterOfTheDay =
            TimestampGenerator.getUpdatableAtTimestamp(
              AFTER_FORTH_QUARTER_OF_THE_DAY,
            );

        expect(
          updatableAtTimestampBeforeFirstQuarterOfTheDay,
          FIRST_QUARTER_OF_THE_DAY(
            WORKING_DAY_TIME_OF_THE_DAY,
          ).millisecondsSinceEpoch,
        );
        expect(
          updatableAtTimestampBeforeSecondQuarterOfTheDay,
          SECOND_QUARTER_OF_THE_DAY(
            WORKING_DAY_TIME_OF_THE_DAY,
          ).millisecondsSinceEpoch,
        );
        expect(
          updatableAtTimestampBeforeThirdQuarterOfTheDay,
          THIRD_QUARTER_OF_THE_DAY(
            WORKING_DAY_TIME_OF_THE_DAY,
          ).millisecondsSinceEpoch,
        );
        expect(
          updatableAtTimestampBeforeForthQuarterOfTheDay,
          FORTH_QUARTER_OF_THE_DAY(
            WORKING_DAY_TIME_OF_THE_DAY,
          ).millisecondsSinceEpoch,
        );
        expect(
          updatableAtTimestampAfterForthQuarterOfTheDay,
          FIRST_QUARTER_OF_THE_DAY(
            WORKING_DAY_TIME_OF_THE_DAY,
          ).add(ONE_DAY).millisecondsSinceEpoch,
        );
      },
    );

    test(
      "Test If Method \"getUpdatableAtTimestamp\" Returns Closet Time To Update Currency Values In A Wording Day If Current Time Of The Day Is On A Weekend",
      () {
        final updatableAtTimestampOnSaturday =
            TimestampGenerator.getUpdatableAtTimestamp(
              SATURDAY_TIME_OF_THE_DAY,
            );
        final updatableAtTimestampOnSunday =
            TimestampGenerator.getUpdatableAtTimestamp(SUNDAY_TIME_OF_THE_DAY);

        expect(
          updatableAtTimestampOnSaturday,
          FIRST_QUARTER_OF_THE_DAY(
            SATURDAY_TIME_OF_THE_DAY,
          ).add(TWO_DAYS).millisecondsSinceEpoch,
        );
        expect(
          updatableAtTimestampOnSunday,
          FIRST_QUARTER_OF_THE_DAY(
            SUNDAY_TIME_OF_THE_DAY,
          ).add(ONE_DAY).millisecondsSinceEpoch,
        );
      },
    );
  });
}
