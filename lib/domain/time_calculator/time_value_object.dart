import "dart:convert";
import "package:json_annotation/json_annotation.dart";

part "time_value_object.g.dart";

@JsonSerializable()
class TimeValueObject {
  final int hours;
  final int minutes;
  final int seconds;

  TimeValueObject(this.hours, this.minutes, this.seconds);

  factory TimeValueObject.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);

    return _$TimeValueObjectFromJson(unmarshallableData);
  }

  String get marshalledData {
    final marshallableData = _$TimeValueObjectToJson(this);

    return jsonEncode(marshallableData);
  }

  static List<TimeValueObject> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      return _$TimeValueObjectFromJson(marshalledData);
    }).toList();
  }

  static String marshalledListData(
    List<TimeValueObject> listOfTimeValueObjects,
  ) {
    final listOfMarshallableData = listOfTimeValueObjects.map((item) {
      return _$TimeValueObjectToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
