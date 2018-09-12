import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  final name;
  MyLogin(this.name);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('$name')),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: const Alignment(0.0, -1.0),
            end: const Alignment(0.0, 0.6),
            colors: <Color>[const Color(0x00ef5350), const Color(0xff5662A6)],
          ),
        ),
      )
    );
  }
}
