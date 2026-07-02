import "package:flutter/services.dart";
import "package:flutter/widgets.dart" hide Router;
import "package:nove/dependency_injection/calculator_view_model_factory.dart";
import "package:nove/dependency_injection/router_factory.dart";
import "package:nove/user_interface/internals/adapters/application.dart";
import "package:nove/user_interface/internals/widgets_binding_observers/application_orientation_locking_widgets_binding_observer.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/screens/home_screen.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() {
    return _ApplicationState();
  }
}

class _ApplicationState extends State<Application> {
  late final CalculatorViewModel _calculatorViewModel;
  late final Router _router;

  @override
  void initState() {
    late final ApplicationOrientationLockingWidgetsBindingObserver
    applicationOrientationLockingWidgetsBindingObserver;

    super.initState();

    _calculatorViewModel = CalculatorViewModelFactory.getInstance();

    _router = RouterFactory.getInstance();

    applicationOrientationLockingWidgetsBindingObserver =
        ApplicationOrientationLockingWidgetsBindingObserver(
          SystemChrome.setPreferredOrientations,
        );

    WidgetsBinding.instance.addObserver(
      applicationOrientationLockingWidgetsBindingObserver,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TeresaApplication(
      content: HomeScreen(
        calculatorViewModel: _calculatorViewModel,
        router: _router,
      ),
    );
  }
}
