import "dart:ui";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/calculator/character.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/internals/widgets_binding_observers/not_valid_expression_message_on_device_language_widgets_binding_observer.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group(
    "Test \"NotValidExpressionMessageOnDeviceLanguageWidgetsBindingObserver\" Class",
    () {
      late NotValidExpressionMessageOnDeviceLanguageWidgetsBindingObserver
      notValidExpressionMessageOnDeviceLanguageWidgetsBindingObserver;
      late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
      late CalculatorViewModel calculatorViewModel;

      setUpAll(() {
        TestWidgetsFlutterBinding.ensureInitialized();
      });

      setUp(() {
        final keyValueDatabase = KeyValueDatabaseMock();
        final calculator = Calculator("");
        final expressionSnapshotHistoryManager =
            ExpressionSnapshotHistoryManager([]);

        deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
          APPLICATION_LANGUAGE,
          (_) {},
        );

        calculatorViewModel = CalculatorViewModel(
          calculator,
          expressionSnapshotHistoryManager,
          keyValueDatabase,
          deviceLanguageStringsViewModel,
        );

        notValidExpressionMessageOnDeviceLanguageWidgetsBindingObserver =
            NotValidExpressionMessageOnDeviceLanguageWidgetsBindingObserver(
              calculatorViewModel,
            );

        calculatorViewModel.addCharacter(Character.ONE);
        calculatorViewModel.addCharacter(Character.PLUS);

        calculatorViewModel.evaluate();
      });

      test(
        "Test If Method \"didChangeAppLifecycleState\" Updates Expression Snapshot Result Not Valid Expression Message To Device Language On Resumed as Application Lifecycle State",
        () {
          notValidExpressionMessageOnDeviceLanguageWidgetsBindingObserver
              .didChangeAppLifecycleState(AppLifecycleState.resumed);

          expect(
            calculatorViewModel.currentExpressionSnapshot.value.result,
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .NOT_VALID_EXPRESSION_ERROR_MESSAGE,
          );
        },
      );

      test(
        "Test If Method \"didChangeLocales\" Updates Expression Snapshot Result Not Valid Expression Message To Device Language On Device Language Change",
        () {
          notValidExpressionMessageOnDeviceLanguageWidgetsBindingObserver
              .didChangeLocales(null);

          expect(
            calculatorViewModel.currentExpressionSnapshot.value.result,
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .NOT_VALID_EXPRESSION_ERROR_MESSAGE,
          );
        },
      );
    },
  );
}
