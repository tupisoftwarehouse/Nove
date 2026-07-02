// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mass_unit_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MassUnitEntity _$MassUnitEntityFromJson(Map<String, dynamic> json) =>
    MassUnitEntity(
      json['value'] as String,
      $enumDecode(_$MassUnitEnumMap, json['measureUnit']),
    );

Map<String, dynamic> _$MassUnitEntityToJson(MassUnitEntity instance) =>
    <String, dynamic>{
      'measureUnit': _$MassUnitEnumMap[instance.measureUnit]!,
      'value': instance.value,
    };

const _$MassUnitEnumMap = {
  MassUnit.TONNE: 'TONNE',
  MassUnit.KILOGRAM: 'KILOGRAM',
  MassUnit.GRAM: 'GRAM',
  MassUnit.MILLIGRAM: 'MILLIGRAM',
  MassUnit.POUND: 'POUND',
  MassUnit.OUNCE: 'OUNCE',
};
