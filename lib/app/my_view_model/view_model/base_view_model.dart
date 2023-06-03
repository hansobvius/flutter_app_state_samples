import 'package:flutter/src/widgets/framework.dart';
import 'package:state_managment_sample/app/my_view_model/view_model/i_view_model_interface.dart';

class BaseViewModel implements IViewModelInterface{

  BaseViewModel({required this.stateParent}) {
    setStateParent = stateParent!;
  }

  int? previouslyCount = 0;

  int count = 0;

  @override
  late final State? stateParent;

  @override
  late final BuildContext? elementContext;

  @override
  set setStateParent(State state) {
    stateParent ??= state;
    elementContext ??= state.context;
  }

  @override
  void notifyUpdate() {
    if (count != previouslyCount) {
      // ignore: invalid_use_of_protected_member
      stateParent!.setState(() {
        previouslyCount = count;
      });
    }
  }

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
    notifyUpdate();
  }
}