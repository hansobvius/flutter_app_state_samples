import 'package:flutter/material.dart';
import 'package:state_managment_sample/app/inherited_model_widget/core/observable.dart';

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    final ObservableState? state = Observable.of(context);
    return Text('${state?.itemsCount}');
  }
}