import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";

void main() {
  group("Test \"ExpressionSnapshotValueObject\" Value Object", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final instanceFromMarshalledData =
            ExpressionSnapshotValueObject.fromMarshalledData(
              MARSHALLED_EXPRESSION_SNAPSHOT,
            );

        expect(
          instanceFromMarshalledData.result,
          EVALUATED_EXPRESSION.toString(),
        );
        expect(
          instanceFromMarshalledData.expression,
          EXPRESSION_TO_BE_EVALUATED,
        );
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = ExpressionSnapshotValueObject(
          EXPRESSION_TO_BE_EVALUATED,
          "$EVALUATED_EXPRESSION",
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_EXPRESSION_SNAPSHOT);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns A List Of Instances From Marshalled List Data",
      () {
        final instance = ExpressionSnapshotValueObject.fromMarshalledListData(
          MARSHALLED_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns marshalled List Data",
      () {
        final marshalledListData =
            ExpressionSnapshotValueObject.marshalledListData([
              ExpressionSnapshotValueObject(
                EXPRESSION_TO_BE_EVALUATED,
                "$EVALUATED_EXPRESSION",
              ),
            ]);

        expect(
          marshalledListData,
          MARSHALLED_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT,
        );
      },
    );
  });
}
