import 'package:bachelorproef/generated/i18n.dart';
import 'package:flutter/material.dart';

class PagerWidget extends StatefulWidget {
  @override
  _PagerWidgetState createState() => _PagerWidgetState();
}

class _PagerWidgetState extends State<PagerWidget> {
  int currentPage = 0;
  PageController pageController;
  final List<int> pages = [1,2,3];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    pageController = PageController(
        initialPage: currentPage,
        viewportFraction: isPortrait ? 0.5 : 1/3
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pagers),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (page) => setState(() => currentPage = page),
              itemBuilder: (context,index){
                return AnimatedBuilder(
                  animation: pageController,
                  child: buildItem(context, "${pages[index]}"),
                  builder: (context,child){
                    double value = (index == currentPage ? 1.0 : 0.5);
                    if (pageController.position.haveDimensions) {
                      value = (1 - ((pageController.page - index).abs() * .5)).clamp(0.0, 1.0);
                    }else {
                      value = (index == currentPage ? 1.0 : 0.5);
                    }
                    final curveValue = Curves.easeOut.transform(value);
                    return Center(
                      child: SizedBox(
                        height: (isPortrait) ? curveValue * 300 : curveValue * 200,
                        width: (isPortrait) ? curveValue * 300 : curveValue * 200,
                        child: child,
                      ),
                    );
                  },
                );
              },
              itemCount: pages.length,
            ),
          ),
        ],
      )
    );
  }

  Widget buildItem(BuildContext context,String item){
    return SizedBox(
      width: 300,
      height: 300,
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(item,style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
