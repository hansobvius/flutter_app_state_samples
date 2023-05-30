import 'package:flutter/material.dart';
import 'package:state_managment_sample/app/inherited_model_widget/core/observable.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    final ObservableState? state = Observable.of(context);
    return ElevatedButton(
      child: const Text('Add Item'),
      onPressed: () {
        state?.addItem('new item');
      },
    );
  }
}