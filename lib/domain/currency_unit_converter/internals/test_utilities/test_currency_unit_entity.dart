import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";

class TestCurrencyUnitEntity extends CurrencyUnitEntity {
  final void Function(dynamic measureUnit) convertToImplementation;

  TestCurrencyUnitEntity(
    super.value,
    super.measureUnit,
    this.convertToImplementation,
  );

  @override
  void convertTo(dynamic measureUnit) {
    convertToImplementation(measureUnit);
  }
}
