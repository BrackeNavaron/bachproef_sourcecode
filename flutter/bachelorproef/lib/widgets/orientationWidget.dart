import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait){
      return portrait();
    }else{
      return landscape();
    }
  }

  Widget buildWithOrientationBuilder() =>
      OrientationBuilder(
        builder: (BuildContext context,Orientation orientation){
          if(orientation == Orientation.portrait){
            return portrait();
          }else{
            return landscape();
          }
    },
  );

  Widget portrait() => Container(child: Text("portrait"));
  Widget landscape() => Container(child: Text("landscape"));
}

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget({
    Key key,
    @required this.data,
    @required Widget child,
  }): assert(data != null && child != null), super(key: key);

  final String data;

  static MyInheritedWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget)
    => data != oldWidget.data;
}
