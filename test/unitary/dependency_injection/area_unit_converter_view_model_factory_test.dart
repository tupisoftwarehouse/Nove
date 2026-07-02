import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/area_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"AreaUnitConverterViewModelFactory\" Class", () {
    late AreaUnitConverterViewModel instance;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"AreaUnitConverterViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_AREA_UNITS_KEY] =
            MARSHALLED_LIST_OF_AREA_UNIT;

        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[BASE_AREA_UNIT_ELEMENT_INDEX_KEY] = 0
            .toString();

        instance = AreaUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfAreaUnits.value[0].measureUnit,
          ZEROED_AREA_UNIT.measureUnit,
        );
        expect(instance.listOfAreaUnits.value[0].value, ZEROED_AREA_UNIT.value);

        expect(instance.baseAreaUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"AreaUnitConverterViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = AreaUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfAreaUnits.value[0].measureUnit,
          ZEROED_AREA_UNIT.measureUnit,
        );
        expect(instance.listOfAreaUnits.value[0].value, ZEROED_AREA_UNIT.value);

        expect(instance.baseAreaUnitIndex.value, 0);
      },
    );
  });
}
