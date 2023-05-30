/*
ModelBinding<T>: a simple class for binding a Flutter app to a immutable
model of type T.
This is a complete application. The app shows the state of an instance of
MyModel in a button's label, and replaces its MyModel instance when the
button is pressed.
ModelBinding is an inherited widget that must be created in a context above
the widgets that will depend on it. A ModelBinding is created like this:
ModelBinding<MyModel>(
  initialState: MyModel(),
  child: child,
)
ModelBinding provides a static method 'of<T>(context)' that can be used
by any descendant to retrieve the current model instance, and a similar
static 'update<T>(context, T newModel)' method for replacing the
current model. Both methods implicitly create a dependency on the model:
when the model changes the corresponding context will be rebuilt.
In this example the model is retrieved and updated like this:
RaisedButton(
  onPressed: () {
    final MyModel model = ModelBinding.of<MyModel>(context);
    ModelBinding.update<MyModel>(context, MyModel(value: model.value + 1));
  },
  child: Text('Hello World ${ModelBinding.of<MyModel>(context).value}'),
)
To use ModelBinding in your own app define an immutable model class like
MyModel that contains the application's state. Add the three ModelBinding
classes below (_ModelBindingScope, ModelBinding, _ModelBindingState) to a file
and import that where it's needed.
*/

import 'package:flutter/material.dart';

/// FIXME - example need to refactored

// void main() {
//   runApp(App());
// }
//
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ModelBinding<MyModel>(
//         initialModel: const MyModel(),
//         child: Scaffold(
//           body: Center(
//             child: ViewController(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MyModel {
//   const MyModel({ this.value = 0 });
//
//   final int value;
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) {
//       return true;
//     }
//     if (other.runtimeType != runtimeType) {
//       return false;
//     }
//     return other is MyModel
//         && other.value == this.value;
//   }
//
//   @override
//   int get hashCode => value.hashCode;
// }
//
// class _ModelBindingScope<T> extends InheritedWidget {
//   const _ModelBindingScope({
//     Key? key,
//     required this.modelBindingState,
//     required Widget child
//   }) : super(key: key, child: child);
//
//   final _ModelBindingState<T> modelBindingState;
//
//   @override
//   bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
// }
//
// class ModelBinding<T> extends StatefulWidget {
//
//   ModelBinding({
//     Key? key,
//     required this.initialModel,
//     required this.child,
//   }) : assert(initialModel != null), super(key: key);
//
//   final T initialModel;
//   final Widget child;
//
//   _ModelBindingState<T> createState() => _ModelBindingState<T>();
//
//   static Type _typeOf<T>() => T;  // https://github.com/dart-lang/sdk/issues/33297
//
//   static T of<T>(BuildContext context) {
//     final Type scopeType = _typeOf<_ModelBindingScope<T>>();
//     final _ModelBindingScope<T> scope = context.inheritFromWidgetOfExactType(scopeType);
//     return scope.modelBindingState.currentModel;
//   }
//
//   static void update<T>(BuildContext context, T newModel) {
//     final Type scopeType = _typeOf<_ModelBindingScope<T>>();
//     final _ModelBindingScope<dynamic> scope = context.inheritFromWidgetOfExactType(scopeType);
//     scope.modelBindingState.updateModel(newModel);
//   }
// }
//
// class _ModelBindingState<T> extends State<ModelBinding<T>> {
//
//   late T currentModel;
//
//   @override
//   void initState() {
//     super.initState();
//     currentModel = widget.initialModel;
//   }
//
//   void updateModel(T newModel) {
//     if (newModel != currentModel) {
//       setState(() {
//         currentModel = newModel;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _ModelBindingScope<T>(
//       modelBindingState: this,
//       child: widget.child,
//     );
//   }
// }
//
// class ViewController extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         final MyModel model = ModelBinding.of<MyModel>(context);
//         ModelBinding.update<MyModel>(context, MyModel(value: model.value + 1));
//       },
//       child: Text('Hello World ${ModelBinding.of<MyModel>(context).value}'),
//     );
//   }
// }