import "dart:convert";
import "package:json_annotation/json_annotation.dart";

part "expression_snapshot_value_object.g.dart";

@JsonSerializable()
class ExpressionSnapshotValueObject {
  final String expression;
  final String result;

  ExpressionSnapshotValueObject(this.expression, this.result);

  factory ExpressionSnapshotValueObject.fromMarshalledData(
    String marshalledData,
  ) {
    final unmarshallableData = jsonDecode(marshalledData);

    return _$ExpressionSnapshotValueObjectFromJson(unmarshallableData);
  }

  String get marshalledData {
    final marshallableData = _$ExpressionSnapshotValueObjectToJson(this);

    return jsonEncode(marshallableData);
  }

  static List<ExpressionSnapshotValueObject> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      return _$ExpressionSnapshotValueObjectFromJson(marshalledData);
    }).toList();
  }

  static String marshalledListData(
    List<ExpressionSnapshotValueObject> listOfExpressionSnapshots,
  ) {
    final listOfMarshallableData = listOfExpressionSnapshots.map((item) {
      return _$ExpressionSnapshotValueObjectToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
