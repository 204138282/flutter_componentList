import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/User.dart';
import 'package:flutter/services.dart';

class MyHttp extends StatefulWidget {
  final String title;
  MyHttp(this.title);

  @override
  MyHttpState createState() => new MyHttpState(title);
}

class MyHttpState extends State<MyHttp> {
  String title;
  MyHttpState(this.title);
  User user;

  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    httpGet('204138282');
    controller.text = '204138282';
  }

  void httpGet(String userName) {
    print('请求开始');
    http.get('https://api.github.com/users/$userName')  //flyou
    .then((response) {
      var body = response.body;
      setState(() {
        final responseJson = json.decode(body);
        user = new User.fromJson(responseJson);
        print('http-response-name:' + (user != null && user.name!=null?user.name:''));
      });
    })
    .catchError((error) {
      print('请求出错:' + error.toString());
    })
    .whenComplete(() {
      print('请求完成');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: new SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new Container(
              child: Image.network(user != null ? user.avatar_url : 'https://avatars2.githubusercontent.com/u/19224458?v=4', width: 50.0, height: 50.0),
            ),
            new TextField(
              decoration: InputDecoration(labelText: "请输入你的github用户名"),
              controller: controller,
            ),
            new RaisedButton(
              onPressed: () {
                httpGet(controller.text.toString());
              },
              child: Text('Http-get'),
              color: Colors.blue,
            ),
            new ListTile(
              leading: new Icon(Icons.person),
              title: new Text('name:'),
              subtitle: Text(user != null && user.name != null ? user.name : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.location_city),
              title: Text("location:"),
              subtitle: Text(user != null && user.location != null ? user.location : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
                leading: Icon(Icons.web),
                title: Text("blog:"),
                subtitle: Text(user != null && user.blog != null ? user.blog : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.http),
              title: Text("html_url:"),
              subtitle: Text(user != null && user.html_url != null ? user.html_url : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.data_usage),
              title: Text('id:'),
              subtitle: Text(user != null && user.id.toString() != null ? user.id.toString() : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.data_usage),
              title: Text('node_id:'),
              subtitle: Text(user != null && user.node_id != null ? user.node_id : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.sentiment_satisfied),
              title: Text('followers_url:'),
              subtitle: Text(user != null && user.followers_url != null ? user.followers_url: ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.sentiment_satisfied),
              title: Text('following_url:'),
              subtitle: Text(user != null && user.following_url != null ? user.following_url : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.sentiment_very_satisfied),
              title: Text('gists_url:'),
              subtitle: Text(user != null && user.gists_url != null ? user.gists_url: ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.sentiment_satisfied),
              title: Text('starred_url:'),
              subtitle: Text(user != null && user.starred_url != null ? user.starred_url : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.settings_backup_restore),
              title: Text('subscriptions_url:'),
              subtitle: Text(user != null && user.subscriptions_url != null ? user.subscriptions_url : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.control_point_duplicate),
              title: Text('organizations_url:'),
              subtitle: Text(user != null && user.organizations_url != null ? user.organizations_url : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.report),
              title: Text('repos_url:'),
              subtitle: Text(user != null && user.repos_url != null ? user.repos_url : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.event_note),
              title: Text('events_url:'),
              subtitle: Text(user != null && user.events_url != null ? user.events_url : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.receipt),
              title: Text('received_events_url:'),
              subtitle: Text(user != null && user.received_events_url != null ? user.received_events_url : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
            new ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('company:'),
              subtitle: Text(user != null && user.company != null ? user.company : ''),
            ),
            new Divider(color: Colors.grey,height: 1.0),
          ]
        ),
      )
    );
  }
}
