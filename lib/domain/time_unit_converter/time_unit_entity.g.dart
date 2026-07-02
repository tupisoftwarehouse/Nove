// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_unit_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeUnitEntity _$TimeUnitEntityFromJson(Map<String, dynamic> json) =>
    TimeUnitEntity(
      json['value'] as String,
      $enumDecode(_$TimeUnitEnumMap, json['measureUnit']),
    );

Map<String, dynamic> _$TimeUnitEntityToJson(TimeUnitEntity instance) =>
    <String, dynamic>{
      'measureUnit': _$TimeUnitEnumMap[instance.measureUnit]!,
      'value': instance.value,
    };

const _$TimeUnitEnumMap = {
  TimeUnit.YEAR: 'YEAR',
  TimeUnit.WEEK: 'WEEK',
  TimeUnit.DAY: 'DAY',
  TimeUnit.HOUR: 'HOUR',
  TimeUnit.MINUTE: 'MINUTE',
  TimeUnit.SECOND: 'SECOND',
  TimeUnit.MILLISECOND: 'MILLISECOND',
};
