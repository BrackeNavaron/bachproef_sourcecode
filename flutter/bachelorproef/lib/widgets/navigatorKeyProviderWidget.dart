
import 'package:flutter/widgets.dart';

class NavigatorKeyProviderWidget extends InheritedWidget {
  NavigatorKeyProviderWidget({
    Key key,
    @required this.rootNavigator,
    @required this.gridNavigator,
    @required Widget child,
  }): assert(rootNavigator != null && gridNavigator != null && child != null),
        super(key: key,child: child);

  final GlobalKey<NavigatorState> rootNavigator;
  final GlobalKey<NavigatorState> gridNavigator;

  @override
  bool updateShouldNotify(NavigatorKeyProviderWidget oldWidget)
    => oldWidget.rootNavigator != rootNavigator ||
        oldWidget.gridNavigator != gridNavigator;

  static NavigatorKeyProviderWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NavigatorKeyProviderWidget>();
  }
}