import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/number_system_converter_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"NumberSystemConverterViewModelFactory\" Class", () {
    late NumberSystemConverterViewModel instance;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"NumberSystemConverterViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_NUMBER_SYSTEMS_KEY] =
            MARSHALLED_LIST_OF_NUMBER_SYSTEM;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[BASE_NUMBER_SYSTEM_ELEMENT_INDEX_KEY] = 0
            .toString();

        instance = NumberSystemConverterViewModelFactory.getInstance();

        expect(
          instance.listOfNumberSystems.value[0].measureUnit,
          ZEROED_NUMBER_SYSTEM.measureUnit,
        );
        expect(
          instance.listOfNumberSystems.value[0].value,
          ZEROED_NUMBER_SYSTEM.value,
        );

        expect(instance.baseNumberSystemIndex.value, 0);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"NumberSystemConverterViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = NumberSystemConverterViewModelFactory.getInstance();

        expect(
          instance.listOfNumberSystems.value[0].measureUnit,
          ZEROED_NUMBER_SYSTEM.measureUnit,
        );
        expect(
          instance.listOfNumberSystems.value[0].value,
          ZEROED_NUMBER_SYSTEM.value,
        );

        expect(instance.baseNumberSystemIndex.value, 0);
      },
    );
  });
}
