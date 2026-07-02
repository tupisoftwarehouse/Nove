import "dart:convert";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/internals/transaction_scripts/number_system_type_fixing_transaction_script.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:json_annotation/json_annotation.dart";

part "number_system_entity.g.dart";

@JsonSerializable()
class NumberSystemEntity extends MeasureUnitEntity<NumberSystem> {
  NumberSystemEntity(super.value, super.measureUnit);

  @override
  void convertTo(MeasureUnitEntity<NumberSystem> measureUnit) {}

  factory NumberSystemEntity.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);
    final instanceFromMarshalledData = _$NumberSystemEntityFromJson(
      unmarshallableData,
    );

    return NumberSystemTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
      instanceFromMarshalledData,
    );
  }

  String get marshalledData {
    final marshallableData = _$NumberSystemEntityToJson(this);

    return jsonEncode(marshallableData);
  }

  static List<NumberSystemEntity> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      final instanceFromMarshalledData = _$NumberSystemEntityFromJson(
        marshalledData,
      );

      return NumberSystemTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
        instanceFromMarshalledData,
      );
    }).toList();
  }

  static String marshalledListData(
    List<NumberSystemEntity> listOfNumberSystems,
  ) {
    final listOfMarshallableData = listOfNumberSystems.map((item) {
      return _$NumberSystemEntityToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
