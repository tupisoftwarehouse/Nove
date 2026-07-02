import "dart:convert";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/internals/transaction_scripts/mass_unit_type_fixing_transaction_script.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:json_annotation/json_annotation.dart";

part "mass_unit_entity.g.dart";

@JsonSerializable()
class MassUnitEntity extends MeasureUnitEntity<MassUnit> {
  MassUnitEntity(super.value, super.measureUnit);

  @override
  void convertTo(MeasureUnitEntity<MassUnit> measureUnit) {}

  factory MassUnitEntity.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);
    final instanceFromMarshalledData = _$MassUnitEntityFromJson(
      unmarshallableData,
    );

    return MassUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
      instanceFromMarshalledData,
    );
  }

  String get marshalledData {
    final marshallableData = _$MassUnitEntityToJson(this);

    return jsonEncode(marshallableData);
  }

  static List<MassUnitEntity> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      final instanceFromMarshalledData = _$MassUnitEntityFromJson(
        marshalledData,
      );

      return MassUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
        instanceFromMarshalledData,
      );
    }).toList();
  }

  static String marshalledListData(List<MassUnitEntity> listOfMassUnits) {
    final listOfMarshallableData = listOfMassUnits.map((item) {
      return _$MassUnitEntityToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
