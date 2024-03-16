import 'package:flutter/material.dart';
import 'picture/photo_screen.dart';
import 'gathering/meeting_screen.dart';
import 'ranking_page/ranking_screen.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0); // "사진" 탭이 기본 탭으로 설정됩니다.
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
        title: Text('커뮤니티'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '사진'),
            Tab(text: '모임'),
            Tab(text: '랭킹'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PhotoPage(),
          MeetingPage(),
          RankingPage(),
        ],
      ),
    );
  }
}
