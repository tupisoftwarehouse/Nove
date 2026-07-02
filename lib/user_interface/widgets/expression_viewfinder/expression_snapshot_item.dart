import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:flutter/material.dart" as material;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/user_interface/internals/theme/icon_styles.dart";

class ExpressionSnapshotItem extends StatefulWidget {
  final ExpressionSnapshotValueObject expressionSnapshot;
  final String accessibilityLabel;
  final VoidCallback onTap;
  final VoidCallback onDismissed;

  const ExpressionSnapshotItem({
    super.key,
    required this.expressionSnapshot,
    required this.accessibilityLabel,
    required this.onTap,
    required this.onDismissed,
  });

  @override
  State<StatefulWidget> createState() {
    return _ExpressionSnapshotItemState();
  }
}

class _ExpressionSnapshotItemState extends State<ExpressionSnapshotItem> {
  late final TextEditingController expressionInputTextController;
  late final TextEditingController resultInputTextController;

  @override
  void initState() {
    super.initState();

    expressionInputTextController = TextEditingController(
      text: widget.expressionSnapshot.expression,
    );

    resultInputTextController = TextEditingController(
      text: widget.expressionSnapshot.result,
    );
  }

  @override
  void dispose() {
    expressionInputTextController.dispose();
    resultInputTextController.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(ExpressionSnapshotItem previousWidget) {
    super.didUpdateWidget(previousWidget);

    if (isExpressionSnapshotUpdated(
      previousWidget.expressionSnapshot,
      widget.expressionSnapshot,
    )) {
      expressionInputTextController.text = widget.expressionSnapshot.expression;

      resultInputTextController.text = widget.expressionSnapshot.result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.expressionSnapshot),
      direction: DismissDirection.horizontal,
      secondaryBackground: Container(
        color: DANGER_500,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: HEADING_3_ICON(Symbols.delete_rounded, DANGER_50),
      ),
      background: Container(
        color: DANGER_500,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: HEADING_3_ICON(Symbols.delete_rounded, DANGER_50),
      ),
      onDismissed: (_) {
        widget.onDismissed();
      },
      child: Semantics(
        label: widget.accessibilityLabel,
        button: true,
        child: TapIndicator(
          indicatorColor: NEUTRALS_50,
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(color: PRIMARY_900),
            padding: const EdgeInsets.all(16),
            child: IgnorePointer(
              child: Column(
                children: [
                  material.Theme(
                    data: material.Theme.of(context).copyWith(
                      textSelectionTheme: material.TextSelectionThemeData(
                        selectionColor: NEUTRALS_50.withValues(alpha: 0.3),
                        selectionHandleColor: NEUTRALS_50,
                      ),
                    ),
                    child: material.TextField(
                      controller: expressionInputTextController,
                      textAlign: material.TextAlign.right,
                      textAlignVertical: material.TextAlignVertical.bottom,
                      decoration: const material.InputDecoration(
                        border: material.InputBorder.none,
                        constraints: BoxConstraints(),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: LABEL_14_BOLD(NEUTRALS_50),
                      keyboardType: material.TextInputType.none,
                      readOnly: true,
                      enabled: false,
                      cursorColor: NEUTRALS_50,
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(height: 8),
                  material.Theme(
                    data: material.Theme.of(context).copyWith(
                      textSelectionTheme: material.TextSelectionThemeData(
                        selectionColor: NEUTRALS_50.withValues(alpha: 0.3),
                        selectionHandleColor: NEUTRALS_50,
                      ),
                    ),
                    child: material.TextField(
                      controller: resultInputTextController,
                      textAlign: material.TextAlign.right,
                      textAlignVertical: material.TextAlignVertical.bottom,
                      decoration: const material.InputDecoration(
                        border: material.InputBorder.none,
                        constraints: BoxConstraints(),
                      ),
                      style: HEADING_4(NEUTRALS_50),
                      keyboardType: material.TextInputType.none,
                      readOnly: true,
                      enabled: false,
                      cursorColor: NEUTRALS_50,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return ExpressionSnapshotItem(
    expressionSnapshot: ExpressionSnapshotValueObject("1+1", "2"),
    accessibilityLabel: "",
    onTap: () {},
    onDismissed: () {},
  );
}
