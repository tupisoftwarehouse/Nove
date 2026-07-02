import "dart:convert";
import "package:json_annotation/json_annotation.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_category.dart";

part "body_mass_index_value_object.g.dart";

@JsonSerializable()
class BodyMassIndexValueObject {
  final double value;
  final BodyMassIndexCategory category;

  BodyMassIndexValueObject(this.value, this.category);

  factory BodyMassIndexValueObject.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);

    return _$BodyMassIndexValueObjectFromJson(unmarshallableData);
  }

  String get marshalledData {
    final marshallableData = _$BodyMassIndexValueObjectToJson(this);

    return jsonEncode(marshallableData);
  }
}
