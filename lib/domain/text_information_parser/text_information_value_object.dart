import "dart:convert";
import "package:json_annotation/json_annotation.dart";

part "text_information_value_object.g.dart";

@JsonSerializable()
class TextInformationValueObject {
  final int amountOfWords;
  final int length;

  TextInformationValueObject(this.amountOfWords, this.length);

  factory TextInformationValueObject.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);

    return _$TextInformationValueObjectFromJson(unmarshallableData);
  }

  String get marshalledData {
    final marshallableData = _$TextInformationValueObjectToJson(this);

    return jsonEncode(marshallableData);
  }
}
