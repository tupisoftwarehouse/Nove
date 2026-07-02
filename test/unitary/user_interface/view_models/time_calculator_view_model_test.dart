import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_calculator_data_store.dart";
import "package:nove/user_interface/view_models/time_calculator_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeCalculatorViewModel\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late TimeCalculatorViewModel timeCalculatorViewModel;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();

      timeCalculatorViewModel = TimeCalculatorViewModel(keyValueDatabase);
    });

    test(
      "Test If View Model Initializes Its States With Key-Value Database Data",
      () {
        TimeCalculatorDataStore.setFirstTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );
        TimeCalculatorDataStore.setSecondTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );
        TimeCalculatorDataStore.setCalculatedTime(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );

        timeCalculatorViewModel = TimeCalculatorViewModel(keyValueDatabase);

        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          timeCalculatorViewModel.calculatedTime.value.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );
      },
    );

    test(
      "Test If Method \"setFirstTimeToBeCalculated\" Updates State And Stores Values",
      () {
        timeCalculatorViewModel.setFirstTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
        );

        final firstTimeFromDatabase =
            TimeCalculatorDataStore.getFirstTimeToBeCalculated(
              keyValueDatabase,
            );

        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(firstTimeFromDatabase.hours, TIME_TO_BE_CALCULATED.hours);
      },
    );

    test(
      "Test If Method \"setSecondTimeToBeCalculated\" Updates State And Stores Values",
      () {
        timeCalculatorViewModel.setSecondTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
        );

        final secondTimeFromDatabase =
            TimeCalculatorDataStore.getSecondTimeToBeCalculated(
              keyValueDatabase,
            );

        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(secondTimeFromDatabase.minutes, TIME_TO_BE_CALCULATED.minutes);
      },
    );

    test(
      "Test If Method \"addTime\" Adds Times And Stores Calculated Time",
      () {
        TimeCalculatorDataStore.setFirstTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );
        TimeCalculatorDataStore.setSecondTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );
        TimeCalculatorDataStore.setCalculatedTime(
          ZEROED_TIME,
          keyValueDatabase,
        );

        timeCalculatorViewModel = TimeCalculatorViewModel(keyValueDatabase);

        timeCalculatorViewModel.addTime();

        final calculatedTimeFromDatabase =
            TimeCalculatorDataStore.getCalculatedTime(keyValueDatabase);

        expect(
          timeCalculatorViewModel.calculatedTime.value.hours,
          CALCULATED_TIME.hours,
        );
        expect(calculatedTimeFromDatabase.minutes, CALCULATED_TIME.minutes);
        expect(calculatedTimeFromDatabase.seconds, CALCULATED_TIME.seconds);
      },
    );

    test(
      "Test If Method \"subtractTime\" Subtracts Times And Stores Calculated Time",
      () {
        TimeCalculatorDataStore.setFirstTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );
        TimeCalculatorDataStore.setSecondTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );

        timeCalculatorViewModel = TimeCalculatorViewModel(keyValueDatabase);

        timeCalculatorViewModel.subtractTime();

        final calculatedTimeFromDatabase =
            TimeCalculatorDataStore.getCalculatedTime(keyValueDatabase);

        expect(
          timeCalculatorViewModel.calculatedTime.value.hours,
          ZEROED_TIME.hours,
        );
        expect(calculatedTimeFromDatabase.minutes, ZEROED_TIME.minutes);
        expect(calculatedTimeFromDatabase.seconds, ZEROED_TIME.seconds);
      },
    );

    test("Test If Method \"reset\" Resets Time Calculator Data", () {
      TimeCalculatorDataStore.setFirstTimeToBeCalculated(
        TIME_TO_BE_CALCULATED,
        keyValueDatabase,
      );
      TimeCalculatorDataStore.setSecondTimeToBeCalculated(
        TIME_TO_BE_CALCULATED,
        keyValueDatabase,
      );
      TimeCalculatorDataStore.setCalculatedTime(
        CALCULATED_TIME,
        keyValueDatabase,
      );

      timeCalculatorViewModel = TimeCalculatorViewModel(keyValueDatabase);

      timeCalculatorViewModel.reset();

      final firstTimeFromDatabase =
          TimeCalculatorDataStore.getFirstTimeToBeCalculated(keyValueDatabase);
      final secondTimeFromDatabase =
          TimeCalculatorDataStore.getSecondTimeToBeCalculated(keyValueDatabase);
      final calculatedTimeFromDatabase =
          TimeCalculatorDataStore.getCalculatedTime(keyValueDatabase);

      expect(
        timeCalculatorViewModel.firstTimeToBeCalculated.value.hours,
        ZEROED_TIME.hours,
      );
      expect(firstTimeFromDatabase.minutes, ZEROED_TIME.minutes);
      expect(firstTimeFromDatabase.seconds, ZEROED_TIME.seconds);

      expect(
        timeCalculatorViewModel.secondTimeToBeCalculated.value.hours,
        ZEROED_TIME.hours,
      );
      expect(secondTimeFromDatabase.minutes, ZEROED_TIME.minutes);
      expect(secondTimeFromDatabase.seconds, ZEROED_TIME.seconds);

      expect(
        timeCalculatorViewModel.calculatedTime.value.hours,
        ZEROED_TIME.hours,
      );
      expect(calculatedTimeFromDatabase.minutes, ZEROED_TIME.minutes);
      expect(calculatedTimeFromDatabase.seconds, ZEROED_TIME.seconds);
    });

    test(
      "Test If Method \"restore\" Restores Deleted Time Calculator Data And Stores Values On Key-Value Database",
      () {
        TimeCalculatorDataStore.setFirstTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );
        TimeCalculatorDataStore.setSecondTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );
        TimeCalculatorDataStore.setCalculatedTime(
          CALCULATED_TIME,
          keyValueDatabase,
        );

        timeCalculatorViewModel = TimeCalculatorViewModel(keyValueDatabase);

        timeCalculatorViewModel.reset();

        timeCalculatorViewModel.restore();

        final firstTimeFromDatabase =
            TimeCalculatorDataStore.getFirstTimeToBeCalculated(
              keyValueDatabase,
            );
        final secondTimeFromDatabase =
            TimeCalculatorDataStore.getSecondTimeToBeCalculated(
              keyValueDatabase,
            );
        final calculatedTimeFromDatabase =
            TimeCalculatorDataStore.getCalculatedTime(keyValueDatabase);

        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(firstTimeFromDatabase.minutes, TIME_TO_BE_CALCULATED.minutes);
        expect(firstTimeFromDatabase.seconds, TIME_TO_BE_CALCULATED.seconds);

        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(secondTimeFromDatabase.minutes, TIME_TO_BE_CALCULATED.minutes);
        expect(secondTimeFromDatabase.seconds, TIME_TO_BE_CALCULATED.seconds);

        expect(
          timeCalculatorViewModel.calculatedTime.value.hours,
          CALCULATED_TIME.hours,
        );
        expect(calculatedTimeFromDatabase.minutes, CALCULATED_TIME.minutes);
        expect(calculatedTimeFromDatabase.seconds, CALCULATED_TIME.seconds);
      },
    );

    test(
      "Test If Method \"dismissRecovery\" Deletes Restorable Time Calculator Data",
      () {
        TimeCalculatorDataStore.setFirstTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );
        TimeCalculatorDataStore.setSecondTimeToBeCalculated(
          TIME_TO_BE_CALCULATED,
          keyValueDatabase,
        );
        TimeCalculatorDataStore.setCalculatedTime(
          CALCULATED_TIME,
          keyValueDatabase,
        );

        timeCalculatorViewModel = TimeCalculatorViewModel(keyValueDatabase);

        timeCalculatorViewModel.reset();

        timeCalculatorViewModel.dismissRecovery();

        try {
          timeCalculatorViewModel.restore();
        } catch (error) {
          expect(error, isA<Error>());
        }
      },
    );
  });
}
