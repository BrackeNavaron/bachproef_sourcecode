import 'package:bachelorproef/generated/i18n.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final List<String> items = <String>[
    "lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit",
    "lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit",
    "lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).lists)),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(itemCount: items.length,itemBuilder: (context,index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Text(items[index]),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(S.of(context).back_to_showcase, style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
