// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_mass_index_calculation_candidate_value_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyMassIndexCalculationCandidateValueObject
_$BodyMassIndexCalculationCandidateValueObjectFromJson(
  Map<String, dynamic> json,
) => BodyMassIndexCalculationCandidateValueObject(
  (json['height'] as num).toDouble(),
  (json['weight'] as num).toDouble(),
);

Map<String, dynamic> _$BodyMassIndexCalculationCandidateValueObjectToJson(
  BodyMassIndexCalculationCandidateValueObject instance,
) => <String, dynamic>{'height': instance.height, 'weight': instance.weight};
