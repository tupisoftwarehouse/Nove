// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_mass_index_value_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyMassIndexValueObject _$BodyMassIndexValueObjectFromJson(
  Map<String, dynamic> json,
) => BodyMassIndexValueObject(
  (json['value'] as num).toDouble(),
  $enumDecode(_$BodyMassIndexCategoryEnumMap, json['category']),
);

Map<String, dynamic> _$BodyMassIndexValueObjectToJson(
  BodyMassIndexValueObject instance,
) => <String, dynamic>{
  'value': instance.value,
  'category': _$BodyMassIndexCategoryEnumMap[instance.category]!,
};

const _$BodyMassIndexCategoryEnumMap = {
  BodyMassIndexCategory.UNDERWEIGHT: 'UNDERWEIGHT',
  BodyMassIndexCategory.NORMAL_WEIGHT: 'NORMAL_WEIGHT',
  BodyMassIndexCategory.OVERWEIGHT: 'OVERWEIGHT',
  BodyMassIndexCategory.OBESE: 'OBESE',
};
