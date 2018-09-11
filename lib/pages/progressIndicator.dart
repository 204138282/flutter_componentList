import 'package:flutter/material.dart';

class MyProgressIndicator extends StatefulWidget {
  final String title;
  MyProgressIndicator(this.title);

  @override
  MyProgressIndicatorState createState() => new MyProgressIndicatorState();
}

class MyProgressIndicatorState extends State<MyProgressIndicator> {
  double currentProgress = 0.2;
  double currentCirProgress = 0.2;

  @override
  Widget build(BuildContext context) {
    void changeProgress() {
      setState(() {
        currentProgress += 0.1;
        if (currentProgress >= 1.0) {
          currentProgress = 0.1;
        }
      });
    }

    void changeCirProgress() {
      setState(() {
        currentCirProgress += 0.1;
        if (currentCirProgress >= 1.0) {
          currentCirProgress = 0.1;
        }
      });
    }

    return new Scaffold(  
      appBar: AppBar(title: Text(widget.title)),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text('LinearProgressIndicato: ', style: TextStyle(fontSize: 20.0)),
            new LinearProgressIndicator(
              backgroundColor: Colors.grey,
              value: currentProgress
            ),
            new FloatingActionButton(
              child: Text('[+]'),
              onPressed: () {
                changeProgress();
              },
            ),
            new Divider(height: 2.0, color: Colors.black),

            new Text('CircularProgressIndicator: ', style: TextStyle(fontSize: 20.0)),
            new CircularProgressIndicator(
              strokeWidth: 10.0,
              backgroundColor: Colors.green,
              value: currentCirProgress,
            ),
            new RaisedButton(
                shape: new CircleBorder(
                  side: BorderSide.none,
                ),
                padding: const EdgeInsets.all(20.0),
                color: Colors.blue,
                child: Text('[++]', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  changeCirProgress();
                },
              ),         
          ]
        )
      ),
    );
  }
}