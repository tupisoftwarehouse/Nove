import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/temperature_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TemperatureUnitConverterViewModelFactory\" Class", () {
    late TemperatureUnitConverterViewModel instance;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"TemperatureUnitConverterViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_TEMPERATURE_UNITS_KEY] =
            MARSHALLED_LIST_OF_TEMPERATURE_UNIT;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[BASE_TEMPERATURE_UNIT_ELEMENT_INDEX_KEY] = 0
            .toString();

        instance = TemperatureUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfTemperatureUnits.value[0].measureUnit,
          ZEROED_TEMPERATURE_UNIT.measureUnit,
        );
        expect(
          instance.listOfTemperatureUnits.value[0].value,
          ZEROED_TEMPERATURE_UNIT.value,
        );

        expect(instance.baseTemperatureUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"TemperatureUnitConverterViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = TemperatureUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfTemperatureUnits.value[0].measureUnit,
          ZEROED_TEMPERATURE_UNIT.measureUnit,
        );
        expect(
          instance.listOfTemperatureUnits.value[0].value,
          ZEROED_TEMPERATURE_UNIT.value,
        );

        expect(instance.baseTemperatureUnitIndex.value, 0);
      },
    );
  });
}
