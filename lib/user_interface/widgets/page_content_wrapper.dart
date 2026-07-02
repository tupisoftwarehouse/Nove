import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";

class PageContentWrapper extends StatelessWidget {
  final Widget child;

  const PageContentWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: child,
      ),
    );
  }
}

@Preview()
Widget preview() {
  return PageContentWrapper(child: Text("Content"));
}
