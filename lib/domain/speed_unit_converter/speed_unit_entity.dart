import "dart:convert";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/internals/transaction_scripts/speed_unit_type_fixing_transaction_script.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:json_annotation/json_annotation.dart";

part "speed_unit_entity.g.dart";

@JsonSerializable()
class SpeedUnitEntity extends MeasureUnitEntity<SpeedUnit> {
  SpeedUnitEntity(super.value, super.measureUnit);

  @override
  void convertTo(MeasureUnitEntity<SpeedUnit> measureUnit) {}

  factory SpeedUnitEntity.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);
    final instanceFromMarshalledData = _$SpeedUnitEntityFromJson(
      unmarshallableData,
    );

    return SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
      instanceFromMarshalledData,
    );
  }

  String get marshalledData {
    final marshallableData = _$SpeedUnitEntityToJson(this);

    return jsonEncode(marshallableData);
  }

  static List<SpeedUnitEntity> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      final instanceFromMarshalledData = _$SpeedUnitEntityFromJson(
        marshalledData,
      );

      return SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
        instanceFromMarshalledData,
      );
    }).toList();
  }

  static String marshalledListData(List<SpeedUnitEntity> listOfSpeedUnits) {
    final listOfMarshallableData = listOfSpeedUnits.map((item) {
      return _$SpeedUnitEntityToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
