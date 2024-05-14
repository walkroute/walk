import 'package:flutter/material.dart';
import 'package:dubbuck_front/screen/dubbuckDiary/calendar_page.dart';
import '../community/picture/photo_page.dart';
import 'log_page.dart';

class DiraryHomePage extends StatefulWidget {
  @override
  _DiraryHomePageState createState() => _DiraryHomePageState();
}

class _DiraryHomePageState extends State<DiraryHomePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('뚜벅기록'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '일지'),
            Tab(text: '캘린더'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          LogPage(imageUrls: [], initialPage: 0), // '기록' 탭에는 LogPage를 표시하고 imageUrls를 빈 배열로 전달합니다.
          CalendarPage(),
        ],
      ),
    );
  }
}
