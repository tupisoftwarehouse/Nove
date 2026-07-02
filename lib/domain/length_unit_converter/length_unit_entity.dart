import "dart:convert";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/internals/transaction_scripts/length_unit_type_fixing_transaction_script.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:json_annotation/json_annotation.dart";

part "length_unit_entity.g.dart";

@JsonSerializable()
class LengthUnitEntity extends MeasureUnitEntity<LengthUnit> {
  LengthUnitEntity(super.value, super.measureUnit);

  @override
  void convertTo(MeasureUnitEntity<LengthUnit> measureUnit) {}

  factory LengthUnitEntity.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);
    final instanceFromMarshalledData = _$LengthUnitEntityFromJson(
      unmarshallableData,
    );

    return LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
      instanceFromMarshalledData,
    );
  }

  String get marshalledData {
    final marshallableData = _$LengthUnitEntityToJson(this);

    return jsonEncode(marshallableData);
  }

  static List<LengthUnitEntity> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      final instanceFromMarshalledData = _$LengthUnitEntityFromJson(
        marshalledData,
      );

      return LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
        instanceFromMarshalledData,
      );
    }).toList();
  }

  static String marshalledListData(List<LengthUnitEntity> listOfLengthUnits) {
    final listOfMarshallableData = listOfLengthUnits.map((item) {
      return _$LengthUnitEntityToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
