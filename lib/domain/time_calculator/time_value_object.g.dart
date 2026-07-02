// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_value_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeValueObject _$TimeValueObjectFromJson(Map<String, dynamic> json) =>
    TimeValueObject(
      (json['hours'] as num).toInt(),
      (json['minutes'] as num).toInt(),
      (json['seconds'] as num).toInt(),
    );

Map<String, dynamic> _$TimeValueObjectToJson(TimeValueObject instance) =>
    <String, dynamic>{
      'hours': instance.hours,
      'minutes': instance.minutes,
      'seconds': instance.seconds,
    };
