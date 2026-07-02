import "dart:convert";
import "package:json_annotation/json_annotation.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/internals/transaction_scripts/currency_unit_type_fixing_transaction_script.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

part "currency_unit_entity.g.dart";

@JsonSerializable(explicitToJson: true)
class CurrencyUnitEntity extends MeasureUnitEntity<CurrencyUnit> {
  CurrencyUnitEntity(super.value, super.measureUnit);

  @override
  void convertTo(MeasureUnitEntity<CurrencyUnit> measureUnit) {}

  factory CurrencyUnitEntity.fromMarshalledData(String marshalledData) {
    final unmarshallableData = jsonDecode(marshalledData);
    final instanceFromMarshalledData = _$CurrencyUnitEntityFromJson(
      unmarshallableData,
    );

    return CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
      instanceFromMarshalledData,
    );
  }

  static List<CurrencyUnitEntity> fromMarshalledListData(
    String marshalledListData,
  ) {
    return (jsonDecode(marshalledListData) as List<dynamic>).map((
      marshalledData,
    ) {
      final instanceFromMarshalledData = _$CurrencyUnitEntityFromJson(
        marshalledData,
      );

      return CurrencyUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
        instanceFromMarshalledData,
      );
    }).toList();
  }

  String get marshalledData {
    final marshallableData = _$CurrencyUnitEntityToJson(this);

    return jsonEncode(marshallableData);
  }

  static String marshalledListData(
    List<CurrencyUnitEntity> listOfCurrencyUnits,
  ) {
    final listOfMarshallableData = listOfCurrencyUnits.map((item) {
      return _$CurrencyUnitEntityToJson(item);
    }).toList();

    return jsonEncode(listOfMarshallableData);
  }
}
