import "dart:convert";
import "package:json_annotation/json_annotation.dart";

part "body_mass_index_calculation_candidate_value_object.g.dart";

@JsonSerializable()
class BodyMassIndexCalculationCandidateValueObject {
  final double height;
  final double weight;

  BodyMassIndexCalculationCandidateValueObject(this.height, this.weight);

  factory BodyMassIndexCalculationCandidateValueObject.fromMarshalledData(
    String marshalledData,
  ) {
    final unmarshallableData = jsonDecode(marshalledData);

    return _$BodyMassIndexCalculationCandidateValueObjectFromJson(
      unmarshallableData,
    );
  }

  String get marshalledData {
    final marshallableData =
        _$BodyMassIndexCalculationCandidateValueObjectToJson(this);

    return jsonEncode(marshallableData);
  }
}
