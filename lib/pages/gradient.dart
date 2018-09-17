import 'package:flutter/material.dart';

class MyGradient extends StatefulWidget {
  final String title;
  MyGradient({this.title});

  State<StatefulWidget> createState() {
    return new MyGradientState();
  }
}

class MyGradientState extends State<MyGradient> {
  List<Widget> list = [
    new VGradient(),
    new HGradient(),
    new CCircleRadius(),
    new SShadow(),
    new CCircleSquare(),
    new TTextDo()
  ];
  
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: new ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return list[index];
        },       
      )
    );
  }
}

class VGradient extends StatelessWidget {
  @override
  build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Text(
            "-  垂直渐变色\n~~~",
            style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: const Alignment(0.0, -1.0),
              end: const Alignment(0.0, 0.6),
              colors: <Color>[const Color(0x00ef5350), const Color(0xff5662A6)],
            ),
            border: new Border.all(color: Colors.grey),
            borderRadius: new BorderRadius.all(const Radius.circular(10.0))
          )
        ),
      ),
      // width: 320.0,
      height: 160.0,
      color: Colors.grey[300],
    );
  }
}

class HGradient extends StatelessWidget {
  @override
  build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Text(
            "-  水平渐变色\n~~~",
            style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: const Alignment(-1.0, 0.0),
              end: const Alignment(0.6, 0.0),
              colors: <Color>[const Color(0x00ef5350), const Color(0xff5662A6)],
            ),
            border: new Border.all(color: Colors.grey),
            borderRadius: new BorderRadius.all(const Radius.circular(10.0))
          )
        ),
      ),
      height: 160.0,
      color: Colors.grey[200],
    );
  }
}

class CCircleRadius extends StatelessWidget {
  @override
  build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Container(
          width: 100.0, height: 100.0,
          child: new Text('设置圆角',
            style: new TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 24.0
            ),
            textAlign: TextAlign.center,
            textScaleFactor: 1.0,
          ),
          decoration: BoxDecoration(
            color: Color(0xff5662A6),
            borderRadius: new BorderRadius.all(const Radius.circular(50.0))
          ),
          padding: new EdgeInsets.all(16.0),
        )
      ),
      height: 160.0,
      color: Colors.grey[300],
    );
  }
}

class SShadow extends StatelessWidget {
  @override
  build(BuildContext context) {
    return new Container(
      child: new Center(
        child: Container(
          child: new Text('阴影',
            style: new TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 24.0)
          ),
          decoration: BoxDecoration(color: Color(0xff5662A6), boxShadow: <BoxShadow>[
            new BoxShadow(
              color: const Color(0xcc0A0A0A),
              offset: new Offset(10.0, 0.0),
              blurRadius: 5.0),
            new BoxShadow(
              color: Colors.red,
              offset: new Offset(0.0, 10.0),
              blurRadius: 0.0)
          ]),
          padding: new EdgeInsets.all(16.0),
        )
      ),
      height: 160.0,
      color: Colors.grey[200],
      // decoration: BoxDecoration(color: Colors.grey[200]),
      // margin: new EdgeInsets.only(bottom: 16.0),
    );
  }
}

class CCircleSquare extends StatelessWidget {
  @override
  build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Container(
          child: new Text('圆/方',
            style: new TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(color: Color(0xff5662A6), shape: BoxShape.circle),
          padding: new EdgeInsets.all(16.0),
          width: 120.0,
          height: 120.0,
        )),
      height: 160.0,
      color: Colors.grey[300],
    );
  }
}

class TTextDo extends StatelessWidget {
  String excString = '❗️由于此class为无状态组件,暂时刷新转换效果只能重新编译程序!(后续再修改优化)\nGood Good Study, Day Day up!';

  void exc(tag) {
    if (tag == 'low') {
      // setState() {
        excString = excString.toLowerCase();
      // }
    } else if (tag == 'up') {
      // setState() {
        excString = excString.toUpperCase();
      // }
    }
  } 

  @override
  build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Container(
          child: new Column(
            children: <Widget>[
              // new Expanded(
                new Text(
                  excString,
                  style: new TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4.0,
                  ),
                ),
              // ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new RaisedButton.icon(
                    icon: Icon(Icons.touch_app),
                    label: Text('(大→小)转换'),
                    onPressed: () { 
                      exc('low'); 
                    }
                  ),
                  new RaisedButton.icon(
                    icon: Icon(Icons.touch_app),
                    label: Text('(小→大)转换'),
                    onPressed: () { 
                      exc('up'); 
                    }
                  )
                ],
              ),
            ],
          ),
          padding: new EdgeInsets.all(16.0),
        ),
      ),
      color: Colors.grey[200],
    );
  }
}
