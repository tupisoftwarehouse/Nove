// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_unit_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeedUnitEntity _$SpeedUnitEntityFromJson(Map<String, dynamic> json) =>
    SpeedUnitEntity(
      json['value'] as String,
      $enumDecode(_$SpeedUnitEnumMap, json['measureUnit']),
    );

Map<String, dynamic> _$SpeedUnitEntityToJson(SpeedUnitEntity instance) =>
    <String, dynamic>{
      'measureUnit': _$SpeedUnitEnumMap[instance.measureUnit]!,
      'value': instance.value,
    };

const _$SpeedUnitEnumMap = {
  SpeedUnit.LIGHTSPEED: 'LIGHTSPEED',
  SpeedUnit.INCH_PER_SECOND: 'INCH_PER_SECOND',
  SpeedUnit.KILOMETER_PER_SECOND: 'KILOMETER_PER_SECOND',
  SpeedUnit.FOOT_PER_SECOND: 'FOOT_PER_SECOND',
  SpeedUnit.KNOT: 'KNOT',
  SpeedUnit.MACH: 'MACH',
  SpeedUnit.KILOMETER_PER_HOUR: 'KILOMETER_PER_HOUR',
  SpeedUnit.METER_PER_SECOND: 'METER_PER_SECOND',
  SpeedUnit.MILE_PER_SECOND: 'MILE_PER_SECOND',
  SpeedUnit.MILE_PER_HOUR: 'MILE_PER_HOUR',
};
