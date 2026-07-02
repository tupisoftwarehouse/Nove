// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_unit_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaUnitEntity _$AreaUnitEntityFromJson(Map<String, dynamic> json) =>
    AreaUnitEntity(
      json['value'] as String,
      $enumDecode(_$AreaUnitEnumMap, json['measureUnit']),
    );

Map<String, dynamic> _$AreaUnitEntityToJson(AreaUnitEntity instance) =>
    <String, dynamic>{
      'measureUnit': _$AreaUnitEnumMap[instance.measureUnit]!,
      'value': instance.value,
    };

const _$AreaUnitEnumMap = {
  AreaUnit.SQUARE_KILOMETER: 'SQUARE_KILOMETER',
  AreaUnit.SQUARE_METER: 'SQUARE_METER',
  AreaUnit.SQUARE_CENTIMETER: 'SQUARE_CENTIMETER',
  AreaUnit.SQUARE_MILLIMETER: 'SQUARE_MILLIMETER',
  AreaUnit.SQUARE_MILE: 'SQUARE_MILE',
  AreaUnit.SQUARE_YARD: 'SQUARE_YARD',
  AreaUnit.SQUARE_FOOT: 'SQUARE_FOOT',
  AreaUnit.SQUARE_INCH: 'SQUARE_INCH',
  AreaUnit.HECTARE: 'HECTARE',
  AreaUnit.ACRE: 'ACRE',
};
