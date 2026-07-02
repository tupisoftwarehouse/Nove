import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/calculator_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CalculatorViewModelFactory\" Class", () {
    late CalculatorViewModel instance;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();

      CalculatorViewModelFactory.instance = null;
    });

    test(
      "Test If Method \"getInstance\" Returns \"CalculatorViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[CURRENT_EXPRESSION_SNAPSHOT_KEY] =
            MARSHALLED_EXPRESSION_SNAPSHOT;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOTS_KEY] =
            MARSHALLED_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT;

        instance = CalculatorViewModelFactory.getInstance();

        expect(
          instance.currentExpressionSnapshot.value.expression,
          EXPRESSION_TO_BE_EVALUATED,
        );
        expect(
          instance.currentExpressionSnapshot.value.result,
          EVALUATED_EXPRESSION.toString(),
        );

        expect(
          instance.listOfPreviousExpressionSnapshots.value[0].expression,
          EXPRESSION_TO_BE_EVALUATED,
        );
        expect(
          instance.listOfPreviousExpressionSnapshots.value[0].result,
          EVALUATED_EXPRESSION.toString(),
        );
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"CalculatorViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = CalculatorViewModelFactory.getInstance();

        expect(instance.currentExpressionSnapshot.value.expression, "");
        expect(instance.currentExpressionSnapshot.value.result, "");
        expect(instance.listOfPreviousExpressionSnapshots.value.length, 0);
      },
    );
  });
}
