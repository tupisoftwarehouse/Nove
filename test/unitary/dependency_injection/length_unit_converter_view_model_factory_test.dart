import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/length_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"LengthUnitConverterViewModelFactory\" Class", () {
    late LengthUnitConverterViewModel instance;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"LengthUnitConverterViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_LENGTH_UNITS_KEY] =
            MARSHALLED_LIST_OF_LENGTH_UNIT;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[BASE_LENGTH_UNIT_ELEMENT_INDEX_KEY] = 0
            .toString();

        instance = LengthUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfLengthUnits.value[0].measureUnit,
          ZEROED_LENGTH_UNIT.measureUnit,
        );
        expect(
          instance.listOfLengthUnits.value[0].value,
          ZEROED_LENGTH_UNIT.value,
        );

        expect(instance.baseLengthUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"LengthUnitConverterViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = LengthUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfLengthUnits.value[0].measureUnit,
          ZEROED_LENGTH_UNIT.measureUnit,
        );
        expect(
          instance.listOfLengthUnits.value[0].value,
          ZEROED_LENGTH_UNIT.value,
        );

        expect(instance.baseLengthUnitIndex.value, 0);
      },
    );
  });
}
