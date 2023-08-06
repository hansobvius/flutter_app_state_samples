import 'package:flutter/material.dart';
import 'package:state_managment_sample/app/inherited_model_widget/core/observable.dart';
import 'package:state_managment_sample/app/inherited_model_widget/ui/components/widget_a.dart';
import 'package:state_managment_sample/app/inherited_model_widget/ui/components/widget_b.dart';
import 'package:state_managment_sample/app/inherited_model_widget/ui/components/widget_c.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Observable(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Column(
          children: <Widget>[
            const WidgetA(),
            Row(
              children: const <Widget>[
                Icon(Icons.shopping_cart),
                WidgetB(),
                WidgetC(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}