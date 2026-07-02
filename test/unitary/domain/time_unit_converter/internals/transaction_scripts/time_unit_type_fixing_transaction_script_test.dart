import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/time_unit_converter/year_unit_entity.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";
import "package:nove/domain/time_unit_converter/week_unit_entity.dart";
import "package:nove/domain/time_unit_converter/day_unit_entity.dart";
import "package:nove/domain/time_unit_converter/hour_unit_entity.dart";
import "package:nove/domain/time_unit_converter/minute_unit_entity.dart";
import "package:nove/domain/time_unit_converter/second_unit_entity.dart";
import "package:nove/domain/time_unit_converter/millisecond_unit_entity.dart";
import "package:nove/domain/time_unit_converter/internals/transaction_scripts/time_unit_type_fixing_transaction_script.dart";

void main() {
  group("Test \"TimeUnitTypeFixingTransactionScript\" Class", () {
    test(
      "Test If Method \"getTypeFixedInstanceFromMarshalledData\" Returns A Type Fixed Instance Of Instance From Marshalled Data",
      () {
        final yearUnitInstanceFromMarshalledData = TimeUnitEntity(
          ZEROED_TIME_UNIT_VALUE,
          TimeUnit.YEAR,
        );
        final weekUnitInstanceFromMarshalledData = TimeUnitEntity(
          ZEROED_TIME_UNIT_VALUE,
          TimeUnit.WEEK,
        );
        final dayUnitInstanceFromMarshalledData = TimeUnitEntity(
          ZEROED_TIME_UNIT_VALUE,
          TimeUnit.DAY,
        );
        final hourUnitInstanceFromMarshalledData = TimeUnitEntity(
          ZEROED_TIME_UNIT_VALUE,
          TimeUnit.HOUR,
        );
        final minuteUnitInstanceFromMarshalledData = TimeUnitEntity(
          ZEROED_TIME_UNIT_VALUE,
          TimeUnit.MINUTE,
        );
        final secondUnitInstanceFromMarshalledData = TimeUnitEntity(
          ZEROED_TIME_UNIT_VALUE,
          TimeUnit.SECOND,
        );
        final millisecondUnitInstanceFromMarshalledData = TimeUnitEntity(
          ZEROED_TIME_UNIT_VALUE,
          TimeUnit.MILLISECOND,
        );
        final yearUnitFixedInstance =
            TimeUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              yearUnitInstanceFromMarshalledData,
            );
        final weekUnitFixedInstance =
            TimeUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              weekUnitInstanceFromMarshalledData,
            );
        final dayUnitFixedInstance =
            TimeUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              dayUnitInstanceFromMarshalledData,
            );
        final hourUnitFixedInstance =
            TimeUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              hourUnitInstanceFromMarshalledData,
            );
        final minuteUnitFixedInstance =
            TimeUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              minuteUnitInstanceFromMarshalledData,
            );
        final secondUnitFixedInstance =
            TimeUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              secondUnitInstanceFromMarshalledData,
            );
        final millisecondUnitFixedInstance =
            TimeUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              millisecondUnitInstanceFromMarshalledData,
            );

        expect(yearUnitFixedInstance, isA<YearUnitEntity>());
        expect(weekUnitFixedInstance, isA<WeekUnitEntity>());
        expect(dayUnitFixedInstance, isA<DayUnitEntity>());
        expect(hourUnitFixedInstance, isA<HourUnitEntity>());
        expect(minuteUnitFixedInstance, isA<MinuteUnitEntity>());
        expect(secondUnitFixedInstance, isA<SecondUnitEntity>());
        expect(millisecondUnitFixedInstance, isA<MillisecondUnitEntity>());
      },
    );
  });
}
