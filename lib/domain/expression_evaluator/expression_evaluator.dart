import "package:math_expressions/math_expressions.dart";
import "package:nove/domain/expression_evaluator/not_valid_expression_error.dart";
import "package:nove/domain/expression_evaluator/internals/formatter/expression_evaluator_formatter.dart";
import "package:nove/domain/expression_evaluator/internals/checker/expression_evaluation_checker.dart";

class ExpressionEvaluator {
  ExpressionEvaluator._();

  static num getEvaluatedExpression(String expressionToBeEvaluated) {
    try {
      final formattedExpressionToBeEvaluated =
          ExpressionEvaluatorFormatter.getFormatterExpression(
            expressionToBeEvaluated,
          );
      final expressionParserImplementation = GrammarParser();
      final grammaticallyParsedExpression = expressionParserImplementation
          .parse(formattedExpressionToBeEvaluated);
      final evaluatedExpression = RealEvaluator().evaluate(
        grammaticallyParsedExpression,
      );

      return isEvaluatedExpressionRound(evaluatedExpression)
          ? evaluatedExpression.toInt()
          : evaluatedExpression;
    } catch (_) {
      throw NotValidExpressionError();
    }
  }
}
