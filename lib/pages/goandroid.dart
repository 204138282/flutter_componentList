import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class MyGoAndroid extends StatelessWidget {
  final String title;
  MyGoAndroid(this.title);

  static const platform = const MethodChannel("com.flyou.test/android");

  Future<String> getAndroidTime() async {
    var str;
    try {
      str = await platform.invokeMethod("getAndroidTime");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('$title')), 
      body: new Center(
        child: new Builder(builder: (BuildContext context) {
          return new RaisedButton(
            onPressed: () {
              getAndroidTime().then((str){
                Scaffold.of(context).showSnackBar(new SnackBar(content:Text(str!=null?str:"获取失败")));
              });
            },
            child: Text("点我获取Android平台数据"),
          );
        }),
      ),
    );
  }
}