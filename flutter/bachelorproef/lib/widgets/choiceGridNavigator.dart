import 'package:bachelorproef/widgets/animationWidget.dart';
import 'package:bachelorproef/widgets/choiceGrid.dart';
import 'package:bachelorproef/widgets/formWidget.dart';
import 'package:bachelorproef/widgets/listWidget.dart';
import 'package:bachelorproef/widgets/navigatorKeyProviderWidget.dart';
import 'package:bachelorproef/widgets/pagerWidget.dart';
import 'package:flutter/material.dart';

///This Widget defines a Navigator that sits above the choices grid.
class ChoiceGridNavigator extends StatelessWidget {

  //TO use this navigator, call Navigator.of() with pushReplacementNamed and the name of the route
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigatorKeyProviderWidget.of(context).gridNavigator,
      initialRoute: 'choiceGridRoute',
      onGenerateRoute: (settings){
        var builder;
        switch(settings.name){
          //TODO more routes above default, one per option in the grid + per extra nested navigation things
          case "listRoute": builder = (BuildContext _) => ListWidget(); break;
          case "pagerRoute": builder = (BuildContext _) => PagerWidget(); break;
          case "formsRoute": builder = (BuildContext _) => FormWidget(); break;
          case "animationsRoute": builder = (BuildContext _) => AnimationWidget();
          break;

          default: builder = (BuildContext _) => ChoiceGrid();
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}



