import "package:nove/constants/user_interface_constants.dart";

class NotExistingItemError extends Error {
  @override
  String toString() {
    return NOT_EXISTING_ITEM_ERROR_MESSAGE;
  }
}
