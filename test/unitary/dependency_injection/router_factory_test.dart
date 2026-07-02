import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/router_factory.dart";

void main() {
  group("Test \"RouterFactory\" Class", () {
    late Router instance;

    test("Test If Method \"getInstance\" Returns \"Router\"", () {
      instance = RouterFactory.getInstance();

      expect(instance, isA<Router>());
    });
  });
}
