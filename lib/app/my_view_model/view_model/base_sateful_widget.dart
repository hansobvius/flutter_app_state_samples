import 'package:flutter/material.dart';

class StateWidget<E extends StatefulWidget> extends State<E> {

  late final Widget child;

  Function? _elementRebuild;

  StateWidget({required this.child});

  @override
  void initState() {
    super.initState();
  }

  void rebuild() {
    if (_elementRebuild != null) {
      _elementRebuild!.call();
    }
  }

  @override
  Widget build(covariant Element context) {
    _elementRebuild = context.markNeedsBuild;
    return child;
  }
}