import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_calculator_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeCalculatorDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getFirstTimeToBeCalculated\" Returns First Time To Be Calculated From Key-Value Database",
      () {
        keyValueDatabase.setItem(FIRST_TIME_TO_BE_CALCULATED_KEY, () {
          return TIME_TO_BE_CALCULATED.marshalledData;
        });

        final firstTimeFromKeyValueDatabase =
            TimeCalculatorDataStore.getFirstTimeToBeCalculated(
              keyValueDatabase,
            );

        expect(
          firstTimeFromKeyValueDatabase.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          firstTimeFromKeyValueDatabase.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          firstTimeFromKeyValueDatabase.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );
      },
    );

    test(
      "Test If Method \"setFirstTimeToBeCalculated\" Sets First Time To Be Calculated On Key-Value Database",
      () {
        TimeCalculatorDataStore.setFirstTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );

        final firstTimeFromKeyValueDatabase = keyValueDatabase.getItem(
          FIRST_TIME_TO_BE_CALCULATED_KEY,
          (marshalledData) {
            return TimeValueObject.fromMarshalledData(marshalledData);
          },
        );

        expect(
          firstTimeFromKeyValueDatabase.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          firstTimeFromKeyValueDatabase.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          firstTimeFromKeyValueDatabase.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );
      },
    );

    test(
      "Test If Method \"getSecondTimeToBeCalculated\" Returns Second Time To Be Calculated From Key-Value Database",
      () {
        keyValueDatabase.setItem(SECOND_TIME_TO_BE_CALCULATED_KEY, () {
          return TIME_TO_BE_CALCULATED.marshalledData;
        });

        final secondTimeFromKeyValueDatabase =
            TimeCalculatorDataStore.getSecondTimeToBeCalculated(
              keyValueDatabase,
            );

        expect(
          secondTimeFromKeyValueDatabase.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          secondTimeFromKeyValueDatabase.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          secondTimeFromKeyValueDatabase.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );
      },
    );

    test(
      "Test If Method \"setSecondTimeToBeCalculated\" Sets Second Time To Be Calculated On Key-Value Database",
      () {
        TimeCalculatorDataStore.setSecondTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );

        final secondTimeFromKeyValueDatabase = keyValueDatabase.getItem(
          SECOND_TIME_TO_BE_CALCULATED_KEY,
          (marshalledData) {
            return TimeValueObject.fromMarshalledData(marshalledData);
          },
        );

        expect(
          secondTimeFromKeyValueDatabase.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          secondTimeFromKeyValueDatabase.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          secondTimeFromKeyValueDatabase.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );
      },
    );

    test(
      "Test If Method \"getCalculatedTime\" Returns Calculated Time From Key-Value Database",
      () {
        keyValueDatabase.setItem(CALCULATED_TIME_KEY, () {
          return CALCULATED_TIME.marshalledData;
        });

        final calculatedTimeFromKeyValueDatabase =
            TimeCalculatorDataStore.getCalculatedTime(keyValueDatabase);

        expect(calculatedTimeFromKeyValueDatabase.hours, CALCULATED_TIME.hours);
        expect(
          calculatedTimeFromKeyValueDatabase.minutes,
          CALCULATED_TIME.minutes,
        );
        expect(
          calculatedTimeFromKeyValueDatabase.seconds,
          CALCULATED_TIME.seconds,
        );
      },
    );

    test(
      "Test If Method \"setCalculatedTime\" Sets Calculated Time On Key-Value Database",
      () {
        TimeCalculatorDataStore.setCalculatedTime(
          CALCULATED_TIME,
          keyValueDatabase,
        );

        final calculatedTimeFromKeyValueDatabase = keyValueDatabase.getItem(
          CALCULATED_TIME_KEY,
          (marshalledData) {
            return TimeValueObject.fromMarshalledData(marshalledData);
          },
        );

        expect(calculatedTimeFromKeyValueDatabase.hours, CALCULATED_TIME.hours);
        expect(
          calculatedTimeFromKeyValueDatabase.minutes,
          CALCULATED_TIME.minutes,
        );
        expect(
          calculatedTimeFromKeyValueDatabase.seconds,
          CALCULATED_TIME.seconds,
        );
      },
    );
  });
}
