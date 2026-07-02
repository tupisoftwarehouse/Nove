import "package:flutter/widgets.dart";

class PreviewContentWrapper extends StatelessWidget {
  final Widget child;

  const PreviewContentWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext _) {
    return SizedBox(width: double.infinity, height: 200, child: child);
  }
}
