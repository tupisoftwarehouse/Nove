import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/speed_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"SpeedUnitConverterViewModelFactory\" Class", () {
    late SpeedUnitConverterViewModel instance;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"SpeedUnitConverterViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_SPEED_UNITS_KEY] =
            MARSHALLED_LIST_OF_SPEED_UNIT;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[BASE_SPEED_UNIT_ELEMENT_INDEX_KEY] = 0
            .toString();

        instance = SpeedUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfSpeedUnits.value[0].measureUnit,
          ZEROED_SPEED_UNIT.measureUnit,
        );
        expect(
          instance.listOfSpeedUnits.value[0].value,
          ZEROED_SPEED_UNIT.value,
        );

        expect(instance.baseSpeedUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"SpeedUnitConverterViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = SpeedUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfSpeedUnits.value[0].measureUnit,
          ZEROED_SPEED_UNIT.measureUnit,
        );
        expect(
          instance.listOfSpeedUnits.value[0].value,
          ZEROED_SPEED_UNIT.value,
        );

        expect(instance.baseSpeedUnitIndex.value, 0);
      },
    );
  });
}
