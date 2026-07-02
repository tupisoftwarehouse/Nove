import "dart:io";
import "package:flutter/cupertino.dart" as cupertino;
import "package:flutter/material.dart" as material;
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:nove/constants/application_constants.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class TeresaApplication extends StatefulWidget {
  final Widget content;

  const TeresaApplication({super.key, required this.content});

  @override
  State<StatefulWidget> createState() {
    return _TeresaApplicationState();
  }
}

class _TeresaApplicationState extends State<TeresaApplication> {
  late final ThemeViewModel _themeViewModel;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: _themeViewModel.theme,
      builder: (_, theme, _) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: theme.systemUiOverlayStyle,
          child: Platform.isIOS
              ? cupertino.CupertinoApp(
                  title: APPLICATION_NAME,
                  home: widget.content,
                )
              : material.MaterialApp(
                  title: APPLICATION_NAME,
                  theme: material.ThemeData(
                    pageTransitionsTheme: material.PageTransitionsTheme(
                      builders: {
                        TargetPlatform.android:
                            material.FadeForwardsPageTransitionsBuilder(
                              backgroundColor: theme.surface.backgroundColor,
                            ),
                      },
                    ),
                  ),
                  home: widget.content,
                ),
        );
      },
    );
  }
}
