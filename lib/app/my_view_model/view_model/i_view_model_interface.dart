import 'package:flutter/cupertino.dart';

abstract class IViewModelInterface {

  late final BuildContext? elementContext;

  late final State? stateParent;

  set setStateParent(State state);

  void notifyUpdate();
}