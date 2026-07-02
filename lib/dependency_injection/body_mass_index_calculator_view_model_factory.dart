import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/body_mass_index_calculator_view_model.dart";

class BodyMassIndexCalculatorViewModelFactory {
  BodyMassIndexCalculatorViewModelFactory._();

  static BodyMassIndexCalculatorViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    return BodyMassIndexCalculatorViewModel(keyValueDatabase);
  }
}
