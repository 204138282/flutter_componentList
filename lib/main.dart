import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/login.dart';

void main() => runApp(new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: new MyApp(),
      home: new MyLogin('Login'),
    ));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new RaisedButton(
            onPressed: () {
              Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                return new MyHome('Home');
              }));
            },
            child: Text('Go Home')
        )
      )
    );
  }
}