import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/user_interface/internals/entities/reference_entity.dart";

void main() {
  group("Test \"ReferenceEntity\" Entity", () {
    test(
      "Test If Method \"setObserver\" Executes Callback When Value Is Updated",
      () {
        late bool isCallbackExecuted;
        final instance = ReferenceEntity<int>();

        instance.setObserver(() {
          isCallbackExecuted = true;
        });

        instance.value = CURRENT_CURRENCY_VALUES.updatedAt;

        expect(instance.value, CURRENT_CURRENCY_VALUES.updatedAt);
        expect(isCallbackExecuted, true);
      },
    );
  });
}
