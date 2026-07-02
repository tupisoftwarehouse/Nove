import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/text_area.dart";

void main() {
  group("Test \"TextArea\" Widget", () {
    testWidgets(
      "Test If Widget Dispatches \"onChange\" Event On Text Changed",
      (WidgetTester tester) async {
        final controller = TextEditingController();
        String changedText = "";

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TextArea(
                placeholder: APPLICATION_LANGUAGE.TEXT_AREA_PLACEHOLDER,
                controller: controller,
                focusNode: FOCUS_NODE,
                onChanged: (value) {
                  changedText = value;
                },
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(TextField), SMALL_TEXT_TO_BE_PARSED);

        expect(changedText, SMALL_TEXT_TO_BE_PARSED);

        expect(controller.text, SMALL_TEXT_TO_BE_PARSED);
      },
    );
  });
}
