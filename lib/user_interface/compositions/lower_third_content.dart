import "package:flutter/widgets.dart";

class LowerThirdContent extends StatelessWidget {
  final Widget child;
  final bool isPadded;

  const LowerThirdContent({
    super.key,
    required this.isPadded,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;

    return Positioned.fill(
      bottom: viewInsets.bottom,
      child: SafeArea(
        child: Center(
          child: Container(
            alignment: AlignmentGeometry.bottomCenter,
            constraints: const BoxConstraints(maxWidth: 1280),
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: isPadded ? 16 : 0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
