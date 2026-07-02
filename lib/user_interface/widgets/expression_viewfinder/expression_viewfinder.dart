import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart" hide Orientation;
import "package:flutter/material.dart" as material;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/surface.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/internals/enums/calculator_character.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/context_button.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/expression_snapshot_item.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";

class ExpressionViewfinder extends StatefulWidget {
  final ValueNotifier<ExpressionSnapshotValueObject> expressionSnapshot;
  final ValueNotifier<List<ExpressionSnapshotValueObject>>
  listOfPreviousExpressionSnapshots;
  final VoidCallback onCleanListOfPreviousExpressionSnapshots;
  final TextEditingController expressionInputTextController;
  final FocusNode expressionInputFocusNode;
  final void Function(int indexOfItem) onExpressionSnapshotItemTap;
  final void Function(int indexOfItem) onExpressionSnapshotItemDismissed;
  final void Function(String updatedExpression) onExpressionChange;

  const ExpressionViewfinder({
    super.key,
    required this.expressionSnapshot,
    required this.listOfPreviousExpressionSnapshots,
    required this.onCleanListOfPreviousExpressionSnapshots,
    required this.expressionInputTextController,
    required this.onExpressionSnapshotItemTap,
    required this.onExpressionSnapshotItemDismissed,
    required this.onExpressionChange,
    required this.expressionInputFocusNode,
  });

  @override
  State<StatefulWidget> createState() {
    return ExpressionViewfinderState();
  }
}

class ExpressionViewfinderState extends State<ExpressionViewfinder> {
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  late final TextEditingController _resultInputTextController;
  late final ScrollController _expressionInputScrollController;
  late final ScrollController _resultInputScrollController;
  late final ScrollController _expressionSnapshotHistoryScrollController;

  @override
  void initState() {
    super.initState();

    _deviceLanguageStringsViewModel =
        DeviceLanguageStringsViewModelFactory.getInstance();

    _resultInputTextController = TextEditingController(
      text: widget.expressionSnapshot.value.result,
    );

    _expressionInputScrollController = ScrollController();
    _resultInputScrollController = ScrollController();
    _expressionSnapshotHistoryScrollController = ScrollController();

    widget.expressionInputTextController.text =
        widget.expressionSnapshot.value.expression;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_expressionInputScrollController.hasClients) {
        _expressionInputScrollController.jumpTo(
          _expressionInputScrollController.position.maxScrollExtent,
        );
      }

      if (_resultInputScrollController.hasClients) {
        _resultInputScrollController.jumpTo(0);
      }
    });

    widget.expressionSnapshot.addListener(() {
      late final TextEditingController previousExpressionInputController;

      if (isExpressionInputCursorAtTheEndOfExpression(
            widget.expressionInputTextController.selection.baseOffset,
            widget.expressionSnapshot.value.expression,
          ) ||
          widget.expressionSnapshot.value.expression.isEmpty) {
        widget.expressionInputTextController.text =
            widget.expressionSnapshot.value.expression;
      } else {
        previousExpressionInputController =
            widget.expressionInputTextController;
        final updatedExpressionInputOffset =
            (isCursorExpressionInputOverflowingExpressionSnapshotExpression(
                      widget.expressionInputTextController.selection.baseOffset,
                      widget.expressionSnapshot.value.expression,
                    )
                    ? previousExpressionInputController.selection.baseOffset - 1
                    : previousExpressionInputController.selection.baseOffset)
                .clamp(0, widget.expressionSnapshot.value.expression.length);

        widget.expressionInputTextController.value =
            previousExpressionInputController.value.copyWith(
              text: widget.expressionSnapshot.value.expression,
              selection: TextSelection.collapsed(
                offset: updatedExpressionInputOffset,
                affinity: previousExpressionInputController.selection.affinity,
              ),
              composing: TextRange.empty,
            );
      }

      _resultInputTextController.text = widget.expressionSnapshot.value.result;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_expressionInputScrollController.hasClients &&
            isExpressionInputCursorAtTheEndOfExpression(
              widget.expressionInputTextController.selection.baseOffset,
              widget.expressionSnapshot.value.expression,
            )) {
          _expressionInputScrollController.jumpTo(
            _expressionInputScrollController.position.maxScrollExtent,
          );
        }
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_resultInputScrollController.hasClients) {
          _resultInputScrollController.jumpTo(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final applicationWindowSize = MediaQuery.of(context).size;

    return material.Material(
      color: TRANSPARENT,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return ValueListenableBuilder(
            valueListenable:
                _deviceLanguageStringsViewModel.deviceLanguageStrings,
            builder: (_, deviceLanguageStrings, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isViewfinderExpressionHistoryShown(
                        constraints.maxHeight,
                        applicationWindowSize.height,
                      )
                      ? Flexible(
                          child: Surface(
                            height: double.infinity,
                            width: double.infinity,
                            backgroundColor: PRIMARY_900,
                            borderColor: PRIMARY_800,
                            borderRadius: BorderRadius.circular(27),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ValueListenableBuilder(
                                        valueListenable: widget
                                            .listOfPreviousExpressionSnapshots,
                                        builder: (_, listOfPreviousExpressionSnapshots, _) {
                                          return AnimatedScale(
                                            scale:
                                                listOfPreviousExpressionSnapshots
                                                    .isEmpty
                                                ? 0
                                                : 1,
                                            duration:
                                                AnimationDuration.SHORT.value,
                                            curve: Curves.easeInOutCirc,
                                            child: ContextButton(
                                              icon: Symbols.delete_rounded,
                                              color: NEUTRALS_50,
                                              tapIndicatorColor: NEUTRALS_50,
                                              accessibilityLabel:
                                                  deviceLanguageStrings
                                                      .CLEAN_LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_BUTTON_ACCESSIBILITY_LABEL,
                                              onTap: widget
                                                  .onCleanListOfPreviousExpressionSnapshots,
                                            ),
                                          );
                                        },
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${deviceLanguageStrings.LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOT_HISTORY_TITLE}:",
                                        style: LABEL_12_BOLD(SECONDARY_500),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: ValueListenableBuilder(
                                    valueListenable: widget
                                        .listOfPreviousExpressionSnapshots,
                                    builder: (_, listOfPreviousExpressionSnapshots, _) {
                                      return ListView.builder(
                                        itemCount:
                                            listOfPreviousExpressionSnapshots
                                                .length,
                                        reverse: true,
                                        controller:
                                            _expressionSnapshotHistoryScrollController,
                                        itemBuilder: (_, index) {
                                          return Column(
                                            children: [
                                              isItemTheLast(
                                                    index,
                                                    listOfPreviousExpressionSnapshots
                                                        .length,
                                                  )
                                                  ? const SizedBox.shrink()
                                                  : Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                          ),
                                                      child: Divider(
                                                        color: PRIMARY_800,
                                                        orientation: Orientation
                                                            .HORIZONTAL,
                                                      ),
                                                    ),
                                              ExpressionSnapshotItem(
                                                expressionSnapshot:
                                                    listOfPreviousExpressionSnapshots[index],
                                                accessibilityLabel:
                                                    deviceLanguageStrings
                                                        .EXPRESSION_SNAPSHOT_ITEM_ACCESSIBILITY_LABEL,
                                                onTap: () {
                                                  widget
                                                      .onExpressionSnapshotItemTap(
                                                        index,
                                                      );
                                                },
                                                onDismissed: () {
                                                  widget
                                                      .onExpressionSnapshotItemDismissed(
                                                        index,
                                                      );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  isViewfinderExpressionHistoryShown(
                        constraints.maxHeight,
                        applicationWindowSize.height,
                      )
                      ? const SizedBox(height: 16, width: double.infinity)
                      : const SizedBox.shrink(),
                  Surface(
                    height: isViewfinderSmall(applicationWindowSize.height)
                        ? 173
                        : 232,
                    width: double.infinity,
                    backgroundColor: PRIMARY_900,
                    borderColor: PRIMARY_800,
                    borderRadius: BorderRadius.circular(27),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: material.Theme(
                              data: material.Theme.of(context).copyWith(
                                textSelectionTheme:
                                    material.TextSelectionThemeData(
                                      selectionColor: NEUTRALS_50.withValues(
                                        alpha: 0.3,
                                      ),
                                      selectionHandleColor: NEUTRALS_50,
                                    ),
                              ),
                              child: material.TextField(
                                controller:
                                    widget.expressionInputTextController,
                                scrollController:
                                    _expressionInputScrollController,
                                textAlign: material.TextAlign.right,
                                textAlignVertical:
                                    material.TextAlignVertical.bottom,
                                decoration: material.InputDecoration(
                                  hintText: CalculatorCharacter.ZERO.value,
                                  hintStyle: LABEL_14_BOLD(
                                    NEUTRALS_50.withValues(alpha: 0.3),
                                  ),
                                  border: material.InputBorder.none,
                                  isCollapsed: true,
                                ),
                                style: LABEL_14_BOLD(NEUTRALS_50),
                                autofocus: false,
                                keyboardType: TextInputType.none,
                                expands: true,
                                showCursor: true,
                                readOnly: false,
                                enableInteractiveSelection: true,
                                cursorColor: NEUTRALS_50,
                                maxLines: null,
                                focusNode: widget.expressionInputFocusNode,
                                onChanged: widget.onExpressionChange,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "${deviceLanguageStrings.CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE}:",
                            style: LABEL_12_BOLD(SECONDARY_500),
                          ),
                          const SizedBox(height: 12),
                          material.Theme(
                            data: material.Theme.of(context).copyWith(
                              textSelectionTheme:
                                  material.TextSelectionThemeData(
                                    selectionColor: NEUTRALS_50.withValues(
                                      alpha: 0.3,
                                    ),
                                    selectionHandleColor: NEUTRALS_50,
                                  ),
                            ),
                            child: material.TextField(
                              controller: _resultInputTextController,
                              scrollController: _resultInputScrollController,
                              textAlign: material.TextAlign.right,
                              textAlignVertical:
                                  material.TextAlignVertical.bottom,
                              decoration: material.InputDecoration(
                                hintText: CalculatorCharacter.ZERO.value,
                                hintStyle:
                                    isViewfinderSmall(
                                      applicationWindowSize.height,
                                    )
                                    ? HEADING_4(
                                        NEUTRALS_50.withValues(alpha: 0.3),
                                      )
                                    : HEADING_2(
                                        NEUTRALS_50.withValues(alpha: 0.3),
                                      ),
                                border: material.InputBorder.none,
                                isDense: true,
                              ),
                              style:
                                  isViewfinderSmall(
                                    applicationWindowSize.height,
                                  )
                                  ? HEADING_4(NEUTRALS_50)
                                  : HEADING_2(NEUTRALS_50),
                              keyboardType: material.TextInputType.none,
                              readOnly: true,
                              cursorColor: NEUTRALS_50,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

@Preview()
Widget preview() {
  final expressionSnapshot = ExpressionSnapshotValueObject("1+1", "2");

  return ExpressionViewfinder(
    expressionSnapshot: ValueNotifier(expressionSnapshot),
    listOfPreviousExpressionSnapshots: ValueNotifier([expressionSnapshot]),
    expressionInputTextController: TextEditingController(),
    expressionInputFocusNode: FocusNode(),
    onExpressionChange: (_) {},
    onCleanListOfPreviousExpressionSnapshots: () {},
    onExpressionSnapshotItemTap: (_) {},
    onExpressionSnapshotItemDismissed: (_) {},
  );
}
