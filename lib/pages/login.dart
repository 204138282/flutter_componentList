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
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  void onTextClear() {
    setState(() {
      _userNameController.text = '';
      _passwordController.text = '';           
    });
  }

  void onLoginClick(ctx) {
    
    String username = _userNameController.text.toString();
    String password = _passwordController.text.toString();
    setState(() {
      isLogin = true;    
    });
    Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLogin = false;    
        });
    });

    if (username == 'xiaoLoo' && password == '12345678') {
      Scaffold.of(ctx).showSnackBar(
        new SnackBar(
          content: new Text('登录成功!', textAlign: TextAlign.center),
          duration: Duration(milliseconds: 1000),
        )
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(ctx).push(
          new MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new MyHome('Home');
          })
        );

        onTextClear();
      });

    } else if (username == '' || password == '') {
        Scaffold.of(ctx).showSnackBar(
          new SnackBar(
            content: new Text('用户名/密码不能为空!', textAlign: TextAlign.center),
            duration: Duration(milliseconds: 2000),
          )
        );
    } else {
      Scaffold.of(ctx).showSnackBar(
        new SnackBar(
          content: new Text('登录失败,用户名/密码有误!', textAlign: TextAlign.center),
          duration: Duration(milliseconds: 2000),
        )
      );
      onTextClear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    setState(() {
      isLogin = false;    
    });
  }


  @override
  Widget build(BuildContext context) {
    var loginButtonWidget;

    if (isLogin) {
      AnimationController animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
      Animation<Color> animation = new Tween(begin: Colors.white, end: Colors.black).animate(animationController);
      loginButtonWidget = new Container(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(backgroundColor:  Color(0xff2f3443), valueColor: animation, strokeWidth: 4.0)
      );

    } else {
      loginButtonWidget = Text('登 录', style: TextStyle(color: Colors.green, fontSize: 18.0));
    }

    final logo = Hero(
      tag: 'hero',
      child: new Container(
        // decoration: BoxDecoration(shape: BoxShape.circle),
        child: new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 40.0,
          child: Image.asset('images/icon.png', width: 80.0, height: 80.0),
        ),
      )
    );
    final userName = TextFormField(
      controller: _userNameController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '请输入用户名',
        helperText: '注册时填写的名称(默认:xiaoLoo)',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
      ),
    );
    final password = TextFormField(
      controller: _passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: '请输入密码',
        helperText: '登录密码(默认:12345678)',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
      ),
    );
    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(),
      child: new Builder(builder: (BuildContext context){
        return Material(
          color: Color(0xff2f3443),
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Color(0xff2f3443),
          elevation: 5.0,
          child: MaterialButton(
            minWidth: 200.0,
            height: 42.0,
            onPressed: () { onLoginClick(context); },
            child: loginButtonWidget,
          ),
        );
      })
    );
    final forgotLabel = new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          padding: const EdgeInsets.only(left: 10.0),
          onPressed: (){},
          child: Text('忘记密码?', style: TextStyle(color: Colors.black45))
        )
      ],
    );
    
    return new Scaffold(
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
              SizedBox(height: 100.0),

              userName,
              SizedBox(height: 12.0),

              password,
              SizedBox(height: 30.0),

              loginButton,
              forgotLabel
            ]
          )
        ),
      )
    );
  }
}
