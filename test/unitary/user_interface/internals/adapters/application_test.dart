import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/adapters/application.dart";

void main() {
  group("Test \"Application\" Widget", () {
    testWidgets("Test If Renders Application Its Platform", (tester) async {
      await tester.pumpWidget(
        TeresaApplication(content: APPLICATION_HOME_SCREEN),
      );

      expect(find.byKey(HOME_SCREEN_KEY), findsOneWidget);
    });
  });
}
