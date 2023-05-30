import 'package:flutter/widgets.dart';
import 'package:state_managment_sample/app/inherited_model_widget/model/item.dart';

class _ObservableWidget extends InheritedWidget {
  const _ObservableWidget({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ObservableState data;

  @override
  bool updateShouldNotify(_ObservableWidget oldWidget) => true;
}

class Observable extends StatefulWidget {
  const Observable({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ObservableState createState() => ObservableState();

  static ObservableState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_ObservableWidget>())
        ?.data;
  }
}

class ObservableState extends State<Observable> {
  // List of Items
  final List<Item> _items = <Item>[];

  // Getter (number of items)
  int get itemsCount => _items.length;

  // Helper method to add an Item
  void addItem(String reference) {
    if (mounted) {
      setState(() {
        _items.add(Item(reference));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ObservableWidget(
      data: this,
      child: widget.child,
    );
  }
}