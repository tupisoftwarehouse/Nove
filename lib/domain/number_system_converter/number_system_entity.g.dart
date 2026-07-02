// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_system_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberSystemEntity _$NumberSystemEntityFromJson(Map<String, dynamic> json) =>
    NumberSystemEntity(
      json['value'] as String,
      $enumDecode(_$NumberSystemEnumMap, json['measureUnit']),
    );

Map<String, dynamic> _$NumberSystemEntityToJson(NumberSystemEntity instance) =>
    <String, dynamic>{
      'measureUnit': _$NumberSystemEnumMap[instance.measureUnit]!,
      'value': instance.value,
    };

const _$NumberSystemEnumMap = {
  NumberSystem.BINARY: 'BINARY',
  NumberSystem.OCTAL: 'OCTAL',
  NumberSystem.DECIMAL: 'DECIMAL',
  NumberSystem.HEXADECIMAL: 'HEXADECIMAL',
};
