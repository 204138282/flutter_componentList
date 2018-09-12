import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class MyCurvedAnimation extends StatefulWidget {
  final String title;
  MyCurvedAnimation(this.title);

  MyCurvedAnimationState createState() => new MyCurvedAnimationState();
}

class MyCurvedAnimationState extends State<MyCurvedAnimation> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    final CurvedAnimation curve = new CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curve);
  }
  
  void onAnimationStart() {
    controller.forward(from: 0.0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          onAnimationStart();
        },
        child: Text('Start')
      ),
      body: new GrowTransition(child: new LogoWidget(), animation: animation)
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
              height: animation.value, width: animation.value, child: child);
        },
        child: child
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
  }
}