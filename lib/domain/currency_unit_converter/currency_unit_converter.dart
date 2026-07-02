import "package:nove/data/currency/currency_values_value_object.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";

class CurrencyUnitConverter {
  final MeasureUnitConverter<CurrencyUnit> _measureUnitConverter;
  final CurrencyValuesValueObject _currencyValues;

  CurrencyUnitConverter(this._measureUnitConverter, this._currencyValues) {
    CurrencyValuesMediator.currencyValues = _currencyValues;
  }

  void addCurrencyUnit() {
    _measureUnitConverter.addMeasureUnit();
  }

  void addCurrencyUnitAt(int indexOfCurrencyUnitToBeAdded) {
    _measureUnitConverter.addMeasureUnitAt(indexOfCurrencyUnitToBeAdded);
  }

  void updateBaseCurrencyUnitIndex(int updatedBaseCurrencyUnitElementIndex) {
    _measureUnitConverter.updateBaseMeasureUnitIndex(
      updatedBaseCurrencyUnitElementIndex,
    );
  }

  void updateCurrencyUnitAt(
    CurrencyUnitEntity updatedCurrencyUnit,
    int updatedCurrencyUnitIndex,
  ) {
    _measureUnitConverter.updateMeasureUnitAt(
      updatedCurrencyUnit,
      updatedCurrencyUnitIndex,
    );
  }

  void removeCurrencyUnit(int indexOfCurrencyUnitToBeRemoved) {
    _measureUnitConverter.removeMeasureUnitAt(indexOfCurrencyUnitToBeRemoved);
  }

  void reset() {
    _measureUnitConverter.reset();
  }

  void disposeCurrencyValues() {
    CurrencyValuesMediator.dispose();
  }

  int get baseCurrencyUnitIndex {
    return _measureUnitConverter.baseMeasureUnitIndex;
  }

  set baseCurrencyUnitIndex(int baseCurrencyUnitIndex) {
    _measureUnitConverter.baseMeasureUnitIndex = baseCurrencyUnitIndex;
  }

  List<CurrencyUnitEntity> get listOfCurrencyUnits {
    return _measureUnitConverter.listOfMeasureUnits.cast<CurrencyUnitEntity>();
  }

  set listOfCurrencyUnits(List<CurrencyUnitEntity> listOfCurrencyUnits) {
    _measureUnitConverter.listOfMeasureUnits = listOfCurrencyUnits;
  }
}
