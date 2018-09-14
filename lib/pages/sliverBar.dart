import 'package:flutter/material.dart';

class MySliverBar extends StatefulWidget {
  final String title;
  MySliverBar(this.title);

  MySliverBarState createState() => new MySliverBarState();
}

class MySliverBarState extends State<MySliverBar> with TickerProviderStateMixin{
  List<ListItem> listData = [];

  @override
  build(BuildContext context) {
    TabController tabController = new TabController(length: choices.length, vsync: this);
    for(var i = 0; i < 20; i++) {
      listData.add(ListItem(title: '测试SliverAppBar-index=$i', iconData: Icons.play_circle_filled));
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title)
      // ),
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: new FlexibleSpaceBar(
                centerTitle: true,
                title: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 16.0)),
                background: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg', fit: BoxFit.fill),
              )
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: tabController,
                  // controller: new TabController(length: choices.length, vsync: this),
                  labelColor: Colors.lightBlue,
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: choices.map((ListItem item){
                    return new Tab(
                      text: item.title,
                      icon: Icon(item.iconData),
                    );
                  }).toList()
                  // <Widget>[
                  //   new Tab(icon: new Icon(Icons.wb_sunny), text: 'Sunny'),
                  //   new Tab(icon: new Icon(Icons.cloud_circle), text: 'Cloudy'),
                  // ],
                )
              ),
            )
          ];
        },
        body: new TabBarView(
          controller: tabController,
          // controller: new TabController(length: choices.length, vsync: this),
          children: choices.map((ListItem item){
            // return new Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: new ListItemWidget(listItem: item),
            // );
            String title = item.title;
            if (title == 'CAR') {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Center(
                  child: new Text('CCAARR', style: TextStyle(color: Colors.green, fontSize: 20.0)),
                )
              );
            } else if (title == 'Sunny') {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Image.asset('images/icon.png', width: 100.0, height: 100.0),
              );
            } else {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new ListItemWidget(listItem: item),
              );
            }
          }).toList()
        )
        // Center(
        //   child: new ListView.builder(
        //     itemCount: listData.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return new ListItemWidget(listData[index]);
        //     }
        //   )
        // ),
      )
    );
  }
}

class ListItem {
  final String title;
  final IconData iconData;
  const ListItem({this.title, this.iconData});
}
const List<ListItem> choices = const <ListItem>[
  const ListItem(title: 'CAR', iconData: Icons.directions_car),
  const ListItem(title: 'Sunny', iconData: Icons.wb_sunny),
  const ListItem(title: 'Cloudy', iconData: Icons.cloud_circle)
];
class ListItemWidget extends StatelessWidget {
  final ListItem listItem;
  ListItemWidget({Key key, this.listItem}) : super(key: key);

  @override
  build(BuildContext context) {
    return new InkWell(
      child: new ListTile(
        leading: new Icon(listItem.iconData),
        title: new Text(listItem.title)
      ),
      onTap: () {},
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}