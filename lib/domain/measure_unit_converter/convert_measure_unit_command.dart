import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class ConvertMeasureUnitCommand {
  ConvertMeasureUnitCommand._();

  static void execute<T>(
    List<MeasureUnitEntity<T>> listOfMeasureUnits,
    MeasureUnitEntity<T> measureUnitToConvertTo,
  ) {
    for (final measureUnitElementToBeConverted in listOfMeasureUnits) {
      measureUnitElementToBeConverted.convertTo(measureUnitToConvertTo);
    }
  }
}
