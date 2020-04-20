import 'package:bachelorproef/generated/i18n.dart';
import 'package:bachelorproef/viewmodel/animationViewModel.dart';
import 'package:bachelorproef/widgets/navigatorKeyProviderWidget.dart';
import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with TickerProviderStateMixin {
  _AnimationWidgetState();
  
  final viewModel = AnimationViewModel();
  
  AnimationController _colorController;
  AnimationController _colorTextTogetherController;
  AnimationController _colorTextSequenceController;
  AnimationController _colorTextDelayedController;

  Animation<Color> colorAnim;
  Animation<Color> colorAnim2;
  Animation<double> textSizeAnim2;
  Animation<Color> colorAnim3;
  Animation<double> textSizeAnim3;
  Animation<Color> colorAnim4;
  Animation<double> textSizeAnim4;
  
  @override
  void initState() {
    super.initState();
    _colorController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _colorTextTogetherController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _colorTextSequenceController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _colorTextDelayedController = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    colorAnim = ColorTween(begin: Colors.black, end: Colors.green).animate(_colorController);
    colorAnim2 = ColorTween(begin: Colors.black,end: Colors.green).animate(
        CurvedAnimation(
          parent: _colorTextTogetherController,
          curve: Interval(0.0,1.0,curve: Curves.ease),
        )
    );
    textSizeAnim2 = Tween(begin: 12.0,end: 24.0).animate(
        CurvedAnimation(
          parent: _colorTextTogetherController,
          curve: Interval(0.0,1.0,curve: Curves.ease),
        )
    );
    colorAnim3 = ColorTween(begin: Colors.black,end: Colors.green).animate(
        CurvedAnimation(
          parent: _colorTextSequenceController,
          curve: Interval(0.0,0.5,curve: Curves.ease),
        )
    );
    textSizeAnim3 = Tween(begin: 12.0,end: 24.0).animate(
        CurvedAnimation(
          parent: _colorTextSequenceController,
          curve: Interval(0.5,1.0,curve: Curves.ease),
        )
    );
    colorAnim4 = ColorTween(begin: Colors.black,end: Colors.green).animate(
        CurvedAnimation(
          parent: _colorTextDelayedController,
          curve: Interval(0.0,1.0,curve: Curves.ease),
        )
    );
    textSizeAnim4 = Tween(begin: 12.0,end: 24.0).animate(
        CurvedAnimation(
          parent: _colorTextDelayedController,
          curve: Interval(0.6,1.0,curve: Curves.ease),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).animation)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  NavigatorKeyProviderWidget.of(context).rootNavigator.currentState.push(MaterialPageRoute(
                      builder: (_) => SharedElementTransitionDestination()
                  ));
                },
                child: Hero(
                  tag: "textHero",
                  child: Material(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue
                      ),
                    ),
                  ),
                ),
              )
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: colorAnim,
                        builder: (context,child){
                          return Text(S.of(context).animate_color,style: TextStyle(color: colorAnim.value));
                        },
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          viewModel.colorBtnClicked ? S.of(context).animate_button_reset : S.of(context).animate_button_forward,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => setState(() => onColorAnimate()),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _colorTextTogetherController,
                        builder: (context,child){
                          return Text(S.of(context).animate_colorSize_together,style: TextStyle(color: colorAnim2.value,fontSize: textSizeAnim2.value));
                        },
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          viewModel.colorAndTextTogetherClicked ? S.of(context).animate_button_reset : S.of(context).animate_button_forward,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => setState(() => onColorAndTextTogetherAnimate()),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _colorTextSequenceController,
                        builder: (context,child){
                          return Text(S.of(context).animate_colorSize_sequence,style: TextStyle(color: colorAnim3.value,fontSize: textSizeAnim3.value));
                        },
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          viewModel.colorAndTextSequenceClicked ? S.of(context).animate_button_reset : S.of(context).animate_button_forward,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => setState(() => onColorAndTextSequenceAnimate()),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _colorTextDelayedController,
                        builder: (context,child){
                          return Text(S.of(context).animate_colorSize_delay,style: TextStyle(color: colorAnim4.value,fontSize: textSizeAnim4.value));
                        },
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          viewModel.colorAndTextDelayedClicked ? S.of(context).animate_button_reset : S.of(context).animate_button_forward,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => setState(() => onColorAndTextDelayedAnimate()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  void onColorAnimate(){
    if(viewModel.colorBtnClicked){
      _colorController.reset();
    }else{
      _colorController.forward();
    }
    viewModel.onColorBtnClicked();
  }

  void onColorAndTextTogetherAnimate(){
    if(viewModel.colorAndTextTogetherClicked){
      _colorTextTogetherController.reset();
    }else{
      _colorTextTogetherController.forward();
    }
    viewModel.onColorAndTextTogetherBtnClicked();
  }

  void onColorAndTextSequenceAnimate(){
    if(viewModel.colorAndTextSequenceClicked){
      _colorTextSequenceController.reset();
    }else{
      _colorTextSequenceController.forward();
    }
    viewModel.onColorAndTextSequenceBtnClicked();
  }

  void onColorAndTextDelayedAnimate(){
    if(viewModel.colorAndTextDelayedClicked){
      _colorTextDelayedController.reset();
    }else{
      _colorTextDelayedController.forward();
    }
    viewModel.onColorAndTextDelayedClicked();
  }

  @override
  void dispose() {
    _colorController.dispose();
    _colorTextTogetherController.dispose();
    _colorTextSequenceController.dispose();
    _colorTextDelayedController.dispose();
    super.dispose();
  }
}

class SharedElementTransitionDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).animation)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: "textHero",
                  child: Material(
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue
                      ),
                    ),
                  )
                ),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(S.of(context).go_back,style: TextStyle(color: Colors.white)),
                onPressed: (){
                  NavigatorKeyProviderWidget.of(context).rootNavigator.currentState.pop();
                },
              )
            ],
          ),
        ),
    );
  }
}

