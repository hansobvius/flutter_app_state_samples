import 'package:flutter/cupertino.dart';

abstract class IViewModelInterface {

  late final BuildContext elementContext;

  void notifyUpdate();

  set setContext(BuildContext context);
}