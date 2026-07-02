import "package:flutter/widgets.dart" as widget;
import "package:flutter_test/flutter_test.dart" hide isNull;
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/constants/domains/measure_unit_converter_constants.dart"
    hide NOT_ROUND_VALUE, ROUND_VALUE;
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";

void main() {
  group("Test \"UserInterfaceSpecifications\" Module", () {
    test(
      "Test If Function \"isCurrencyValuesUpdatable\" Returns True If Currency Values Are Updatable",
      () {
        final currencyValuesIsUpdatable = isCurrencyValuesUpdatable(
          CURRENT_CURRENCY_VALUES.updatableAt + 1,
          CURRENT_CURRENCY_VALUES.updatableAt,
        );
        final currencyValuesIsNotUpdatable = isCurrencyValuesUpdatable(
          CURRENT_CURRENCY_VALUES.updatableAt,
          CURRENT_CURRENCY_VALUES.updatableAt,
        );

        expect(currencyValuesIsUpdatable, true);
        expect(currencyValuesIsNotUpdatable, false);
      },
    );

    test(
      "Test If Function \"isCurrencyValuesNotUpToDate\" Returns True If Currency Values Are Not Up To Date",
      () {
        final currencyIsNotValuesUpToDate = isCurrencyValuesNotUpToDate(
          CURRENCY_VALUES,
          OUTDATED_CURRENCY_VALUES,
        );
        final currencyIsValuesUpToDate = isCurrencyValuesNotUpToDate(
          CURRENCY_VALUES,
          CURRENCY_VALUES,
        );

        expect(currencyIsNotValuesUpToDate, true);
        expect(currencyIsValuesUpToDate, false);
      },
    );

    test(
      "Test If Function \"isViewfinderSmall\" Returns True If Viewfinder Height Is Small",
      () {
        final screenHeightIsSmall = isViewfinderSmall(SMALL_VIEWFINDER_HEIGHT);
        final screenHeightIsNotSmall = isViewfinderSmall(
          SMALL_VIEWFINDER_HEIGHT + 1,
        );

        expect(screenHeightIsSmall, true);
        expect(screenHeightIsNotSmall, false);
      },
    );

    test(
      "Test If Function \"isItemTheLast\" Returns True If Item Index Is The Last Of The List",
      () {
        final itemIsTheLast = isItemTheLast(
          LAST_ITEM_INDEX,
          LIST_OF_ITEM_LENGTH,
        );
        final itemIsNotTheLast = isItemTheLast(
          NOT_LAST_ITEM_INDEX,
          LIST_OF_ITEM_LENGTH,
        );

        expect(itemIsTheLast, true);
        expect(itemIsNotTheLast, false);
      },
    );

    test(
      "Test If Function \"isTimeHourNumberOverflowing\" Returns True If Time Hour Number Is Overflowing The Threshold",
      () {
        final timeHourNumberIsOverflowing = isTimeHourNumberOverflowing(
          TIME_HOUR_NUMBER_LENGTH + 1,
        );
        final timeHourNumberIsNotOverflowing = isTimeHourNumberOverflowing(
          TIME_HOUR_NUMBER_LENGTH,
        );

        expect(timeHourNumberIsOverflowing, true);
        expect(timeHourNumberIsNotOverflowing, false);
      },
    );

    test(
      "Test If Function \"isTimeCycleNumberOverflowing\" Returns True If Time Cycle Number Is Overflowing The Threshold",
      () {
        final timeCycleNumberIsOverflowing = isTimeCycleNumberOverflowing(
          TIME_CYCLE_NUMBER_LENGTH + 1,
        );
        final timeCycleNumberIsNotOverflowing = isTimeCycleNumberOverflowing(
          TIME_CYCLE_NUMBER_LENGTH,
        );

        expect(timeCycleNumberIsOverflowing, true);
        expect(timeCycleNumberIsNotOverflowing, false);
      },
    );

    test(
      "Test If Function \"isTimeCycleNotHigherThanThreshold\" Returns True If Time Cycle Number Is Higher Than The Threshold",
      () {
        final timeCycleNumberIsHeightThanThreshold =
            isTimeCycleHigherThanThreshold(TIME_CYCLE_HIGHEST_NUMBER + 1);
        final timeCycleNumberIsNotHigherThanThreshold =
            isTimeCycleHigherThanThreshold(TIME_CYCLE_HIGHEST_NUMBER);

        expect(timeCycleNumberIsHeightThanThreshold, true);
        expect(timeCycleNumberIsNotHigherThanThreshold, false);
      },
    );

    test(
      "Test If Function \"isControllerFirst\" Returns True If Controller Index Is Not The First Of List",
      () {
        final controllerIsNotFirst = isControllerNotTheFirst(1);
        final controllerIsFirst = isControllerNotTheFirst(0);

        expect(controllerIsNotFirst, true);
        expect(controllerIsFirst, false);
      },
    );

    test(
      "Test If Function \"isControllerNotTheLast\" Returns True If Controller Index Is Not The Last Of List",
      () {
        final controllerIsNotLast = isControllerNotTheLast(0, 2);
        final controllerIsLast = isControllerNotTheLast(0, 1);

        expect(controllerIsNotLast, true);
        expect(controllerIsLast, false);
      },
    );

    test(
      "Test If Function \"isListOfTimesResized\" Returns True If List Of Times Is Resized",
      () {
        final listOfTimesIsResized = isListOfTimesResized(
          LENGTH_OF_SYNCHRONIZED_LIST_OF_TIMES,
          LENGTH_OF_SYNCHRONIZED_LIST_OF_TIME_INPUT_CONTROLLER_HOLDERS - 1,
        );
        final listOfTimesIsNotResized = isListOfTimesResized(
          LENGTH_OF_SYNCHRONIZED_LIST_OF_TIMES,
          LENGTH_OF_SYNCHRONIZED_LIST_OF_TIME_INPUT_CONTROLLER_HOLDERS,
        );

        expect(listOfTimesIsResized, true);
        expect(listOfTimesIsNotResized, false);
      },
    );

    test(
      "Test If Function \"isAggregatedTimeHourNumberOverflowing\" Returns True If Aggregated Time Hour Number Is Overflowing The Threshold",
      () {
        final aggregatedTimeHourNumberIsOverflowing =
            isAggregatedTimeHourNumberOverflowing(
              AGGREGATOR_TIME_HOUR_NUMBER_LENGTH + 1,
            );
        final aggregatedTimeHourNumberIsNotOverflowing =
            isAggregatedTimeHourNumberOverflowing(
              AGGREGATOR_TIME_HOUR_NUMBER_LENGTH,
            );

        expect(aggregatedTimeHourNumberIsOverflowing, true);
        expect(aggregatedTimeHourNumberIsNotOverflowing, false);
      },
    );

    test(
      "Test If Function \"isExpressionSnapshotUpdated\" Returns True If Expression Snapshot Is Updated",
      () {
        final expressionSnapshotIsUpdated = isExpressionSnapshotUpdated(
          EMPTY_EXPRESSION_SNAPSHOT,
          EXPRESSION_SNAPSHOT,
        );
        final expressionSnapshotIsNotUpdated = isExpressionSnapshotUpdated(
          EXPRESSION_SNAPSHOT,
          EXPRESSION_SNAPSHOT,
        );

        expect(expressionSnapshotIsUpdated, true);
        expect(expressionSnapshotIsNotUpdated, false);
      },
    );

    test(
      "Test If Function \"isItemSelected\" Returns True If Item Index Is Selected",
      () {
        final itemIsSelected = isItemSelected(0, 0);
        final itemIsNotSelected = isItemSelected(0, 1);

        expect(itemIsSelected, true);
        expect(itemIsNotSelected, false);
      },
    );

    test(
      "Test If Function \"isMeasureUnitInputNotTheBase\" Returns True If Measure Unit Input Index Is Not The Base Measure Unit Input Index",
      () {
        final areaInputIsNotTheBase = isMeasureUnitInputNotTheBase(0, 1);
        final areaInputIsTheBase = isMeasureUnitInputNotTheBase(0, 0);

        expect(areaInputIsNotTheBase, true);
        expect(areaInputIsTheBase, false);
      },
    );

    test(
      "Test If Function \"isItemTheBaseMeasureUnit\" Returns True If Item Is The Base Measure Unit Index",
      () {
        final itemIsTheBase = isItemTheBaseMeasureUnit(0, 0);
        final itemIsNotTheBase = isItemTheBaseMeasureUnit(0, 1);

        expect(itemIsTheBase, true);
        expect(itemIsNotTheBase, false);
      },
    );

    test(
      "Test If Function \"isListOfMeasureUnitsResized\" Returns True If List Of Measure Units Is Resized",
      () {
        final listOfMeasureUnitsIsResized = isListOfMeasureUnitsResized(
          LENGTH_OF_SYNCHRONIZED_LIST_OF_MEASURE_UNITS,
          LENGTH_OF_SYNCHRONIZED_LIST_OF_MEASURE_UNITS_INPUT_CONTROLLER_HOLDERS -
              1,
        );
        final listOfMeasureUnitsIsNotResized = isListOfMeasureUnitsResized(
          LENGTH_OF_SYNCHRONIZED_LIST_OF_MEASURE_UNITS,
          LENGTH_OF_SYNCHRONIZED_LIST_OF_MEASURE_UNITS_INPUT_CONTROLLER_HOLDERS,
        );

        expect(listOfMeasureUnitsIsResized, true);
        expect(listOfMeasureUnitsIsNotResized, false);
      },
    );

    test(
      "Test If Function \"isCharacterNotAllowed\" Returns True If Character Is Not Allowed",
      () {
        final characterIsNotAllowed = isCharacterNotAllowed(
          ANY_NON_NUMERICAL_OTHER_VALUE_POINT_CHARACTER,
        );
        final characterIsAllowed = isCharacterNotAllowed(POINT_CHARACTER);

        expect(characterIsNotAllowed, true);
        expect(characterIsAllowed, false);
      },
    );

    test(
      "Test If Function \"isApplicationResumed\" Returns True If Application Is Resumed",
      () {
        final applicationIsResumed = isApplicationResumed(
          widget.AppLifecycleState.resumed,
        );
        final applicationIsNotResumed = isApplicationResumed(
          widget.AppLifecycleState.paused,
        );

        expect(applicationIsResumed, true);
        expect(applicationIsNotResumed, false);
      },
    );

    test("Test If Function \"isNull\" Returns True If Item Is Null", () {
      final itemIsNull = isNull(null);
      final itemIsNotNull = isNull(NOT_ROUND_VALUE);

      expect(itemIsNull, true);
      expect(itemIsNotNull, false);
    });

    test(
      "Test If Function \"isKeyboardScientific\" Returns True In Portrait With Sufficient Height",
      () {
        final keyboardIsScientific = isKeyboardScientific(
          widget.Orientation.portrait,
          SCIENTIFIC_KEYBOARD_MINIMAL_HEIGHT + 1,
        );
        final keyboardIsNotScientific = isKeyboardScientific(
          widget.Orientation.landscape,
          SCIENTIFIC_KEYBOARD_MINIMAL_HEIGHT,
        );

        expect(keyboardIsScientific, true);
        expect(keyboardIsNotScientific, false);
      },
    );

    test(
      "Test If Function \"isKeyboardHorizontal\" Returns True In Landscape With Sufficient Width",
      () {
        final keyboardIsHorizontal = isKeyboardHorizontal(
          widget.Orientation.landscape,
          HORIZONTAL_KEYBOARD_MINIMAL_WIDTH + 1,
        );
        final keyboardIsNotHorizontal = isKeyboardHorizontal(
          widget.Orientation.portrait,
          HORIZONTAL_KEYBOARD_MINIMAL_WIDTH,
        );

        expect(keyboardIsHorizontal, true);
        expect(keyboardIsNotHorizontal, false);
      },
    );

    test(
      "Test If Function \"isViewfinderExpressionHistoryShown\" Returns True Or False Correctly",
      () {
        final viewfinderExpressionHistoryIsShown =
            isViewfinderExpressionHistoryShown(
              LARGER_SCREEN_VIEWFINDER_HISTORY_CONTAINER_MINIMAL_HEIGHT_THRESHOLD +
                  1,
              SMALL_VIEWFINDER_HEIGHT + 1,
            );
        final viewfinderExpressionHistoryIsNotShown =
            isViewfinderExpressionHistoryShown(
              SMALL_SCREEN_VIEWFINDER_HISTORY_CONTAINER_MINIMAL_HEIGHT_THRESHOLD,
              SMALL_VIEWFINDER_HEIGHT,
            );

        expect(viewfinderExpressionHistoryIsShown, true);
        expect(viewfinderExpressionHistoryIsNotShown, false);
      },
    );

    test(
      "Test If Function \"isUtilityBannerDeckLarge\" Returns True If Screen Width Is Large",
      () {
        final utilityBannerDeckIsLarge = isUtilityBannerDeckLarge(
          LARGE_SCREEN_UTILITY_BANNER_DECK_MINIMAL_WIDTH + 1,
        );
        final utilityBannerDeckIsNotLarge = isUtilityBannerDeckLarge(
          LARGE_SCREEN_UTILITY_BANNER_DECK_MINIMAL_WIDTH,
        );

        expect(utilityBannerDeckIsLarge, true);
        expect(utilityBannerDeckIsNotLarge, false);
      },
    );

    test(
      "Test If Function \"isUtilityBannerDeckMedium\" Returns True If Screen Width Is Medium",
      () {
        final utilityBannerDeckIsMedium = isUtilityBannerDeckMedium(
          MEDIUM_SCREEN_UTILITY_BANNER_DECK_MINIMAL_WIDTH + 1,
        );
        final utilityBannerDeckIsNotMedium = isUtilityBannerDeckMedium(
          MEDIUM_SCREEN_UTILITY_BANNER_DECK_MINIMAL_WIDTH,
        );

        expect(utilityBannerDeckIsMedium, true);
        expect(utilityBannerDeckIsNotMedium, false);
      },
    );

    test(
      "Test If Function \"isCalculatorScreenSmall\" Returns True If Calculator Screen Height Is Small",
      () {
        final calculatorScreenHeightIsSmall = isCalculatorScreenSmall(
          CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
        );
        final calculatorScreenHeightIsNotSmall = isCalculatorScreenSmall(
          CALCULATOR_SCREEN_MINIMAL_HEIGHT,
        );

        expect(calculatorScreenHeightIsSmall, true);
        expect(calculatorScreenHeightIsNotSmall, false);
      },
    );

    test(
      "Test If Function \"isNumberSystemHexadecimal\" Returns True If Number System Is Hexadecimal",
      () {
        final numberSystemIsHexadecimal = isNumberSystemHexadecimal(
          NumberSystem.HEXADECIMAL,
        );
        final numberSystemIsNotHexadecimal = isNumberSystemHexadecimal(
          NumberSystem.BINARY,
        );

        expect(numberSystemIsHexadecimal, true);
        expect(numberSystemIsNotHexadecimal, false);
      },
    );

    test(
      "Test If Function \"isCursorAtTheEndOfExpression\" Returns True If Cursor Is At The End Of Expression",
      () {
        final cursorIsAtTheEndOfExpression = isCursorAtTheEndOfExpression(
          EXPRESSION_TO_BE_EVALUATED.length,
          EXPRESSION_TO_BE_EVALUATED,
        );
        final cursorIsNotAtTheEndOfExpression = isCursorAtTheEndOfExpression(
          0,
          EXPRESSION_TO_BE_EVALUATED,
        );

        expect(cursorIsAtTheEndOfExpression, true);
        expect(cursorIsNotAtTheEndOfExpression, false);
      },
    );

    test(
      "Test If Function \"isCalculatorPageSelected\" Returns True If Calculator Page Index Is Selected",
      () {
        final calculatorPageIsSelected = isCalculatorPageSelected(0);
        final calculatorPageIsNotSelected = isCalculatorPageSelected(1);

        expect(calculatorPageIsSelected, true);
        expect(calculatorPageIsNotSelected, false);
      },
    );

    test(
      "Test If Function \"isViewfinderExpressionHistoryNotAbleToBeShown\" Returns True If Viewfinder Expression History Not Able To Be Shown",
      () {
        final viewfinderExpressionHistoryIsNotAbleToBeShown =
            isViewfinderExpressionHistoryNotAbleToBeShown(
              NOT_ABLE_TO_BE_SHOWN_VIEWFINDER_SCREEN_HEIGHT - 1,
              NOT_ABLE_TO_BE_SHOWN_VIEWFINDER_SCREEN_WIDTH - 1,
            );
        final viewfinderExpressionHistoryIsAbleToBeShown =
            isViewfinderExpressionHistoryNotAbleToBeShown(
              NOT_ABLE_TO_BE_SHOWN_VIEWFINDER_SCREEN_HEIGHT,
              NOT_ABLE_TO_BE_SHOWN_VIEWFINDER_SCREEN_WIDTH,
            );

        expect(viewfinderExpressionHistoryIsNotAbleToBeShown, true);
        expect(viewfinderExpressionHistoryIsAbleToBeShown, false);
      },
    );

    test(
      "Test If Function \"isConverterUnchanged\" Returns True If Converter Is Unchanged",
      () {
        final converterIsUnchanged = isConverterUnchanged([
          ZEROED_MEASURE_UNIT(),
        ]);
        final converterIsNotUnchanged = isConverterUnchanged([
          MEASURE_UNIT_TO_BE_CONVERTED((_) {}),
          MEASURE_UNIT_TO_BE_CONVERTED((_) {}),
        ]);

        expect(converterIsUnchanged, true);
        expect(converterIsNotUnchanged, false);
      },
    );

    test(
      "Test If Function \"isTimeAggregatorUnchanged\" Returns True If Time Aggregator Is Unchanged",
      () {
        final timeAggregatorIsUnchanged = isTimeAggregatorUnchanged([
          ZEROED_TIME,
        ]);
        final timeAggregatorIsNotUnchanged = isTimeAggregatorUnchanged([
          TIME_TO_BE_CALCULATED,
        ]);

        expect(timeAggregatorIsUnchanged, true);
        expect(timeAggregatorIsNotUnchanged, false);
      },
    );

    test(
      "Test If Function \"isBodyMassIndexCalculatorUnchanged\" Returns True If Body Mass Index Calculator Is Unchanged",
      () {
        final bodyMassIndexCalculatorIsUnchanged =
            isBodyMassIndexCalculatorUnchanged(
              ZEROED_BODY_MASS_INDEX_CALCULATION_CANDIDATE,
            );
        final bodyMassIndexCalculatorIsNotUnchanged =
            isBodyMassIndexCalculatorUnchanged(
              BODY_MASS_INDEX_CALCULATION_CANDIDATE,
            );

        expect(bodyMassIndexCalculatorIsUnchanged, true);
        expect(bodyMassIndexCalculatorIsNotUnchanged, false);
      },
    );

    test(
      "Test If Function \"isTimeCalculatorUnchanged\" Returns True If Time Calculator Is Unchanged",
      () {
        final timeCalculatorIsUnchanged = isTimeCalculatorUnchanged(
          ZEROED_TIME,
          ZEROED_TIME,
        );
        final timeCalculatorIsNotUnchanged = isTimeCalculatorUnchanged(
          TIME_TO_BE_CALCULATED,
          TIME_TO_BE_CALCULATED,
        );

        expect(timeCalculatorIsUnchanged, true);
        expect(timeCalculatorIsNotUnchanged, false);
      },
    );

    test(
      "Test If Function \"isKeyboardCharacterSmall\" Returns True If Keyboard Character Is Small",
      () {
        final keyboardCharacterIsSmall = isKeyboardCharacterSmall(
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT - 1,
        );
        final keyboardCharacterIsNotSmall = isKeyboardCharacterSmall(
          SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT,
        );

        expect(keyboardCharacterIsSmall, true);
        expect(keyboardCharacterIsNotSmall, false);
      },
    );

    test(
      "Test If Function \"isExpressionInputChanged\" Returns True If Expression Input Is Changed",
      () {
        final expressionInputIsChanged = isExpressionInputChanged(
          EXPRESSION_TO_BE_EVALUATED,
          "",
        );
        final expressionInputIsNotChanged = isExpressionInputChanged(
          EXPRESSION_TO_BE_EVALUATED,
          EXPRESSION_TO_BE_EVALUATED,
        );

        expect(expressionInputIsChanged, true);
        expect(expressionInputIsNotChanged, false);
      },
    );

    test(
      "Test If Function \"isOrientationHorizontal\" Returns True If Orientation Is Horizontal",
      () {
        final orientationIsHorizontal = isOrientationHorizontal(
          Orientation.HORIZONTAL,
        );
        final orientationIsNotHorizontal = isOrientationHorizontal(
          Orientation.VERTICAL,
        );

        expect(orientationIsHorizontal, true);
        expect(orientationIsNotHorizontal, false);
      },
    );

    test(
      "Test If Function \"isCursorAtTheStartOfExpression\" Returns True If Cursor Is At The Start Of Expression",
      () {
        final cursorIsAtTheStartOfExpression = isCursorAtTheStartOfExpression(
          0,
        );
        final cursorIsNotAtTheStartOfExpression =
            isCursorAtTheStartOfExpression(1);

        expect(cursorIsAtTheStartOfExpression, true);
        expect(cursorIsNotAtTheStartOfExpression, false);
      },
    );

    test(
      "Test If Function \"isCursorAtTheStartOfExpression\" Returns True If Cursor Is At The Start Of Expression",
      () {
        final cursorIsAtTheStartOfExpression = isCursorAtTheStartOfExpression(
          0,
        );
        final cursorIsNotAtTheStartOfExpression =
            isCursorAtTheStartOfExpression(1);

        expect(cursorIsAtTheStartOfExpression, true);
        expect(cursorIsNotAtTheStartOfExpression, false);
      },
    );

    test(
      "Test If Function \"isExpressionInputCursorAtTheEndOfExpression\" Returns True If Expression Input Cursor Is At The End Of Expression",
      () {
        final expressionInputCursorIsAtTheEndOfExpression =
            isExpressionInputCursorAtTheEndOfExpression(
              EXPRESSION_TO_BE_EVALUATED.length - 1,
              EXPRESSION_TO_BE_EVALUATED,
            );
        final expressionInputCursorIsNotAtTheEndOfExpression =
            isExpressionInputCursorAtTheEndOfExpression(
              0,
              EXPRESSION_TO_BE_EVALUATED,
            );

        expect(expressionInputCursorIsAtTheEndOfExpression, true);
        expect(expressionInputCursorIsNotAtTheEndOfExpression, false);
      },
    );

    test(
      "Test If Function \"isCursorExpressionInputOverflowingExpressionSnapshotExpression\" Returns True If Cursor Is Expression Input Overflowing Expression Snapshot Expression",
      () {
        final cursorExpressionInputIsOverflowingExpressionSnapshotExpression =
            isCursorExpressionInputOverflowingExpressionSnapshotExpression(
              EXPRESSION_TO_BE_EVALUATED.length + 1,
              EXPRESSION_TO_BE_EVALUATED,
            );
        final cursorExpressionInputIsNotOverflowingExpressionSnapshotExpression =
            isCursorExpressionInputOverflowingExpressionSnapshotExpression(
              EXPRESSION_TO_BE_EVALUATED.length,
              EXPRESSION_TO_BE_EVALUATED,
            );

        expect(
          cursorExpressionInputIsOverflowingExpressionSnapshotExpression,
          true,
        );
        expect(
          cursorExpressionInputIsNotOverflowingExpressionSnapshotExpression,
          false,
        );
      },
    );

    test(
      "Test If Function \"isApplicationWindowWidthSmall\" Returns True If Application Window Width Is Small",
      () {
        final applicationWindowWidthIsSmall = isApplicationWindowWidthSmall(
          CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
        );
        final applicationWindowWidthIsNotSmall = isApplicationWindowWidthSmall(
          CALCULATOR_SCREEN_MINIMAL_HEIGHT,
        );

        expect(applicationWindowWidthIsSmall, true);
        expect(applicationWindowWidthIsNotSmall, false);
      },
    );

    test(
      "Test If Function \"isApplicationWindowHeightSmall\" Returns True If Application Window Height Is Small",
      () {
        final applicationWindowHeightIsSmall = isApplicationWindowHeightSmall(
          CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
        );
        final applicationWindowHeightIsNotSmall =
            isApplicationWindowHeightSmall(CALCULATOR_SCREEN_MINIMAL_HEIGHT);

        expect(applicationWindowHeightIsSmall, true);
        expect(applicationWindowHeightIsNotSmall, false);
      },
    );

    test(
      "Test If Function \"isApplicationWindowPortrait\" Returns True If Application Window Orientation Is Portrait",
      () {
        final applicationWindowIsPortrait = isApplicationWindowPortrait(
          CURRENT_APPLICATION_WINDOW_LARGER_SIDE,
          CURRENT_APPLICATION_WINDOW_SMALLER_SIDE,
        );
        final applicationWindowIsNotPortrait = isApplicationWindowPortrait(
          CURRENT_APPLICATION_WINDOW_SMALLER_SIDE,
          CURRENT_APPLICATION_WINDOW_LARGER_SIDE,
        );

        expect(applicationWindowIsPortrait, true);
        expect(applicationWindowIsNotPortrait, false);
      },
    );

    test(
      "Test If Function \"isApplicationWindowLandscape\" Returns True If Application Window Orientation Is Landscape",
      () {
        final applicationWindowIsLandscape = isApplicationWindowLandscape(
          widget.Orientation.landscape,
        );
        final applicationWindowIsNotLandscape = isApplicationWindowLandscape(
          widget.Orientation.portrait,
        );

        expect(applicationWindowIsLandscape, true);
        expect(applicationWindowIsNotLandscape, false);
      },
    );

    test(
      "Test If Function \"isApplicationWindowWidthNotChanged\" Returns True If Application Window Width Is Not Changed",
      () {
        final applicationWindowWidthIsNotChanged =
            isApplicationWindowWidthNotChanged(
              CALCULATOR_SCREEN_MINIMAL_HEIGHT,
              CALCULATOR_SCREEN_MINIMAL_HEIGHT,
            );
        final applicationWindowWidthIsChanged =
            isApplicationWindowWidthNotChanged(
              CALCULATOR_SCREEN_MINIMAL_HEIGHT,
              CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
            );

        expect(applicationWindowWidthIsNotChanged, true);
        expect(applicationWindowWidthIsChanged, false);
      },
    );

    test(
      "Test If Function \"isApplicationWindowHeightNotChanged\" Returns True If Application Window Height Is Not Changed",
      () {
        final applicationWindowHeightIsNotChanged =
            isApplicationWindowHeightNotChanged(
              CALCULATOR_SCREEN_MINIMAL_HEIGHT,
              CALCULATOR_SCREEN_MINIMAL_HEIGHT,
            );
        final applicationWindowHeightIsChanged =
            isApplicationWindowHeightNotChanged(
              CALCULATOR_SCREEN_MINIMAL_HEIGHT,
              CALCULATOR_SCREEN_MINIMAL_HEIGHT - 1,
            );

        expect(applicationWindowHeightIsNotChanged, true);
        expect(applicationWindowHeightIsChanged, false);
      },
    );

    test(
      "Test If Function \"isTimeBeforeNoon\" Returns True If Hour Is Before Noon",
      () {
        final timeIsBeforeNoon = isTimeBeforeNoon(NOON_HOUR_OF_DAY - 1);
        final timeIsNotBeforeNoon = isTimeBeforeNoon(NOON_HOUR_OF_DAY);

        expect(timeIsBeforeNoon, true);
        expect(timeIsNotBeforeNoon, false);
      },
    );
  });
}
