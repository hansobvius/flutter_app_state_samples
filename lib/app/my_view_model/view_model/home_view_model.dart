// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

abstract class BaseViewModel {

  BaseViewModel(State state) : _stateParent = state;

  @mustCallSuper
  late final State? _stateParent;

  @mustCallSuper
  late final BuildContext? _elementContext;

  @mustCallSuper
  void notifyUpdate(Function(String) callback) {
    if (_stateParent != null && _elementContext != null) {
      // ignore: invalid_use_of_protected_member
      _stateParent!.setState(
              () => callback('ELEMENT ${_elementContext!.owner} RE-BUILT'));
    }
  }

  @mustCallSuper
  void getBuildContext(BuildContext?  context) {
    getBuildContext(_elementContext);
  }

  @mustCallSuper
  void getBuildState(State?  context) {
    getBuildState(_stateParent);
  }
}

class HomeViewModel extends BaseViewModel {

  HomeViewModel(State state) : super(state);

  int? previouslyCount = 0;

  int count = 0;

  @override
  Type get runtimeType => count.runtimeType;

  @override
  String toString() => count.toString();

  @override
  int get hashCode => count.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return false;
  }

  void incrementCount() {
    count++;
    notifyUpdate((value) => debugPrint(value));
  }
}