import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_lotoo/page/List/list_page.dart';
import 'package:thai_lotoo/page/lottery_detail_page.dart';
import 'package:thai_lotoo/utils/configs.dart';

import '../application.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // ..show(horizontalCenterOffset: -100, anchorOffset: 100);
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    final List<Widget> _children = [
      LotteryDetailPage(),
      LotteryListPage(),
    ];
    ScreenUtil.init(context, width: 750, height: 1334);
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.blue,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(AntIcons.schedule_outline),
            title: Text(Configs.latest),
          ),
          BottomNavigationBarItem(
            icon: Icon(AntIcons.database_outline),
            title: Text(Configs.list),
          ),
        ],
      ),
      body: _children[_currentIndex],
      appBar: AppBar(
        elevation: 0,
        title: Text(Configs.appname),
      ),
    );
  }
}
