import "dart:convert";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/internals/transaction_scripts/time_unit_type_fixing_transaction_script.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:json_annotation/json_annotation.dart";

part "time_unit_entity.g.dart";

@JsonSerializable()
class TimeUnitEntity extends MeasureUnitEntity<TimeUnit> {
  TimeUnitEntity(super.value, super.measureUnit);

  @override
  void convertTo(MeasureUnitEntity<TimeUnit> measureUnit) {}

  factory TimeUnitEntity.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);
    final instanceFromMarshalledData = _$TimeUnitEntityFromJson(
      unmarshallableData,
    );

    return TimeUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
      instanceFromMarshalledData,
    );
  }

  String get marshalledData {
    final marshallableData = _$TimeUnitEntityToJson(this);

    return jsonEncode(marshallableData);
  }

  static List<TimeUnitEntity> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      final instanceFromMarshalledData = _$TimeUnitEntityFromJson(
        marshalledData,
      );

      return TimeUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
        instanceFromMarshalledData,
      );
    }).toList();
  }

  static String marshalledListData(List<TimeUnitEntity> listOfTimeUnits) {
    final listOfMarshallableData = listOfTimeUnits.map((item) {
      return _$TimeUnitEntityToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
