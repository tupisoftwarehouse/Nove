import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_states_dollar_unit_entity.dart";

void main() {
  group("Test \"CurrencyUnitEntity\" Entity", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns An Instance From Marshalled Data",
      () {
        final currencyUnitInstance = CurrencyUnitEntity.fromMarshalledData(
          MARSHALLED_CURRENCY_UNIT,
        );

        expect(currencyUnitInstance, isA<CurrencyUnitEntity>());
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = UnitedStatesDollarUnitEntity(
          ZEROED_CURRENCY_UNIT_VALUE,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_CURRENCY_UNIT);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns List Of Instances From Marshalled List Data",
      () {
        final instance = CurrencyUnitEntity.fromMarshalledListData(
          MARSHALLED_LIST_OF_CURRENCY_UNIT,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns Marshalled List Data",
      () {
        final marshalledListData = CurrencyUnitEntity.marshalledListData([
          ZEROED_CURRENCY_UNIT,
        ]);

        expect(marshalledListData, MARSHALLED_LIST_OF_CURRENCY_UNIT);
      },
    );
  });
}
