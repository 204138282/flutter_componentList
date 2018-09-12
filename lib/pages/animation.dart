import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MyAnimation extends StatefulWidget {
  final String title;
  MyAnimation(this.title);

  @override
  MyAnimationState createState() => new MyAnimationState();
}

class MyAnimationState extends State<MyAnimation> with SingleTickerProviderStateMixin {
  Animation<double> doubleAnimation;
  double numberAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000)
    );
    
    doubleAnimation = new Tween(begin: 0.0, end: 100.0).animate(animationController)..addListener(() { 
      setState(() {
        //监听'值'改变        
        numberAnimation = doubleAnimation.value.toDouble();      
      });
      print(numberAnimation); 
    })
    ..addStatusListener((AnimationStatus status) {
      //监听'状态'改变
      if (status == AnimationStatus.forward) {
        print('动画开始');
      } else if (status == AnimationStatus.completed) {
        print('动画结束');
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        print('动画消失');
        animationController.forward();
      } 
    });
  }

  onAnimationStart() {
    animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          onAnimationStart();
        },
        child: AnimationText(animation: doubleAnimation)
      ),
      body: new Center(
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: numberAnimation,
          width: numberAnimation,
          child: new Icon(Icons.home, size: numberAnimation)
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}

class AnimationText extends AnimatedWidget {
  AnimationText({Key key, Animation<double> animation}) : super(key:key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Text(animation.value.toInt().toString());
  }
}