import "package:flutter/src/foundation/diagnostics.dart";
import "package:flutter/widgets.dart";

class BuildContextMock extends BuildContext {
  @override
  bool get debugDoingBuild {
    return true;
  }

  @override
  InheritedWidget dependOnInheritedElement(
    InheritedElement ancestor, {
    Object? aspect,
  }) {
    return ancestor.widget as InheritedWidget;
  }

  @override
  T? dependOnInheritedWidgetOfExactType<T extends InheritedWidget>({
    Object? aspect,
  }) {
    return null;
  }

  @override
  DiagnosticsNode describeElement(
    String name, {
    DiagnosticsTreeStyle style = DiagnosticsTreeStyle.errorProperty,
  }) {
    return DiagnosticsNode.message("");
  }

  @override
  List<DiagnosticsNode> describeMissingAncestor({
    required Type expectedAncestorType,
  }) {
    return [];
  }

  @override
  DiagnosticsNode describeOwnershipChain(String name) {
    return DiagnosticsNode.message("");
  }

  @override
  DiagnosticsNode describeWidget(
    String name, {
    DiagnosticsTreeStyle style = DiagnosticsTreeStyle.errorProperty,
  }) {
    return DiagnosticsNode.message("");
  }

  @override
  void dispatchNotification(Notification notification) {}

  @override
  T? findAncestorRenderObjectOfType<T extends RenderObject>() {
    return null;
  }

  @override
  T? findAncestorStateOfType<T extends State<StatefulWidget>>() {
    return null;
  }

  @override
  T? findAncestorWidgetOfExactType<T extends Widget>() {
    return null;
  }

  @override
  RenderObject? findRenderObject() {
    return null;
  }

  @override
  T? findRootAncestorStateOfType<T extends State<StatefulWidget>>() {
    return null;
  }

  @override
  InheritedElement?
  getElementForInheritedWidgetOfExactType<T extends InheritedWidget>() {
    return null;
  }

  @override
  T? getInheritedWidgetOfExactType<T extends InheritedWidget>() {
    return null;
  }

  @override
  bool get mounted {
    return true;
  }

  @override
  BuildOwner? get owner {
    return null;
  }

  @override
  Size? get size {
    return null;
  }

  @override
  void visitAncestorElements(ConditionalElementVisitor visitor) {}

  @override
  void visitChildElements(ElementVisitor visitor) {}

  @override
  Widget get widget {
    return Container();
  }
}
