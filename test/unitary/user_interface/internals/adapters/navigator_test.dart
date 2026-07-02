import "package:flutter/widgets.dart" hide Navigator;
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/adapters/navigator.dart";
import "../../../../mocks/user_interface/build_context_mock.dart";
import "../../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"Navigator\" Class", () {
    late BuildContext context;
    late Navigator navigator;

    setUpAll(() {
      context = BuildContextMock();
    });

    test("Test If Method \"navigate\" Navigates To Screen", () {
      bool isScreenNavigated = false;
      navigator = NavigatorMock((_, _) {
        isScreenNavigated = true;
      }, (_) {});

      navigator.navigate(context, SCREEN_TO_BE_NAVIGATED);

      expect(isScreenNavigated, true);
    });

    test("Test If Method \"navigateBack\" Navigates Back To Screen", () {
      bool isScreenBackNavigated = false;
      navigator = NavigatorMock((_, _) {}, (_) {
        isScreenBackNavigated = true;
      });

      navigator.navigateBack(context);

      expect(isScreenBackNavigated, true);
    });
  });
}
