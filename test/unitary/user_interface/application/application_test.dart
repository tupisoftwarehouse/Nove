import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/application/application.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/screens/home_screen.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"Application\" Class", () {
    setUpAll(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });
    testWidgets("Test If Application Builds", (tester) async {
      await tester.pumpWidget(Application());

      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
