import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class ApplicationOrientationLockingTransactionScript {
  ApplicationOrientationLockingTransactionScript._();

  static Future<void> lockApplicationWindowOrientation(
    double currentApplicationWindowHeight,
    double previousApplicationWindowHeight,
    double currentApplicationWindowWidth,
    double previousApplicationWindowWidth,
    Orientation initialApplicationWindowOrientation,
    Future<void> Function(List<DeviceOrientation> applicationWindowOrientations)
    lockApplicationWindowOrientation,
  ) async {
    if (isApplicationWindowHeightNotChanged(
          currentApplicationWindowHeight,
          previousApplicationWindowHeight,
        ) &&
        isApplicationWindowWidthNotChanged(
          currentApplicationWindowWidth,
          previousApplicationWindowWidth,
        )) {
      return;
    } else if (isApplicationWindowLandscape(
          initialApplicationWindowOrientation,
        ) &&
        isApplicationWindowHeightSmall(currentApplicationWindowHeight)) {
      await lockApplicationWindowOrientation(PORTRAIT_ORIENTATION);
    } else if (isApplicationWindowWidthSmall(currentApplicationWindowWidth)) {
      await lockApplicationWindowOrientation(PORTRAIT_ORIENTATION);
    } else {
      await lockApplicationWindowOrientation(LANDSCAPE_ORIENTATION);
    }
  }
}
