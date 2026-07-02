import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class ScientificCalculatorKeyboardStateDataStore {
  ScientificCalculatorKeyboardStateDataStore._();

  static bool getScientificCalculatorKeyboardState(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<bool>(
      SCIENTIFIC_CALCULATOR_KEYBOARD_STATE_KEY,
      (serializedData) {
        return bool.parse(serializedData);
      },
    );
  }

  static void setScientificCalculatorKeyboardState(
    bool updatedCalculatorKeyboardState,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(SCIENTIFIC_CALCULATOR_KEYBOARD_STATE_KEY, () {
      return updatedCalculatorKeyboardState.toString();
    });
  }
}
