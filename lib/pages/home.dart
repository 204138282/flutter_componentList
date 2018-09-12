import 'package:flutter/material.dart';
import 'package:flutter_routes_i/pages/login.dart';
import 'package:flutter_routes_i/pages/future.dart';
import '../pages/preference.dart';
import '../pages/pathProvider.dart';
import '../pages/sqlite.dart';
import '../pages/http.dart';
import '../pages/goandroid.dart';
import '../pages/tabbar.dart';
import '../pages/progressIndicator.dart';
import '../pages/refresh.dart';
import '../pages/animation.dart';
import '../pages/curvedAnimation.dart';
import '../pages/animationWidget.dart';

class MyHome extends StatefulWidget {
  final String title;
  MyHome(this.title);

  @override
  State<StatefulWidget> createState() {
    return new MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  final List<Item> list = [
    Item(Icons.router, '动态路由'),
    Item(Icons.time_to_leave, 'Future组件,异步任务'),
    Item(Icons.data_usage, 'Preferences存储'),
    Item(Icons.file_download, '文件存储(❗️实现异常,后续修正!))'),
    Item(Icons.file_upload, 'Sqlite存储'),
    Item(Icons.http, 'Http请求'),
    Item(Icons.android, '调用Android平台Toast(❗️实现异常,后续修正!)'),
    Item(Icons.tab, 'TabBar'),
    Item(Icons.blur_linear, 'MyProgressIndicator'),
    Item(Icons.refresh, 'RefreshIndicator'),
    Item(Icons.wifi_tethering, 'Animation'),
    Item(Icons.wb_sunny, 'MyCurvedAnimation'),
    Item(Icons.wb_cloudy, 'AnimationWidget')
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: new ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  onTap: () {
                    //Navigator.of(context).pushNamed('/page2');//[静态路由切换]
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                              
                      Widget temp;
                      if (index == 0) {
                        temp = new MyLogin(list[index].title);
                      } else if (index == 1) {
                        temp = new MyFuture(list[index].title);
                      } else if (index == 2) {
                        temp = new MyPreference(list[index].title);
                      } else if (index == 3) {
                        temp = new MyPathProvider(list[index].title);
                      } else if (index == 4) {
                        temp = new MySqlite(list[index].title);
                      } else if (index == 5) {
                        temp = new MyHttp(list[index].title);
                      } else if (index == 6) {
                        temp = new MyGoAndroid(list[index].title);
                      } else if (index == 7) {
                        temp = new MyTabBar(list[index].title);
                      } else if (index == 8) {
                        temp = new MyProgressIndicator(list[index].title);
                      } else if (index == 9) {
                        temp = new MyRefresh(list[index].title);
                      } else if (index == 10) {
                        temp = new MyAnimation(list[index].title);
                      } else if (index == 11) {
                        temp = new MyCurvedAnimation(list[index].title);
                      } else if (index == 12) {
                        temp = new LogoFade(list[index].title);
                      }
                      return temp;
                    }));
                  },
                  child: new Item(list[index].iconData, list[index].title));
            },
            itemCount: list.length));
  }
}

class Item extends StatelessWidget {
  final IconData iconData;
  final String title;
  Item(this.iconData, this.title);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new ListTile(leading: Icon(iconData), title: new Text(title)),
        new Divider(color: Colors.grey, height: 1.0)
      ],
    );
  }
}