import 'package:bachelorproef/widgets/choiceGrid.dart';
import 'package:flutter/material.dart';

///This Widget defines a Navigator that sits above the choices grid.
class ChoiceGridNavigator extends StatelessWidget {

  //TO use this navigator, call Navigator.of() with pushReplacementNamed and the name of the route
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'choiceGridRoute',
      onGenerateRoute: (settings){
        var builder;
        switch(settings.name){
          //TODO more routes above default, one per option in the grid + per extra nested navigation things
          default: builder = (BuildContext _) => ChoiceGrid();
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}



