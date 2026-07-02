import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/length_unit_converter_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/length_unit_converter_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"LengthUnitConverterDataSynchronizingTransactionScript\" Class", () {
    late LengthUnitConverter lengthUnitConverter;
    late MeasureUnitConverter<LengthUnit> measureUnitConverter;
    late AbstractKeyValueDatabase keyValueDatabase;
    late ValueNotifier<List<LengthUnitEntity>> listOfLengthUnitsState;
    late ValueNotifier<int> baseLengthUnitIndexState;

    setUpAll(() {
      keyValueDatabase = KeyValueDatabaseMock();

      measureUnitConverter = MeasureUnitConverter<LengthUnit>(
        ZEROED_LENGTH_UNIT,
        [LENGTH_UNIT_TO_CONVERT_TO((_) {})],
        0,
      );

      lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

      listOfLengthUnitsState = ValueNotifier([]);
      baseLengthUnitIndexState = ValueNotifier(-1);
    });

    test(
      "Test If Method \"synchronizeListOfLengthUnitsAndBaseLengthUnitIndex\" Stores List And Base Index And Updates State",
      () {
        LengthUnitConverterDataSynchronizingTransactionScript.synchronizeListOfLengthUnitsAndBaseLengthUnitIndex(
          lengthUnitConverter,
          keyValueDatabase,
          listOfLengthUnitsState,
          baseLengthUnitIndexState,
        );

        final listOfLengthUnitsFromKeyValueDatabase =
            LengthUnitConverterDataStore.getListOfLengthUnits(keyValueDatabase);

        final baseLengthUnitIndexFromKeyValueDatabase =
            LengthUnitConverterDataStore.getBaseLengthUnitIndex(
              keyValueDatabase,
            );

        expect(listOfLengthUnitsState.value.length, 1);
        expect(listOfLengthUnitsFromKeyValueDatabase.length, 1);

        expect(baseLengthUnitIndexState.value, 0);
        expect(baseLengthUnitIndexFromKeyValueDatabase, 0);

        expect(
          listOfLengthUnitsState.value[0].measureUnit,
          listOfLengthUnitsFromKeyValueDatabase[0].measureUnit,
        );
      },
    );
  });
}
