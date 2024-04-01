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
    // 모임(채팅방) 리스트를 랜덤하게 생성하는 로직
    List<Map<String, String>> newMeetings = List.generate(20, (index) {
      return {
        "name": "채팅방 ${Random().nextInt(100)}",
        "description": "설명 ${Random().nextInt(100)}"
      };
    });

    setState(() {
      meetings = newMeetings;
    });
  }

  void _onRefresh() async {
    // 모임(채팅방) 리스트를 새로 고치는 로직
    _loadMeetings(); // 모임 리스트를 새로 고치는 로직
    _refreshController.refreshCompleted();
  }

  void _navigateToChatRoom(Map<String, String> meeting) {
    // 채팅방으로 이동하는 로직
    // Flutter Navigator를 사용하여 채팅방 페이지로 이동합니다.
    // 이 부분에서 실제 채팅방 화면으로 이동하는 코드를 추가합니다.
    // 예: Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomScreen(meeting: meeting)));
    print("채팅방으로 이동: ${meeting['name']}");
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
              onTap: () => _navigateToChatRoom(meetings[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 새로운 채팅방 생성 로직
          // 여기서 새로운 채팅방을 만드는 화면으로 이동하거나 직접 채팅방을 생성하는 로직을 추가합니다.
          print("새 채팅방 생성");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
