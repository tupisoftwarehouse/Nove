import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/united_states_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_kingdom_pound_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/switzerland_franc_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/australia_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/brazil_real_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/canada_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/new_zealand_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/euro_unit_entity.dart";

class CurrencyUnitTypeFixingTransactionScript {
  CurrencyUnitTypeFixingTransactionScript._();

  static CurrencyUnitEntity getTypeFixedInstanceFromMarshalledData(
    CurrencyUnitEntity instanceFromMarshalledData,
  ) {
    late final CurrencyUnitEntity typeFixedInstance;

    switch (instanceFromMarshalledData.measureUnit) {
      case CurrencyUnit.UNITED_STATES_DOLLAR:
        typeFixedInstance = UnitedStatesDollarUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case CurrencyUnit.UNITED_KINGDOM_POUND:
        typeFixedInstance = UnitedKingdomPoundUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case CurrencyUnit.SWITZERLAND_FRANC:
        typeFixedInstance = SwitzerlandFrancUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        typeFixedInstance = AustraliaDollarUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case CurrencyUnit.BRAZIL_REAL:
        typeFixedInstance = BrazilRealUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case CurrencyUnit.CANADA_DOLLAR:
        typeFixedInstance = CanadaDollarUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        typeFixedInstance = NewZealandDollarUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case CurrencyUnit.EURO:
        typeFixedInstance = EuroUnitEntity(instanceFromMarshalledData.value);

        break;
    }

    return typeFixedInstance;
  }
}
