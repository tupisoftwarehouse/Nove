// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_currency_values_value_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentCurrencyValuesValueObject _$CurrentCurrencyValuesValueObjectFromJson(
  Map<String, dynamic> json,
) => CurrentCurrencyValuesValueObject(
  CurrencyValuesValueObject.fromJson(
    json['currencyValues'] as Map<String, dynamic>,
  ),
  (json['updatedAt'] as num).toInt(),
  (json['updatableAt'] as num).toInt(),
);

Map<String, dynamic> _$CurrentCurrencyValuesValueObjectToJson(
  CurrentCurrencyValuesValueObject instance,
) => <String, dynamic>{
  'currencyValues': instance.currencyValues.toJson(),
  'updatedAt': instance.updatedAt,
  'updatableAt': instance.updatableAt,
};
