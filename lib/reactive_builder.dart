import 'package:flutter/material.dart';

class ReactiveBuilder extends StatefulWidget {
  const ReactiveBuilder({super.key, required this.action, required this.builder});
  final Function action;
  final Function builder;

  @override
  State<ReactiveBuilder> createState() => _ReactiveBuilderState();
}

class _ReactiveBuilderState extends State<ReactiveBuilder> {
  late var returnAction;
  @override
  void initState() {
    returnAction = widget.action((){
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    returnAction = widget.action(null);
    print('rebuid$returnAction');
    return widget.builder(returnAction);
  }
}