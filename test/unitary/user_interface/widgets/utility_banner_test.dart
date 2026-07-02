import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/widgets/utility_banner.dart";

void main() {
  group("Test \"UtilityBanner\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UtilityBanner(
              icon: Symbols.auto_activity_zone_rounded,
              title: APPLICATION_LANGUAGE.AREA_UNIT_CONVERTER_UTILITY_NAME,
              accessibilityLabel: APPLICATION_LANGUAGE
                  .AREA_UNIT_CONVERTER_UTILITY_BANNER_ACCESSIBILITY_LABEL,
              onTap: () {
                isWidgetTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(
        find.text(APPLICATION_LANGUAGE.AREA_UNIT_CONVERTER_UTILITY_NAME),
      );

      expect(isWidgetTapped, true);
    });
  });
}
