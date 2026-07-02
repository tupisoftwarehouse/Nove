import "package:nove/domain/body_mass_index_calculator/body_mass_index_calculation_candidate_value_object.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_value_object.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_category.dart";

const CENTIMETER_TO_METER_DIVISOR = 100.0;

const BODY_MASS_INDEX_PRECISION_FACTOR_DIGIT = 2;

const UNDERWEIGHT_BODY_MASS_INDEX_THRESHOLD = 18.5;

const NORMAL_WEIGHT_BODY_MASS_INDEX_THRESHOLD = 25.0;

const OVERWEIGHT_BODY_MASS_INDEX_THRESHOLD = 30.0;

const UNDERWEIGHT_HEIGHT_IN_CENTIMETERS = 180.0;

const UNDERWEIGHT_WEIGHT_IN_KILOGRAMS = 51.84;

const NORMAL_WEIGHT_IN_KILOGRAMS = 75.0;

const NORMAL_HEIGHT_IN_CENTIMETERS = 180.0;

const OVERWEIGHT_HEIGHT_IN_CENTIMETERS = 180.0;

const OVERWEIGHT_WEIGHT_IN_KILOGRAMS = 87.48;

const OBESE_HEIGHT_IN_CENTIMETERS = 180.0;

const OBESE_WEIGHT_IN_KILOGRAMS = 113.40;

const NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE = 23.15;

const UNDERWEIGHT_BODY_MASS_INDEX_VALUE = 16.0;

const OVERWEIGHT_BODY_MASS_INDEX_VALUE = 27.0;

const OBESE_BODY_MASS_INDEX_VALUE = 35.0;

final ZEROED_BODY_MASS_INDEX = BodyMassIndexValueObject(
  0.0,
  BodyMassIndexCategory.UNDERWEIGHT,
);

final NORMAL_BODY_MASS_INDEX = BodyMassIndexValueObject(
  NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,
  BodyMassIndexCategory.NORMAL_WEIGHT,
);

final UNDERWEIGHT_BODY_MASS_INDEX = BodyMassIndexValueObject(
  UNDERWEIGHT_BODY_MASS_INDEX_VALUE,
  BodyMassIndexCategory.UNDERWEIGHT,
);

final OVERWEIGHT_BODY_MASS_INDEX = BodyMassIndexValueObject(
  OVERWEIGHT_BODY_MASS_INDEX_VALUE,
  BodyMassIndexCategory.OVERWEIGHT,
);

final OBESE_BODY_MASS_INDEX = BodyMassIndexValueObject(
  OBESE_BODY_MASS_INDEX_VALUE,
  BodyMassIndexCategory.OBESE,
);

final ZEROED_HEIGHT = 0.0;

final ZEROED_WEIGHT = 0.0;

final ZEROED_BODY_MASS_INDEX_CALCULATION_CANDIDATE =
    BodyMassIndexCalculationCandidateValueObject(0, 0);

final BODY_MASS_INDEX_CALCULATION_CANDIDATE =
    BodyMassIndexCalculationCandidateValueObject(1.78, 65);

final MARSHALLED_BODY_MASS_INDEX_CALCULATION_CANDIDATE =
    "{\"height\":$NORMAL_HEIGHT_IN_CENTIMETERS,\"weight\":$NORMAL_WEIGHT_IN_KILOGRAMS}";

final MARSHALLED_BODY_MASS_INDEX =
    "{\"value\":$NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE,\"category\":\"${BodyMassIndexCategory.NORMAL_WEIGHT.name}\"}";
