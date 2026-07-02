import "package:flutter/material.dart" hide Router;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/sections/loading_section.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/loading_indicator.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"LoadingSection\" Section", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late Router router;

    setUpAll(() {
      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();
    });

    testWidgets(
      "Test If Widget Builds And Dispatches \"onTap\" Event On Tapped",
      (WidgetTester tester) async {
        bool isBackButtonTapped = false;
        final navigator = NavigatorMock((_, _) {}, (_) {
          isBackButtonTapped = true;
        });

        router = Router(navigator);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: LoadingSection(
                deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
                router: router,
              ),
            ),
          ),
        );

        expect(find.byType(LoadingIndicator), findsOneWidget);

        await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

        expect(isBackButtonTapped, true);
      },
    );
  });
}
