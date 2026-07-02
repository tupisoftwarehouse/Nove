import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/tonne_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/kilogram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/gram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/milligram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/pound_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/ounce_unit_entity.dart";

class MassUnitTypeFixingTransactionScript {
  MassUnitTypeFixingTransactionScript._();

  static MassUnitEntity getTypeFixedInstanceFromMarshalledData(
    MassUnitEntity instanceFromMarshalledData,
  ) {
    late final MassUnitEntity typeFixedInstance;

    switch (instanceFromMarshalledData.measureUnit) {
      case MassUnit.TONNE:
        typeFixedInstance = TonneUnitEntity(instanceFromMarshalledData.value);

        break;
      case MassUnit.KILOGRAM:
        typeFixedInstance = KilogramUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case MassUnit.GRAM:
        typeFixedInstance = GramUnitEntity(instanceFromMarshalledData.value);

        break;
      case MassUnit.MILLIGRAM:
        typeFixedInstance = MilligramUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case MassUnit.POUND:
        typeFixedInstance = PoundUnitEntity(instanceFromMarshalledData.value);

        break;
      case MassUnit.OUNCE:
        typeFixedInstance = OunceUnitEntity(instanceFromMarshalledData.value);

        break;
    }

    return typeFixedInstance;
  }
}
