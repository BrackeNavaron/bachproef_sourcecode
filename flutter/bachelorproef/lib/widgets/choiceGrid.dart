import 'package:bachelorproef/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChoiceGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        "label": S.of(context).asyncWork,
        "destination":"asyncRoute",
        "image": Icons.hourglass_full
      },
      {
        "label": S.of(context).navigation,
        "destination":"navigationRoute",
        "image": Icons.navigation
      },
      {
        "label": S.of(context).lists,
        "destination":"listRoute",
        "image": Icons.format_list_numbered
      },
      {
        "label": S.of(context).pagers,
        "destination":"pagerRoute",
        "image": Icons.view_carousel
      },
      {
        "label": S.of(context).animation,
        "destination":"animationRoute",
        "image": Icons.transform
      },
      {
        "label": S.of(context).permissions,
        "destination":"permissionsRoute",
        "image": Icons.screen_lock_portrait
      },
      {
        "label": S.of(context).forms,
        "destination":"formsRoute",
        "image": Icons.create
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: AppBarContent(),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (context){
          return OrientationLayoutBuilder(
            portrait: (context){
              return _buildOptionsGrid(context, choices, 2);
            },
            landscape: (context){
              return _buildOptionsGrid(context, choices, 3);
            },
          );
        },
        tablet: (context){
          return OrientationLayoutBuilder(
            portrait: (context){
              return _buildOptionsGrid(context, choices, 3);
            },
            landscape: (context){
              return _buildOptionsGrid(context, choices, 4);
            },
          );
        },
      ),
    );
  }
  
  Widget _buildOptionsGrid(BuildContext context,List<Map<String,dynamic>> choices,int crossAxisCount){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount),
        itemCount: choices.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              //TODO navigate to the item tab
            },
            child: SizedBox(
              width: 150,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(choices[index]["image"],color: Colors.black,size: 50),
                      SizedBox(height: 20),
                      Text(choices[index]["label"],style: TextStyle(color: Colors.black,fontSize: 18))
                    ],
                  ),
                ),
              ),
            ),
          );
        }
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