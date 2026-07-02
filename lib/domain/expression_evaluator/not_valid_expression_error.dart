import "package:nove/constants/domains/expression_evaluator_constants.dart";

class NotValidExpressionError extends Error {
  NotValidExpressionError() : super();

  @override
  String toString() {
    return NOT_VALID_EXPRESSION_ERROR_MESSAGE;
  }
}
