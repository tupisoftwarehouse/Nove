import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/currency_unit_dropdown_menu_description_selector.dart";

void main() {
  group("Test \"CurrencyUnitDropdownMenuDescriptionSelector\" Class", () {
    test(
      "Test If Method \"getCurrencyUnitDropdownMenuDescription\" Returns \"DropdownMenuDescriptionEntity\" Of Corresponding Currency Unit",
      () {
        final unitedStatesDollarInstance =
            CurrencyUnitDropdownMenuDescriptionSelector.getCurrencyUnitDropdownMenuDescription(
              CurrencyUnit.UNITED_STATES_DOLLAR,
              APPLICATION_LANGUAGE,
            );
        final greatBritainPoundInstance =
            CurrencyUnitDropdownMenuDescriptionSelector.getCurrencyUnitDropdownMenuDescription(
              CurrencyUnit.UNITED_KINGDOM_POUND,
              APPLICATION_LANGUAGE,
            );
        final swissFrancInstance =
            CurrencyUnitDropdownMenuDescriptionSelector.getCurrencyUnitDropdownMenuDescription(
              CurrencyUnit.SWITZERLAND_FRANC,
              APPLICATION_LANGUAGE,
            );
        final australianDollarInstance =
            CurrencyUnitDropdownMenuDescriptionSelector.getCurrencyUnitDropdownMenuDescription(
              CurrencyUnit.AUSTRALIA_DOLLAR,
              APPLICATION_LANGUAGE,
            );
        final brazilianRealInstance =
            CurrencyUnitDropdownMenuDescriptionSelector.getCurrencyUnitDropdownMenuDescription(
              CurrencyUnit.BRAZIL_REAL,
              APPLICATION_LANGUAGE,
            );
        final canadianDollarInstance =
            CurrencyUnitDropdownMenuDescriptionSelector.getCurrencyUnitDropdownMenuDescription(
              CurrencyUnit.CANADA_DOLLAR,
              APPLICATION_LANGUAGE,
            );
        final newZealanderDollarInstance =
            CurrencyUnitDropdownMenuDescriptionSelector.getCurrencyUnitDropdownMenuDescription(
              CurrencyUnit.NEW_ZEALAND_DOLLAR,
              APPLICATION_LANGUAGE,
            );
        final euroInstance =
            CurrencyUnitDropdownMenuDescriptionSelector.getCurrencyUnitDropdownMenuDescription(
              CurrencyUnit.EURO,
              APPLICATION_LANGUAGE,
            );

        expect(
          unitedStatesDollarInstance.label,
          APPLICATION_LANGUAGE.UNITED_STATES_DOLLAR_UNIT_LABEL,
        );
        expect(
          unitedStatesDollarInstance.abbreviation,
          APPLICATION_LANGUAGE.UNITED_STATES_DOLLAR_UNIT_ABBREVIATION,
        );
        expect(
          greatBritainPoundInstance.label,
          APPLICATION_LANGUAGE.UNITED_KINGDOM_POUND_UNIT_LABEL,
        );
        expect(
          greatBritainPoundInstance.abbreviation,
          APPLICATION_LANGUAGE.UNITED_KINGDOM_POUND_UNIT_ABBREVIATION,
        );
        expect(
          swissFrancInstance.label,
          APPLICATION_LANGUAGE.SWITZERLAND_FRANC_UNIT_LABEL,
        );
        expect(
          swissFrancInstance.abbreviation,
          APPLICATION_LANGUAGE.SWITZERLAND_FRANC_UNIT_ABBREVIATION,
        );
        expect(
          australianDollarInstance.label,
          APPLICATION_LANGUAGE.AUSTRALIA_DOLLAR_UNIT_LABEL,
        );
        expect(
          australianDollarInstance.abbreviation,
          APPLICATION_LANGUAGE.AUSTRALIA_DOLLAR_UNIT_ABBREVIATION,
        );
        expect(
          brazilianRealInstance.label,
          APPLICATION_LANGUAGE.BRAZIL_REAL_UNIT_LABEL,
        );
        expect(
          brazilianRealInstance.abbreviation,
          APPLICATION_LANGUAGE.BRAZIL_REAL_UNIT_ABBREVIATION,
        );
        expect(
          canadianDollarInstance.label,
          APPLICATION_LANGUAGE.CANADA_DOLLAR_UNIT_LABEL,
        );
        expect(
          canadianDollarInstance.abbreviation,
          APPLICATION_LANGUAGE.CANADA_DOLLAR_UNIT_ABBREVIATION,
        );
        expect(
          newZealanderDollarInstance.label,
          APPLICATION_LANGUAGE.NEW_ZEALAND_DOLLAR_UNIT_LABEL,
        );
        expect(
          newZealanderDollarInstance.abbreviation,
          APPLICATION_LANGUAGE.NEW_ZEALAND_DOLLAR_UNIT_ABBREVIATION,
        );
        expect(euroInstance.label, APPLICATION_LANGUAGE.EURO_UNIT_LABEL);
        expect(
          euroInstance.abbreviation,
          APPLICATION_LANGUAGE.EURO_UNIT_ABBREVIATION,
        );
      },
    );
  });
}
