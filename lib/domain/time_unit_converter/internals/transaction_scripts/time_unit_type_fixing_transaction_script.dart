import "package:nove/domain/time_unit_converter/time_unit_entity.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/year_unit_entity.dart";
import "package:nove/domain/time_unit_converter/week_unit_entity.dart";
import "package:nove/domain/time_unit_converter/day_unit_entity.dart";
import "package:nove/domain/time_unit_converter/hour_unit_entity.dart";
import "package:nove/domain/time_unit_converter/minute_unit_entity.dart";
import "package:nove/domain/time_unit_converter/second_unit_entity.dart";
import "package:nove/domain/time_unit_converter/millisecond_unit_entity.dart";

class TimeUnitTypeFixingTransactionScript {
  TimeUnitTypeFixingTransactionScript._();

  static TimeUnitEntity getTypeFixedInstanceFromMarshalledData(
    TimeUnitEntity instanceFromMarshalledData,
  ) {
    late final TimeUnitEntity typeFixedInstance;

    switch (instanceFromMarshalledData.measureUnit) {
      case TimeUnit.YEAR:
        typeFixedInstance = YearUnitEntity(instanceFromMarshalledData.value);

        break;
      case TimeUnit.WEEK:
        typeFixedInstance = WeekUnitEntity(instanceFromMarshalledData.value);

        break;
      case TimeUnit.DAY:
        typeFixedInstance = DayUnitEntity(instanceFromMarshalledData.value);

        break;
      case TimeUnit.HOUR:
        typeFixedInstance = HourUnitEntity(instanceFromMarshalledData.value);

        break;
      case TimeUnit.MINUTE:
        typeFixedInstance = MinuteUnitEntity(instanceFromMarshalledData.value);

        break;
      case TimeUnit.SECOND:
        typeFixedInstance = SecondUnitEntity(instanceFromMarshalledData.value);

        break;
      case TimeUnit.MILLISECOND:
        typeFixedInstance = MillisecondUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
    }

    return typeFixedInstance;
  }
}
