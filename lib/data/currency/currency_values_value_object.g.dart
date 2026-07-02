// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_values_value_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyValuesValueObject _$CurrencyValuesValueObjectFromJson(
  Map<String, dynamic> json,
) => CurrencyValuesValueObject(
  (json['unitedKingdomPound'] as num).toDouble(),
  (json['switzerlandFranc'] as num).toDouble(),
  (json['australiaDollar'] as num).toDouble(),
  (json['brazilReal'] as num).toDouble(),
  (json['canadaDollar'] as num).toDouble(),
  (json['newZealandDollar'] as num).toDouble(),
  (json['euro'] as num).toDouble(),
);

Map<String, dynamic> _$CurrencyValuesValueObjectToJson(
  CurrencyValuesValueObject instance,
) => <String, dynamic>{
  'unitedKingdomPound': instance.unitedKingdomPound,
  'switzerlandFranc': instance.switzerlandFranc,
  'australiaDollar': instance.australiaDollar,
  'brazilReal': instance.brazilReal,
  'canadaDollar': instance.canadaDollar,
  'newZealandDollar': instance.newZealandDollar,
  'euro': instance.euro,
};
