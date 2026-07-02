import "package:flutter/material.dart" hide Router;
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/pages/utilities_page.dart";
import "package:nove/user_interface/sections/utility_banner_deck_sections.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"UtilitiesPage\" Page", () {
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});

      router = Router(navigator);
    });

    testWidgets("Test If Page Builds", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: UtilitiesPage(router: router)),
        ),
      );

      expect(find.byType(UtilityBannerDeckSections), findsOneWidget);
    });
  });
}
