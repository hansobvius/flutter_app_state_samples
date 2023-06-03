import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_sample/app/my_view_model/view_model/i_view_model_interface.dart';

class BaseViewModel implements IViewModelInterface{

  BaseViewModel({required this.stateMutation}) {
    setStateMutation = stateMutation;
  }
  
  Function stateMutation;

  int? previouslyCount = 0;
  int count = 0;

  void incrementCount() {
    count++;
    notifyUpdate();
  }

  set setStateMutation(Function state) {
    stateMutation = state;
  }

  @override
  late final BuildContext elementContext;

  @override
  set setContext(BuildContext context) {
    elementContext = context;
  }

  @override
  void notifyUpdate() {
    if (count != previouslyCount) {
      stateMutation.call(() {
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
}