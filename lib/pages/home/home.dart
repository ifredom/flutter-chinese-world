import 'package:flutter/material.dart';
import 'package:fluttermono/pages/home/drawer.dart';
import 'package:fluttermono/pages/elegant/index.dart';
import 'package:fluttermono/pages/song/index.dart';
import 'package:fluttermono/pages/wind/index.dart';
import 'package:fluttermono/tools/style/colorUtils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _tabs = [];
  List<Widget> _widgetList = List();

  void _initTabsData() {
    List tabData = [
      {'text': Text('风'), 'icon': Icon(Icons.insert_comment)},
      {'text': Text('颂'), 'icon': Icon(Icons.memory)},
      {'text': Text('雅'), 'icon': Icon(Icons.memory)},
      //https://flutter-go.pub/api/isInfoOpen
    ];
    for (int i = 0; i < tabData.length; i++) {
      _tabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: tabData[i]['text'],
      ));
    }
    _widgetList..add(WindPage())..add(SongPage())..add(ElegantPage());
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onAdd() {}

  @override
  void initState() {
    super.initState();
    _initTabsData();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _widgetList,
      ),
      drawer: new MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs,
        currentIndex: _currentIndex,
        backgroundColor: HexToColor('#232427'),
        selectedItemColor: HexToColor('#FFFFFF'),
        unselectedItemColor: HexToColor('#c1c2c1'),
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        //悬浮按钮
        child: Icon(Icons.book),
        onPressed: _onAdd,
        backgroundColor: HexToColor('#232427'),
        foregroundColor: HexToColor('#FFFFFF'),
        hoverColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
