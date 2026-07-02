import "dart:io";
import "package:flutter/cupertino.dart" as cupertino;
import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart" as widgets;

class Navigator {
  void navigate(widgets.BuildContext context, widgets.Widget screen) {
    late final widgets.Route route;
    final widgets.Widget Function(widgets.BuildContext) builder = (_) {
      return screen;
    };

    route = Platform.isIOS
        ? cupertino.CupertinoPageRoute(builder: builder)
        : material.MaterialPageRoute(builder: builder);

    widgets.Navigator.push(context, route);
  }

  void navigateBack(widgets.BuildContext context) {
    widgets.Navigator.pop(context);
  }
}
