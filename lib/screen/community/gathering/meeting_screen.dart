import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MeetingPage extends StatefulWidget {
  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  List<Map<String, String>> meetings = [];
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _loadMeetings();
  }

  void _loadMeetings() {
    // 모임 리스트를 랜덤하게 생성하는 로직
    List<Map<String, String>> newMeetings = List.generate(20, (index) {
      return {
        "name": "모임 ${Random().nextInt(100)}",
        "description": "설명 ${Random().nextInt(100)}"
      };
    });

    setState(() {
      meetings = newMeetings;
    });
  }

  void _onRefresh() async {
    // 모임 리스트를 새로 고치는 로직을 구현하세요.
    // 예를 들어, 모임 목록을 다시 불러오는 API 호출 등
    // 그 후, 다음을 호출하여 refresh controller를 리셋합니다:
    _loadMeetings(); // 모임 리스트를 새로 고치는 로직
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: meetings.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.group),
              title: Text(meetings[index]["name"]!),
              subtitle: Text(meetings[index]["description"]!),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
