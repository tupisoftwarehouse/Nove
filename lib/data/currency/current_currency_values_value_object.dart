import "dart:convert";
import "package:json_annotation/json_annotation.dart";
import "package:nove/data/currency/currency_values_value_object.dart";

part "current_currency_values_value_object.g.dart";

@JsonSerializable(explicitToJson: true)
class CurrentCurrencyValuesValueObject {
  final CurrencyValuesValueObject currencyValues;
  final int updatedAt;
  final int updatableAt;

  CurrentCurrencyValuesValueObject(
    this.currencyValues,
    this.updatedAt,
    this.updatableAt,
  );

  factory CurrentCurrencyValuesValueObject.fromMarshalledData(
    String marshalledData,
  ) {
    final unmarshallableData = jsonDecode(marshalledData);

    return _$CurrentCurrencyValuesValueObjectFromJson(unmarshallableData);
  }

  String get marshalledData {
    final marshallableData = _$CurrentCurrencyValuesValueObjectToJson(this);

    return jsonEncode(marshallableData);
  }
}
