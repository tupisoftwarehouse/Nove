import "dart:convert";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/internals/transaction_scripts/temperature_unit_type_fixing_transaction_script.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:json_annotation/json_annotation.dart";

part "temperature_unit_entity.g.dart";

@JsonSerializable()
class TemperatureUnitEntity extends MeasureUnitEntity<TemperatureUnit> {
  TemperatureUnitEntity(super.value, super.measureUnit);

  @override
  void convertTo(MeasureUnitEntity<TemperatureUnit> measureUnit) {}

  factory TemperatureUnitEntity.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);
    final instanceFromMarshalledData = _$TemperatureUnitEntityFromJson(
      unmarshallableData,
    );

    return TemperatureUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
      instanceFromMarshalledData,
    );
  }

  String get marshalledData {
    final marshallableData = _$TemperatureUnitEntityToJson(this);

    return jsonEncode(marshallableData);
  }

  static List<TemperatureUnitEntity> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      final instanceFromMarshalledData = _$TemperatureUnitEntityFromJson(
        marshalledData,
      );

      return TemperatureUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
        instanceFromMarshalledData,
      );
    }).toList();
  }

  static String marshalledListData(
    List<TemperatureUnitEntity> listOfTemperatureUnits,
  ) {
    final listOfMarshallableData = listOfTemperatureUnits.map((item) {
      return _$TemperatureUnitEntityToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
