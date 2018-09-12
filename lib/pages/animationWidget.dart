import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class LogoFade extends StatefulWidget {
  final String title;
  LogoFade(this.title);

  @override
  createState() => new LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double animValue = 100.0;
  double opacityLevel = 0.0;
  bool _first = true;

  _changeValue() {
    setState(() => animValue = animValue == 0 ? 100.0 : 0.0);
  }

  _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  _changeOpacityCross() {
    setState(() => _first = _first == false ? true : false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: new Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            new Row(
              children: <Widget>[
                new AnimatedContainer(
                  curve: Curves.bounceOut,
                  duration: new Duration(seconds: 3),
                  child: new FlutterLogo(
                    size: 100.0,
                  ),
                  padding: EdgeInsets.only(bottom: animValue),
                ),
                SizedBox(
                  height: 30.0,
                ),
                new RaisedButton(
                  child: new Text('Container(平移)'),
                  onPressed: _changeValue,
                ),
              ],
            ),
            Divider(height: 2.0, color: Colors.black),
            //--------//

            new Row(
              children: <Widget>[
                new AnimatedOpacity(
                  duration: new Duration(seconds: 3),
                  child: new FlutterLogo(
                    size: 100.0,
                  ),
                  opacity: opacityLevel,
                  curve: Curves.linear,
                ),
                SizedBox(
                  height: 30.0,
                ),
                new RaisedButton(
                  child: new Text('ChangeOpacity(透明度)'),
                  onPressed: _changeOpacity,
                ),
              ],
            ),
            Divider(height: 2.0, color: Colors.black),
            //--------//
            
            new Row(children: <Widget>[
              new AnimatedCrossFade(
                duration: const Duration(seconds: 3),
                firstChild: const FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 100.0),
                secondChild: const FlutterLogo(
                    style: FlutterLogoStyle.stacked, size: 200.0),
                crossFadeState: _first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              SizedBox(
                height: 30.0,
              ),
              new RaisedButton(
                child: new Text('CrossFade(渐变)'),
                onPressed: _changeOpacityCross,
              ),
            ])
          ],
        )
      )
    );
  }
}
