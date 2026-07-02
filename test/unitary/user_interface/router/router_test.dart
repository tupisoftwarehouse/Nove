import "package:flutter/widgets.dart" hide Navigator, Router;
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/internals/adapters/navigator.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "../../../mocks/user_interface/build_context_mock.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"Router\" Class", () {
    late BuildContext context;
    late Navigator navigator;
    late Router router;
    late bool isScreenNavigated;
    late bool isScreenBackNavigated;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      context = BuildContextMock();
    });

    setUp(() {
      isScreenNavigated = false;
      isScreenBackNavigated = false;

      navigator = NavigatorMock(
        (_, _) {
          isScreenNavigated = true;
        },
        (_) {
          isScreenBackNavigated = true;
        },
      );

      router = Router(navigator);

      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"navigateToAreaUnitConverterScreen\" Navigates To Area Unit Converter Screen",
      () {
        router.navigateToAreaUnitConverterScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToBodyMassIndexCalculatorScreen\" Navigates To Body Mass Index Calculator Screen",
      () {
        router.navigateToBodyMassIndexCalculatorScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToCurrencyUnitConverterScreen\" Navigates To Currency Unit Converter Screen",
      () async {
        router.navigateToCurrencyUnitConverterScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToLengthUnitConverterScreen\" Navigates To Length Unit Converter Screen",
      () {
        router.navigateToLengthUnitConverterScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToMassUnitConverterScreen\" Navigates To Mass Unit Converter Screen",
      () {
        router.navigateToMassUnitConverterScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToNumberSystemConverterScreen\" Navigates To Number System Converter Screen",
      () {
        router.navigateToNumberSystemConverterScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToSpeedUnitConverterScreen\" Navigates To Speed Unit Converter Screen",
      () {
        router.navigateToSpeedUnitConverterScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToTemperatureUnitConverterScreen\" Navigates To Temperature Unit Converter Screen",
      () {
        router.navigateToTemperatureUnitConverterScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToTextInformationParserScreen\" Navigates To Text Information Parser Screen",
      () {
        router.navigateToTextInformationParserScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToTimeAggregatorScreen\" Navigates To Time Aggregator Screen",
      () {
        router.navigateToTimeAggregatorScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToTimeCalculatorScreen\" Navigates To Time Calculator Screen",
      () {
        router.navigateToTimeCalculatorScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test(
      "Test If Method \"navigateToTimeUnitConverterScreen\" Navigates To Time Unit Converter Screen",
      () {
        router.navigateToTimeUnitConverterScreen(context);

        expect(isScreenNavigated, true);
      },
    );

    test("Test If Method \"navigateBack\" Navigates To Back Screen", () {
      router.navigateBack(context);

      expect(isScreenBackNavigated, true);
    });
  });
}
