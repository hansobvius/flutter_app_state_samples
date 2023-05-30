import 'package:flutter/cupertino.dart';

abstract class IViewModelInterface {

  late BuildContext elementContext;

  void notifyUpdate();

  set setContext(BuildContext context);
}