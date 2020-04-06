import 'package:bachelorproef/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChoiceGrid extends StatelessWidget {

  //TODO nest a navigator
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarContent(),
      ),
      body: Container(),//TODO grid
    );
  }
}

class AppBarContent extends StatefulWidget {
  @override
  _AppBarContentState createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {

  String title;

  @override
  Widget build(BuildContext context) {
    if(title == null) title = S.of(context).one;
    final s = S.of(context);
    final choices = <String>[s.one,s.two,s.three,s.four,s.five];
    return ScreenTypeLayout.builder(
      mobile: (context){
        return OrientationLayoutBuilder(
          portrait: (context){
            return Row(
              children: <Widget>[
                Expanded(
                  child: Text(title),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add,color: Colors.white),
                      onPressed: () => setState((){
                        title = choices[0];
                      }),
                    ),
                    IconButton(
                      icon: Icon(Icons.add,color: Colors.white),
                      onPressed: () => setState((){
                        title = choices[1];
                      }),
                    ),
                    PopupMenuButton<String>(
                      initialValue: title,
                      onSelected: (value){
                        setState(() {
                          title = value;
                        });
                      },
                      itemBuilder: (context){
                        return choices.skip(2)
                            .map((String s)=> PopupMenuItem<String>(value: s, child: Text(s)))
                            .toList();
                      },
                    )
                  ],
                ),
              ],
            );
          },
          landscape: (context){
            return Row(
              children: <Widget>[
                Expanded(
                  child: Text(title),
                ),
                IconButton(
                  icon: Icon(Icons.add,color: Colors.white),
                  onPressed: () => setState((){
                    title = choices[0];
                  }),
                ),
                IconButton(
                  icon: Icon(Icons.add,color: Colors.white),
                  onPressed: () => setState((){
                    title = choices[1];
                  }),
                ),
                IconButton(
                  icon: Icon(Icons.add,color: Colors.white),
                  onPressed: () => setState((){
                    title = choices[2];
                  }),
                ),
                IconButton(
                  icon: Icon(Icons.add,color: Colors.white),
                  onPressed: () => setState((){
                    title = choices[3];
                  }),
                ),
                IconButton(
                  icon: Icon(Icons.add,color: Colors.white),
                  onPressed: () => setState((){
                    title = choices[4];//64
                  }),
                ),
              ],
            );
          },
        );
      },
      tablet: (context){
        return Row(
          children: <Widget>[
            Expanded(
              child: Text(title),
            ),
            IconButton(
              icon: Icon(Icons.add,color: Colors.white),
              onPressed: () => setState((){
                title = choices[0];
              }),
            ),
            IconButton(
              icon: Icon(Icons.add,color: Colors.white),
              onPressed: () => setState((){
                title = choices[1];
              }),
            ),
            IconButton(
              icon: Icon(Icons.add,color: Colors.white),
              onPressed: () => setState((){
                title = choices[2];
              }),
            ),
            IconButton(//80
              icon: Icon(Icons.add,color: Colors.white),
              onPressed: () => setState((){
                title = choices[3];
              }),
            ),
            IconButton(
              icon: Icon(Icons.add,color: Colors.white),
              onPressed: () => setState((){
                title = choices[4];
              }),
            ),
          ],
        );
      },
    );
  }
}

