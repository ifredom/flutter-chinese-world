import 'package:flutter/material.dart';
import 'package:fluttermono/language/i18n.dart';
import 'package:fluttermono/pages/elegant/tabs/first.dart';

class _Page {
  final String labelId;
  final int labelIndex;

  _Page(this.labelId, this.labelIndex);
}

DefaultTabController _defaultController;
TabController _tabController;

List<Tab> myTabs = <Tab>[
  new Tab(text: '早午茶'),
  new Tab(text: '历史'),
  new Tab(text: '历史2'),
];
List<Widget> myTabsBody = <Widget>[
  BarLoadingScreen(),
  Text('历史'),
  Text('历史2'),
];

class ElegantPage extends StatelessWidget {
  ElegantPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return NewsPage();
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).elegantPageTitle),
          bottom: TabBar(
            // isScrollable: true,
            tabs: myTabs,
          ),
          actions: <Widget>[
            //导航栏右侧菜单
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
          ],
        ),
        body: new TabBarView(
          children: myTabsBody.map((Widget item) {
            return item;
          }).toList(),
        ),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'NewsPage',
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('HistoryPage');
  }
}
