import "package:flutter/widgets.dart" as widgets;
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_calculation_candidate_value_object.dart";
import "package:nove/data/currency/currency_values_value_object.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";

bool isCurrencyValuesUpdatable(
  int currentTimestamp,
  storedUpdatableAtTimestamp,
) {
  return currentTimestamp > storedUpdatableAtTimestamp;
}

bool isCurrencyValuesNotUpToDate(
  CurrencyValuesValueObject currencyValuesFromCurrencyUnit,
  CurrencyValuesValueObject currencyValues,
) {
  return currencyValues.australiaDollar !=
          currencyValuesFromCurrencyUnit.australiaDollar ||
      currencyValues.brazilReal != currencyValuesFromCurrencyUnit.brazilReal ||
      currencyValues.unitedKingdomPound !=
          currencyValuesFromCurrencyUnit.unitedKingdomPound ||
      currencyValues.switzerlandFranc !=
          currencyValuesFromCurrencyUnit.switzerlandFranc ||
      currencyValues.canadaDollar !=
          currencyValuesFromCurrencyUnit.canadaDollar ||
      currencyValues.newZealandDollar !=
          currencyValuesFromCurrencyUnit.newZealandDollar ||
      currencyValues.euro != currencyValuesFromCurrencyUnit.euro;
}

bool isViewfinderSmall(double screenHeight) {
  return screenHeight <= SMALL_VIEWFINDER_HEIGHT;
}

bool isItemTheLast(int itemIndex, int lengthOfListOfItems) {
  return itemIndex == (lengthOfListOfItems - 1);
}

bool isTimeHourNumberOverflowing(int timeHourNumberLength) {
  return timeHourNumberLength > TIME_HOUR_NUMBER_LENGTH;
}

bool isAggregatedTimeHourNumberOverflowing(int timeHourNumberLength) {
  return timeHourNumberLength > AGGREGATOR_TIME_HOUR_NUMBER_LENGTH;
}

bool isTimeCycleNumberOverflowing(int timeCycleNumberLength) {
  return timeCycleNumberLength > TIME_CYCLE_NUMBER_LENGTH;
}

bool isTimeCycleHigherThanThreshold(int timeCycleNumber) {
  return timeCycleNumber > TIME_CYCLE_HIGHEST_NUMBER;
}

bool isControllerNotTheFirst(int controllerIndex) {
  return controllerIndex > 0;
}

bool isControllerNotTheLast(int controllerIndex, int listOfControllersLength) {
  return controllerIndex < listOfControllersLength - 1;
}

bool isListOfTimesResized(
  int listOfTimesLength,
  int listOfTimeInputControllerHoldersLength,
) {
  return listOfTimesLength != listOfTimeInputControllerHoldersLength;
}

bool isItemSelected(int itemIndex, int selectedItemIndex) {
  return itemIndex == selectedItemIndex;
}

bool isItemTheBaseMeasureUnit(
  int selectedItemBaseUnitMeasureUnitIndex,
  int itemToBeCheckedMeasureUnitIndex,
) {
  return itemToBeCheckedMeasureUnitIndex ==
      selectedItemBaseUnitMeasureUnitIndex;
}

bool isMeasureUnitInputNotTheBase(
  int measureInputIndex,
  int baseMeasureInputIndex,
) {
  return measureInputIndex != baseMeasureInputIndex;
}

bool isListOfMeasureUnitsResized(
  int listOfTimesLength,
  int listOfTimeInputControllerHoldersLength,
) {
  return listOfTimesLength != listOfTimeInputControllerHoldersLength;
}

bool isCharacterNotAllowed(String value) {
  return value[value.length - 1] != POINT_CHARACTER &&
      value[value.length - 1] != EXPONENTIAL_CHARACTER;
}

bool isApplicationResumed(widgets.AppLifecycleState appLifecycleState) {
  return appLifecycleState == widgets.AppLifecycleState.resumed;
}

bool isNull<T>(T? item) {
  return item == null;
}

bool isKeyboardScientific(
  widgets.Orientation applicationWindowOrientation,
  double applicationWindowHeight,
) {
  return applicationWindowOrientation == widgets.Orientation.portrait &&
      applicationWindowHeight > SCIENTIFIC_KEYBOARD_MINIMAL_HEIGHT;
}

bool isKeyboardHorizontal(
  widgets.Orientation applicationWindowOrientation,
  double applicationWindowWidth,
) {
  return applicationWindowOrientation == widgets.Orientation.landscape &&
      applicationWindowWidth > HORIZONTAL_KEYBOARD_MINIMAL_WIDTH;
}

bool isViewfinderExpressionHistoryShown(
  double widgetHeight,
  double screenHeight,
) {
  return widgetHeight >
              LARGER_SCREEN_VIEWFINDER_HISTORY_CONTAINER_MINIMAL_HEIGHT_THRESHOLD &&
          !(screenHeight <= SMALL_VIEWFINDER_HEIGHT) ||
      widgetHeight >
              SMALL_SCREEN_VIEWFINDER_HISTORY_CONTAINER_MINIMAL_HEIGHT_THRESHOLD &&
          screenHeight <= SMALL_VIEWFINDER_HEIGHT;
}

bool isUtilityBannerDeckLarge(double screenWidth) {
  return screenWidth > LARGE_SCREEN_UTILITY_BANNER_DECK_MINIMAL_WIDTH;
}

bool isUtilityBannerDeckMedium(double screenWidth) {
  return screenWidth > MEDIUM_SCREEN_UTILITY_BANNER_DECK_MINIMAL_WIDTH;
}

bool isCalculatorScreenSmall(double screenHeight) {
  return screenHeight < CALCULATOR_SCREEN_MINIMAL_HEIGHT;
}

bool isNumberSystemHexadecimal(NumberSystem numberSystem) {
  return numberSystem == NumberSystem.HEXADECIMAL;
}

bool isCursorAtTheEndOfExpression(int positionOfCursor, String expression) {
  return positionOfCursor == expression.length || positionOfCursor == -1;
}

bool isCalculatorPageSelected(int currentPageIndex) {
  return currentPageIndex == 0;
}

bool isViewfinderExpressionHistoryNotAbleToBeShown(
  double screenHeight,
  double screenWidth,
) {
  return (screenHeight < NOT_ABLE_TO_BE_SHOWN_VIEWFINDER_SCREEN_HEIGHT) ||
      (screenWidth < NOT_ABLE_TO_BE_SHOWN_VIEWFINDER_SCREEN_WIDTH);
}

bool isExpressionSnapshotUpdated(
  ExpressionSnapshotValueObject previousExpressionSnapshot,
  ExpressionSnapshotValueObject currentExpressionSnapshot,
) {
  return previousExpressionSnapshot.expression !=
          currentExpressionSnapshot.expression ||
      previousExpressionSnapshot.result != currentExpressionSnapshot.result;
}

bool isConverterUnchanged(List<MeasureUnitEntity> listOfMeasureUnits) {
  return listOfMeasureUnits.length == 1 &&
      listOfMeasureUnits.first.value == 0.toString();
}

bool isTimeAggregatorUnchanged(List<TimeValueObject> listOfTimes) {
  return listOfTimes.length == 1 &&
      listOfTimes.first.hours == 0 &&
      listOfTimes.first.minutes == 0 &&
      listOfTimes.first.seconds == 0;
}

bool isBodyMassIndexCalculatorUnchanged(
  BodyMassIndexCalculationCandidateValueObject
  bodyMassIndexCalculationCandidate,
) {
  return bodyMassIndexCalculationCandidate.height == 0 &&
      bodyMassIndexCalculationCandidate.weight == 0;
}

bool isTimeCalculatorUnchanged(
  TimeValueObject firstTimeToBeCalculated,
  TimeValueObject secondTimeToBeCalculated,
) {
  return firstTimeToBeCalculated.hours == 0 &&
      firstTimeToBeCalculated.minutes == 0 &&
      firstTimeToBeCalculated.seconds == 0 &&
      secondTimeToBeCalculated.hours == 0 &&
      secondTimeToBeCalculated.minutes == 0 &&
      secondTimeToBeCalculated.seconds == 0;
}

bool isKeyboardCharacterSmall(double applicationWindowHeight) {
  return applicationWindowHeight <
      SMALL_KEYBOARD_CHARACTER_HIGHEST_APPLICATION_WINDOW_HEIGHT;
}

bool isExpressionInputChanged(
  String updatedExpression,
  String currentExpressionSnapshotExpression,
) {
  return updatedExpression != currentExpressionSnapshotExpression;
}

bool isOrientationHorizontal(Orientation orientation) {
  return orientation == Orientation.HORIZONTAL;
}

bool isCursorAtTheStartOfExpression(int positionOfCursor) {
  return positionOfCursor == 0;
}

bool isExpressionInputCursorAtTheEndOfExpression(
  int positionOfCursor,
  String expression,
) {
  return positionOfCursor == expression.length - 1 || positionOfCursor == -1;
}

bool isCursorExpressionInputOverflowingExpressionSnapshotExpression(
  int positionOfCursor,
  String expression,
) {
  return positionOfCursor > expression.length;
}

bool isApplicationWindowWidthSmall(double applicationWindowWidth) {
  return applicationWindowWidth < CALCULATOR_SCREEN_MINIMAL_HEIGHT;
}

bool isApplicationWindowHeightSmall(double applicationWindowHeight) {
  return applicationWindowHeight < CALCULATOR_SCREEN_MINIMAL_HEIGHT;
}

bool isApplicationWindowPortrait(
  double currentApplicationWindowHeight,
  double currentApplicationWindowWidth,
) {
  return currentApplicationWindowHeight > currentApplicationWindowWidth;
}

bool isApplicationWindowLandscape(
  widgets.Orientation applicationWindowOrientation,
) {
  return applicationWindowOrientation == widgets.Orientation.landscape;
}

bool isApplicationWindowWidthNotChanged(
  double currentApplicationWindowWidth,
  double previousApplicationWindowWidth,
) {
  return currentApplicationWindowWidth == previousApplicationWindowWidth;
}

bool isApplicationWindowHeightNotChanged(
  double currentApplicationWindowHeight,
  double previousApplicationWindowHeight,
) {
  return currentApplicationWindowHeight == previousApplicationWindowHeight;
}

bool isTimeBeforeNoon(int hour) {
  return hour < NOON_HOUR_OF_DAY;
}
