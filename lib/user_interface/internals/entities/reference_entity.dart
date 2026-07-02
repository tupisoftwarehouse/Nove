import "package:flutter/foundation.dart";

class ReferenceEntity<T> {
  late T _value;
  VoidCallback? _onValueChanged;

  T get value {
    return _value;
  }

  set value(T updatedValue) {
    _value = updatedValue;

    _onValueChanged?.call();
  }

  void setObserver(VoidCallback updateOnValueChanged) {
    _onValueChanged = updateOnValueChanged;
  }
}
