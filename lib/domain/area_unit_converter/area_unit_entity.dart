import "dart:convert";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/area_unit_converter/internals/transaction_scripts/area_unit_type_fixing_transaction_script.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:json_annotation/json_annotation.dart";

part "area_unit_entity.g.dart";

@JsonSerializable()
class AreaUnitEntity extends MeasureUnitEntity<AreaUnit> {
  AreaUnitEntity(super.value, super.measureUnit);

  @override
  void convertTo(MeasureUnitEntity<AreaUnit> measureUnit) {}

  factory AreaUnitEntity.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);
    final instanceFromMarshalledData = _$AreaUnitEntityFromJson(
      unmarshallableData,
    );

    return AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
      instanceFromMarshalledData,
    );
  }

  String get marshalledData {
    final marshallableData = _$AreaUnitEntityToJson(this);

    return jsonEncode(marshallableData);
  }

  static List<AreaUnitEntity> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      final instanceFromMarshalledData = _$AreaUnitEntityFromJson(
        marshalledData,
      );

      return AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
        instanceFromMarshalledData,
      );
    }).toList();
  }

  static String marshalledListData(List<AreaUnitEntity> listOfAreaUnits) {
    final listOfMarshallableData = listOfAreaUnits.map((item) {
      return _$AreaUnitEntityToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
