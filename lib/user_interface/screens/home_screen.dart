import "package:flutter/widgets.dart" hide Router;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/pages/calculator_page.dart";
import "package:nove/user_interface/pages/utilities_page.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/widgets/navigation_bar/navigation_bar.dart";
import "package:nove/user_interface/widgets/navigation_bar/navigation_bar_item.dart";

class HomeScreen extends StatefulWidget {
  final CalculatorViewModel calculatorViewModel;
  final Router router;

  const HomeScreen({
    super.key,
    required this.calculatorViewModel,
    required this.router,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  late final ValueNotifier<bool> _isCalculatorPageSelected;
  late final ValueNotifier<bool> _isUtilitiesPageSelected;
  late final ValueNotifier<bool> _isExpressionHistoryOpened;
  late final ValueNotifier<bool> _isOpenExpressionHistoryButtonShown;
  late final ValueNotifier<bool> _isViewfinderAnimated;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _deviceLanguageStringsViewModel =
        DeviceLanguageStringsViewModelFactory.getInstance();

    _isCalculatorPageSelected = ValueNotifier(true);
    _isUtilitiesPageSelected = ValueNotifier(false);

    _isExpressionHistoryOpened = ValueNotifier(false);

    _isViewfinderAnimated = ValueNotifier(false);

    _isOpenExpressionHistoryButtonShown = ValueNotifier(true);

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final applicationWindowSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (currentPageIndex) {
            if (isCalculatorPageSelected(currentPageIndex)) {
              _isCalculatorPageSelected.value = true;

              _isUtilitiesPageSelected.value = false;

              _isOpenExpressionHistoryButtonShown.value = true;
            } else {
              _isCalculatorPageSelected.value = false;

              _isUtilitiesPageSelected.value = true;

              _isOpenExpressionHistoryButtonShown.value = false;
            }
          },
          children: [
            CalculatorPage(
              calculatorViewModel: widget.calculatorViewModel,
              isExpressionHistoryOpened: _isExpressionHistoryOpened,
              isViewfinderAnimated: _isViewfinderAnimated,
            ),
            UtilitiesPage(router: widget.router),
          ],
        ),
        SafeArea(
          child: Container(
            height: 80,
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: SizedBox(
              width: applicationWindowSize.width,
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: _isCalculatorPageSelected,
                  builder: (_, isCalculatorPageSelected, _) {
                    return ValueListenableBuilder(
                      valueListenable: _isUtilitiesPageSelected,
                      builder: (_, isUtilitiesPageSelected, _) {
                        return ValueListenableBuilder(
                          valueListenable: _deviceLanguageStringsViewModel
                              .deviceLanguageStrings,
                          builder: (_, deviceLanguageStrings, _) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NavigationBar(
                                  items: [
                                    NavigationBarItem(
                                      icon: Symbols.equal_rounded,
                                      title: deviceLanguageStrings
                                          .NAVIGATION_BAR_CALCULATOR_PAGE_TITLE,
                                      isSelected: isCalculatorPageSelected,
                                      accessibilityLabel: deviceLanguageStrings
                                          .NAVIGATION_BAR_CALCULATOR_PAGE_ELEMENT_ACCESSIBILITY_LABEL,
                                      onTap: () {
                                        _isCalculatorPageSelected.value = true;

                                        _isUtilitiesPageSelected.value = false;

                                        _pageController.animateToPage(
                                          0,
                                          duration:
                                              AnimationDuration.LONG.value,
                                          curve: Curves.easeInOutCirc,
                                        );
                                      },
                                    ),
                                    NavigationBarItem(
                                      icon: Symbols.widgets_rounded,
                                      title: deviceLanguageStrings
                                          .NAVIGATION_BAR_UTILITIES_PAGE_TITLE,
                                      isSelected: isUtilitiesPageSelected,
                                      accessibilityLabel: deviceLanguageStrings
                                          .NAVIGATION_BAR_UTILITIES_PAGE_ELEMENT_ACCESSIBILITY_LABEL,
                                      onTap: () {
                                        _isUtilitiesPageSelected.value = true;

                                        _isCalculatorPageSelected.value = false;

                                        _pageController.animateToPage(
                                          1,
                                          duration:
                                              AnimationDuration.LONG.value,
                                          curve: Curves.easeInOutCirc,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                isViewfinderExpressionHistoryNotAbleToBeShown(
                                      applicationWindowSize.height,
                                      applicationWindowSize.width,
                                    )
                                    ? const SizedBox.shrink()
                                    : ValueListenableBuilder(
                                        valueListenable:
                                            _isOpenExpressionHistoryButtonShown,
                                        builder: (_, isOpenExpressionHistoryButtonShown, _) {
                                          return ValueListenableBuilder(
                                            valueListenable:
                                                _isExpressionHistoryOpened,
                                            builder: (_, isExpressionHistoryExpanded, _) {
                                              return AnimatedContainer(
                                                height:
                                                    isOpenExpressionHistoryButtonShown
                                                    ? 64
                                                    : 0,
                                                width:
                                                    isOpenExpressionHistoryButtonShown
                                                    ? 64
                                                    : 0,
                                                duration: AnimationDuration
                                                    .SHORT
                                                    .value,
                                                curve: Curves.easeInOutCirc,
                                                alignment: Alignment.center,
                                                child: AnimatedScale(
                                                  scale:
                                                      isOpenExpressionHistoryButtonShown
                                                      ? 1
                                                      : 0,
                                                  duration: AnimationDuration
                                                      .SHORT
                                                      .value,
                                                  curve: Curves.easeInOutCirc,
                                                  child: ActionButton(
                                                    icon:
                                                        isExpressionHistoryExpanded
                                                        ? Symbols
                                                              .compress_rounded
                                                        : Symbols
                                                              .expand_rounded,
                                                    tooltipMessage:
                                                        deviceLanguageStrings
                                                            .EXPAND_EXPRESSION_VIEWFINDER_BUTTON_TOOLTIP_MESSAGE,
                                                    accessibilityLabel:
                                                        deviceLanguageStrings
                                                            .EXPAND_EXPRESSION_VIEWFINDER_BUTTON_ACCESSIBILITY_LABEL,
                                                    onTap: () {
                                                      _isExpressionHistoryOpened
                                                              .value =
                                                          !_isExpressionHistoryOpened
                                                              .value;

                                                      _isViewfinderAnimated
                                                              .value =
                                                          true;
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
