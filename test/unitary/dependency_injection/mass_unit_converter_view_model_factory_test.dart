import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/mass_unit_converter_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"MassUnitConverterViewModelFactory\" Class", () {
    late MassUnitConverterViewModel instance;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"MassUnitConverterViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[LIST_OF_MASS_UNITS_KEY] =
            MARSHALLED_LIST_OF_MASS_UNIT;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
            .mapOfItems[BASE_MASS_UNIT_ELEMENT_INDEX_KEY] = 0
            .toString();

        instance = MassUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfMassUnits.value[0].measureUnit,
          ZEROED_MASS_UNIT.measureUnit,
        );
        expect(instance.listOfMassUnits.value[0].value, ZEROED_MASS_UNIT.value);

        expect(instance.baseMassUnitIndex.value, 0);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"MassUnitConverterViewModel\" With Zeroed Data If Data Is Not In Key-Value Database",
      () {
        instance = MassUnitConverterViewModelFactory.getInstance();

        expect(
          instance.listOfMassUnits.value[0].measureUnit,
          ZEROED_MASS_UNIT.measureUnit,
        );
        expect(instance.listOfMassUnits.value[0].value, ZEROED_MASS_UNIT.value);

        expect(instance.baseMassUnitIndex.value, 0);
      },
    );
  });
}
