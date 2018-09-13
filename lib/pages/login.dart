import 'package:flutter/material.dart';
import 'dart:async';
import '../pages/home.dart';

class MyLogin extends StatefulWidget {
  final title;
  MyLogin(this.title);

  MyLoginState  createState() => new MyLoginState();
}

class MyLoginState extends State<MyLogin> with TickerProviderStateMixin{
  bool isLogin = false;

  void onLoginClick() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).push(
        new MaterialPageRoute<Null>(builder: (BuildContext context) {
          return new MyHome('Home');
        })
      );
      isLogin = false;
    });
    setState(() {
      isLogin = true;    
    });
  }

  @override
  void dispose() {
    super.dispose();
    isLogin = false;
  }


  @override
  Widget build(BuildContext context) {
    var loginButtonWidget;

    if (isLogin) {
      AnimationController animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
      Animation<Color> animation = new Tween(begin: Colors.white, end: Colors.black).animate(animationController);
      loginButtonWidget = CircularProgressIndicator(backgroundColor: Colors.white, valueColor: animation);

    } else {
      loginButtonWidget = Text('登录', style: TextStyle(color: Colors.white));
    }

    final logo = Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30.0,
        child: Image.network('https://avatars2.githubusercontent.com/u/19224458?v=4', width: 60.0, height: 60.0),
      ),
    );
    final userName = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '请输入用户名',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
      ),
    );
    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: '请输入密码',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
      ),
    );
    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Color(0xff2f3443),
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          color: Color(0xff2f3443),
          onPressed: onLoginClick,
          child: loginButtonWidget,
        ),
      ),
    );
    final forgotLabel = FlatButton(
      onPressed: (){},
      child: Text('忘记密码?', style: TextStyle(color: Colors.black45))
    );


    
    return new Scaffold(
      // appBar: AppBar(title: Text(widget.title)),
      backgroundColor: Colors.white,
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: const Alignment(0.0, -1.0),
            end: const Alignment(0.0, 0.6),
            colors: <Color>[const Color(0x00ef5350), const Color(0xff5662A6)],
          ),
        ),
        child: new Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),

              userName,
              SizedBox(height: 8.0),

              password,
              SizedBox(height: 24.0),

              loginButton,
              forgotLabel
            ]
          )
        ),
      )
    );
  }
}
