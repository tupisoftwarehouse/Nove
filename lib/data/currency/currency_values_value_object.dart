import "package:json_annotation/json_annotation.dart";

part "currency_values_value_object.g.dart";

@JsonSerializable()
class CurrencyValuesValueObject {
  final double unitedKingdomPound;
  final double switzerlandFranc;
  final double australiaDollar;
  final double brazilReal;
  final double canadaDollar;
  final double newZealandDollar;
  final double euro;

  CurrencyValuesValueObject(
    this.unitedKingdomPound,
    this.switzerlandFranc,
    this.australiaDollar,
    this.brazilReal,
    this.canadaDollar,
    this.newZealandDollar,
    this.euro,
  );

  factory CurrencyValuesValueObject.fromJson(Map<String, dynamic> json) {
    return _$CurrencyValuesValueObjectFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CurrencyValuesValueObjectToJson(this);
  }
}
