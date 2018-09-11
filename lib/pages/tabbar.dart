import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  final String title;
  MyTabBar(this.title);

  @override
  MyTabBarState createState() => new MyTabBarState();
}

class MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            leading: new GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back)
            ),
            title: Text(widget.title),
            bottom: new TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.black,
              isScrollable: true, 
              tabs: choices.map((Choice choice){
                return new Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList()
            ),
          ),
          body: new TabBarView(
            children: choices.map((Choice choice) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new ChoiceCard(choice: choice),
              );
            }).toList()
          ),
        )
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}
const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_car),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALKKKKKKKKKK', icon: Icons.directions_walk)
];
class ChoiceCard extends StatelessWidget {
  final Choice choice;
  ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle)
          ]
        )
      ),
    );
  }
}