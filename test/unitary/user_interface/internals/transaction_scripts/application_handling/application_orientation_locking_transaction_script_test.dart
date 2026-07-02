import "package:flutter/services.dart";
import "package:flutter/widgets.dart" as widgets;
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/transaction_scripts/application_handling/application_orientation_locking_transaction_script.dart";

void main() {
  group("Test \"ApplicationOrientationLockingTransactionScriptTest\" Class", () {
    test(
      "Test If Method \"lockApplicationWindowOrientation\" Locks Application Window Orientation When Application Window Width Is Changed",
      () async {
        late final List<DeviceOrientation>
        smallApplicationWindowWidthOrientation;
        late final List<DeviceOrientation>
        largeApplicationWindowWidthOrientation;

        await ApplicationOrientationLockingTransactionScript.lockApplicationWindowOrientation(
          CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
          CALCULATOR_SCREEN_MINIMAL_HEIGHT,
          CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
          CALCULATOR_SCREEN_MINIMAL_HEIGHT,
          widgets.Orientation.landscape,
          (applicationWindowOrientations) async {
            smallApplicationWindowWidthOrientation =
                applicationWindowOrientations;
          },
        );

        await ApplicationOrientationLockingTransactionScript.lockApplicationWindowOrientation(
          CALCULATOR_SCREEN_MINIMAL_HEIGHT,
          CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
          CALCULATOR_SCREEN_MINIMAL_HEIGHT,
          CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
          widgets.Orientation.landscape,
          (applicationWindowOrientations) async {
            largeApplicationWindowWidthOrientation =
                applicationWindowOrientations;
          },
        );

        expect(
          smallApplicationWindowWidthOrientation[0],
          PORTRAIT_ORIENTATION[0],
        );

        expect(
          largeApplicationWindowWidthOrientation[0],
          LANDSCAPE_ORIENTATION[0],
        );
        expect(
          largeApplicationWindowWidthOrientation[1],
          LANDSCAPE_ORIENTATION[1],
        );
        expect(
          largeApplicationWindowWidthOrientation[2],
          LANDSCAPE_ORIENTATION[2],
        );
      },
    );

    test(
      "Test If Method \"lockApplicationWindowOrientation\" Locks Application Window Orientation To Portrait When Application Window Orientation Is Landscape But The Height Is Not Enough To Be Landscape",
      () async {
        late final List<DeviceOrientation> applicationWindowWidthOrientation;

        await ApplicationOrientationLockingTransactionScript.lockApplicationWindowOrientation(
          CALCULATOR_SCREEN_MINIMAL_HEIGHT,
          CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
          CALCULATOR_SCREEN_MINIMAL_HEIGHT,
          CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
          widgets.Orientation.landscape,
          (applicationWindowOrientations) async {
            applicationWindowWidthOrientation = applicationWindowOrientations;
          },
        );

        expect(applicationWindowWidthOrientation[0], PORTRAIT_ORIENTATION[0]);
      },
    );
  });
}
