// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_unit_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureUnitEntity _$TemperatureUnitEntityFromJson(
  Map<String, dynamic> json,
) => TemperatureUnitEntity(
  json['value'] as String,
  $enumDecode(_$TemperatureUnitEnumMap, json['measureUnit']),
);

Map<String, dynamic> _$TemperatureUnitEntityToJson(
  TemperatureUnitEntity instance,
) => <String, dynamic>{
  'measureUnit': _$TemperatureUnitEnumMap[instance.measureUnit]!,
  'value': instance.value,
};

const _$TemperatureUnitEnumMap = {
  TemperatureUnit.CELSIUS: 'CELSIUS',
  TemperatureUnit.FAHRENHEIT: 'FAHRENHEIT',
  TemperatureUnit.KELVIN: 'KELVIN',
};
