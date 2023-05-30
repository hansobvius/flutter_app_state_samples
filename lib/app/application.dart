import 'package:flutter/material.dart';
import 'package:state_managment_sample/app/inherited_model_widget/inherited_model_v2.dart';
import 'package:state_managment_sample/app/inherited_model_widget/ui/home.dart';
// import 'package:state_managment_sample/app/my_view_model/ui/home.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}