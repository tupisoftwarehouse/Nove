import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/time_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/time_unit_converter_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeUnitConverterViewModelFactory\" Class", () {
    late TimeUnitConverterViewModel instance;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"TimeUnitConverterViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_TIME_UNITS_KEY] =
            MARSHALLED_LIST_OF_TIME_UNIT;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[BASE_TIME_UNIT_ELEMENT_INDEX_KEY] = 0
            .toString();

        instance = TimeUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfTimeUnits.value[0].measureUnit,
          ZEROED_TIME_UNIT.measureUnit,
        );
        expect(instance.listOfTimeUnits.value[0].value, ZEROED_TIME_UNIT.value);

        expect(instance.baseTimeUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"TimeUnitConverterViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = TimeUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfTimeUnits.value[0].measureUnit,
          ZEROED_TIME_UNIT.measureUnit,
        );
        expect(instance.listOfTimeUnits.value[0].value, ZEROED_TIME_UNIT.value);

        expect(instance.baseTimeUnitIndex.value, 0);
      },
    );
  });
}
