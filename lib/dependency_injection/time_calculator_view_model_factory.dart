import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/time_calculator_view_model.dart";

class TimeCalculatorViewModelFactory {
  TimeCalculatorViewModelFactory._();

  static TimeCalculatorViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    return TimeCalculatorViewModel(keyValueDatabase);
  }
}
