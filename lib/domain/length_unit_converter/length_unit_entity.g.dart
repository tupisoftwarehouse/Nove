// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'length_unit_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LengthUnitEntity _$LengthUnitEntityFromJson(Map<String, dynamic> json) =>
    LengthUnitEntity(
      json['value'] as String,
      $enumDecode(_$LengthUnitEnumMap, json['measureUnit']),
    );

Map<String, dynamic> _$LengthUnitEntityToJson(LengthUnitEntity instance) =>
    <String, dynamic>{
      'measureUnit': _$LengthUnitEnumMap[instance.measureUnit]!,
      'value': instance.value,
    };

const _$LengthUnitEnumMap = {
  LengthUnit.KILOMETER: 'KILOMETER',
  LengthUnit.METER: 'METER',
  LengthUnit.CENTIMETER: 'CENTIMETER',
  LengthUnit.MILLIMETER: 'MILLIMETER',
  LengthUnit.MILE: 'MILE',
  LengthUnit.YARD: 'YARD',
  LengthUnit.FOOT: 'FOOT',
  LengthUnit.INCH: 'INCH',
  LengthUnit.NAUTICAL_MILE: 'NAUTICAL_MILE',
};
