import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/united_states_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_kingdom_pound_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/switzerland_franc_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/australia_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/brazil_real_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/canada_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/new_zealand_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/euro_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/transaction_scripts/currency_unit_type_fixing_transaction_script.dart";

void main() {
  group("Test \"CurrencyUnitTypeFixingTransactionScript\" Class", () {
    test(
      "Test If Method \"getTypeFixedInstanceFromMarshalledData\" Returns A Type Fixed Instance Of Instance From Marshalled Data",
      () {
        final unitedStatesDollarUnitInstanceFromMarshalledData =
            CurrencyUnitEntity(
              ZEROED_CURRENCY_UNIT_VALUE,
              CurrencyUnit.UNITED_STATES_DOLLAR,
            );
        final unitedKingdomPoundUnitInstanceFromMarshalledData =
            CurrencyUnitEntity(
              ZEROED_CURRENCY_UNIT_VALUE,
              CurrencyUnit.UNITED_KINGDOM_POUND,
            );
        final switzerlandFrancUnitInstanceFromMarshalledData =
            CurrencyUnitEntity(
              ZEROED_CURRENCY_UNIT_VALUE,
              CurrencyUnit.SWITZERLAND_FRANC,
            );
        final australiaDollarUnitInstanceFromMarshalledData =
            CurrencyUnitEntity(
              ZEROED_CURRENCY_UNIT_VALUE,
              CurrencyUnit.AUSTRALIA_DOLLAR,
            );
        final brazilRealUnitInstanceFromMarshalledData = CurrencyUnitEntity(
          ZEROED_CURRENCY_UNIT_VALUE,
          CurrencyUnit.BRAZIL_REAL,
        );
        final canadaDollarUnitInstanceFromMarshalledData = CurrencyUnitEntity(
          ZEROED_CURRENCY_UNIT_VALUE,
          CurrencyUnit.CANADA_DOLLAR,
        );
        final newZealandDollarUnitInstanceFromMarshalledData =
            CurrencyUnitEntity(
              ZEROED_CURRENCY_UNIT_VALUE,
              CurrencyUnit.NEW_ZEALAND_DOLLAR,
            );
        final euroUnitInstanceFromMarshalledData = CurrencyUnitEntity(
          ZEROED_CURRENCY_UNIT_VALUE,
          CurrencyUnit.EURO,
        );
        final unitedStatesDollarUnitFixedInstance =
            CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              unitedStatesDollarUnitInstanceFromMarshalledData,
            );
        final unitedKingdomPoundUnitFixedInstance =
            CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              unitedKingdomPoundUnitInstanceFromMarshalledData,
            );
        final switzerlandFrancUnitFixedInstance =
            CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              switzerlandFrancUnitInstanceFromMarshalledData,
            );
        final australiaDollarUnitFixedInstance =
            CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              australiaDollarUnitInstanceFromMarshalledData,
            );
        final brazilRealUnitFixedInstance =
            CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              brazilRealUnitInstanceFromMarshalledData,
            );
        final canadaDollarUnitFixedInstance =
            CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              canadaDollarUnitInstanceFromMarshalledData,
            );
        final newZealandDollarUnitFixedInstance =
            CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              newZealandDollarUnitInstanceFromMarshalledData,
            );
        final euroUnitFixedInstance =
            CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              euroUnitInstanceFromMarshalledData,
            );

        expect(
          unitedStatesDollarUnitFixedInstance,
          isA<UnitedStatesDollarUnitEntity>(),
        );
        expect(
          unitedKingdomPoundUnitFixedInstance,
          isA<UnitedKingdomPoundUnitEntity>(),
        );
        expect(
          switzerlandFrancUnitFixedInstance,
          isA<SwitzerlandFrancUnitEntity>(),
        );
        expect(
          australiaDollarUnitFixedInstance,
          isA<AustraliaDollarUnitEntity>(),
        );
        expect(brazilRealUnitFixedInstance, isA<BrazilRealUnitEntity>());
        expect(canadaDollarUnitFixedInstance, isA<CanadaDollarUnitEntity>());
        expect(
          newZealandDollarUnitFixedInstance,
          isA<NewZealandDollarUnitEntity>(),
        );
        expect(euroUnitFixedInstance, isA<EuroUnitEntity>());
      },
    );
  });
}
