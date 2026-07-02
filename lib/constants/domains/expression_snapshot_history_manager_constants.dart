import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";

final UPDATED_EXPRESSION_SNAPSHOT = ExpressionSnapshotValueObject(
  EXPRESSION_TO_BE_EVALUATED,
  EVALUATED_EXPRESSION.toString(),
);

List<ExpressionSnapshotValueObject> FULFILLED_LIST_OF_EXPRESSION_SNAPSHOTS() {
  return List.filled(
    MAXIMUM_AMOUNT_OF_STORED_EXPRESSION_SNAPSHOTS,
    EMPTY_EXPRESSION_SNAPSHOT,
    growable: true,
  );
}

final EXPRESSION_SNAPSHOT = ExpressionSnapshotValueObject(
  EXPRESSION_TO_BE_EVALUATED,
  EVALUATED_EXPRESSION.toString(),
);

final EMPTY_EXPRESSION_SNAPSHOT = ExpressionSnapshotValueObject("", "");

const MAXIMUM_AMOUNT_OF_STORED_EXPRESSION_SNAPSHOTS = 30;

const MARSHALLED_EXPRESSION_SNAPSHOT =
    "{\"expression\":\"$EXPRESSION_TO_BE_EVALUATED\",\"result\":\"$EVALUATED_EXPRESSION\"}";

const MARSHALLED_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT =
    "[$MARSHALLED_EXPRESSION_SNAPSHOT]";
