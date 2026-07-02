// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_information_value_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextInformationValueObject _$TextInformationValueObjectFromJson(
  Map<String, dynamic> json,
) => TextInformationValueObject(
  (json['amountOfWords'] as num).toInt(),
  (json['length'] as num).toInt(),
);

Map<String, dynamic> _$TextInformationValueObjectToJson(
  TextInformationValueObject instance,
) => <String, dynamic>{
  'amountOfWords': instance.amountOfWords,
  'length': instance.length,
};
