import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/data_stores/scientific_calculator_keyboard_state_data_store.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ScientificCalculatorKeyboardStateDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getScientificCalculatorKeyboardState\" Returns Scientific Calculator Keyboard State From Key-Value Database",
      () {
        keyValueDatabase.setItem(SCIENTIFIC_CALCULATOR_KEYBOARD_STATE_KEY, () {
          return "true";
        });

        final calculatorKeyboardStateFromKeyValueDatabase =
            ScientificCalculatorKeyboardStateDataStore.getScientificCalculatorKeyboardState(
              keyValueDatabase,
            );

        expect(calculatorKeyboardStateFromKeyValueDatabase, true);
      },
    );

    test(
      "Test If Method \"setScientificCalculatorKeyboardState\" Sets Scientific Calculator Keyboard State On Key-Value Database",
      () {
        ScientificCalculatorKeyboardStateDataStore.setScientificCalculatorKeyboardState(
          true,
          keyValueDatabase,
        );

        final calculatorKeyboardStateFromKeyValueDatabase = keyValueDatabase
            .getItem(SCIENTIFIC_CALCULATOR_KEYBOARD_STATE_KEY, (
              marshalledData,
            ) {
              return bool.parse(marshalledData);
            });

        expect(calculatorKeyboardStateFromKeyValueDatabase, true);
      },
    );
  });
}
