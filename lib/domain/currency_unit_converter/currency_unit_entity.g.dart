// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_unit_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyUnitEntity _$CurrencyUnitEntityFromJson(Map<String, dynamic> json) =>
    CurrencyUnitEntity(
      json['value'] as String,
      $enumDecode(_$CurrencyUnitEnumMap, json['measureUnit']),
    );

Map<String, dynamic> _$CurrencyUnitEntityToJson(CurrencyUnitEntity instance) =>
    <String, dynamic>{
      'measureUnit': _$CurrencyUnitEnumMap[instance.measureUnit]!,
      'value': instance.value,
    };

const _$CurrencyUnitEnumMap = {
  CurrencyUnit.UNITED_STATES_DOLLAR: 'UNITED_STATES_DOLLAR',
  CurrencyUnit.UNITED_KINGDOM_POUND: 'UNITED_KINGDOM_POUND',
  CurrencyUnit.SWITZERLAND_FRANC: 'SWITZERLAND_FRANC',
  CurrencyUnit.AUSTRALIA_DOLLAR: 'AUSTRALIA_DOLLAR',
  CurrencyUnit.BRAZIL_REAL: 'BRAZIL_REAL',
  CurrencyUnit.CANADA_DOLLAR: 'CANADA_DOLLAR',
  CurrencyUnit.NEW_ZEALAND_DOLLAR: 'NEW_ZEALAND_DOLLAR',
  CurrencyUnit.EURO: 'EURO',
};
