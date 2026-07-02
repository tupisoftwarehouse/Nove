import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/input.dart";

void main() {
  group("Test \"Input\" Widget", () {
    testWidgets(
      "Test If Widget Dispatches \"onChange\" Event On Text Changed",
      (WidgetTester tester) async {
        final controller = TextEditingController();
        String changedText = "";

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Input(
                hintText: APPLICATION_LANGUAGE.AGE_INPUT_PLACEHOLDER,
                type: TextInputType.number,
                controller: controller,
                focusNode: FOCUS_NODE,
                onChanged: (value) {
                  changedText = value;
                },
              ),
            ),
          ),
        );

        await tester.enterText(
          find.byType(TextField),
          NORMAL_WEIGHT_BODY_MASS_INDEX_THRESHOLD.toString(),
        );

        expect(changedText, NORMAL_WEIGHT_BODY_MASS_INDEX_THRESHOLD.toString());

        expect(
          controller.text,
          NORMAL_WEIGHT_BODY_MASS_INDEX_THRESHOLD.toString(),
        );
      },
    );
  });
}
