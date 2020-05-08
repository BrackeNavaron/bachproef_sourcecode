import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AsyncWidget extends StatefulWidget {
  @override
  _AsyncWidgetState createState() => _AsyncWidgetState();
}

class _AsyncWidgetState extends State<AsyncWidget> {

  final _controller = BehaviorSubject();
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
