import 'package:bachelorproef/generated/i18n.dart';
import 'package:bachelorproef/widgets/choiceGrid.dart';
import 'package:bachelorproef/widgets/settingsPage.dart';
import 'package:flutter/material.dart';

class Showcase extends StatefulWidget {
  @override
  _ShowcaseState createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {

  int _selectedPage = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          ChoiceGrid(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() => _selectedPage = index);
          _pageController.animateToPage(_selectedPage, duration: Duration(milliseconds: 200), curve: Curves.easeOut);
        },
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_module),
            title: Text(S.of(context).showcaseTab)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(S.of(context).settingsTab)
          ),
        ],
      ),
    );
  }
}
