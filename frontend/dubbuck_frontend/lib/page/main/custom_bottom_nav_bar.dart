import 'package:flutter/material.dart';

import '../community/community_page.dart';
import '../chat/chat_home_page.dart';
import '../dubbuck/dubbuck_screen.dart';
import '../dubbuckDiary/diary_home_page.dart';
import '../seongkeum/seongkeum_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  Widget _navBarItem(IconData icon, String label, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => DubbuckPage()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => SeongkeumPage()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => DiraryHomePage()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatHomePage()));
            break;
          case 4:
            Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityPage()));
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _navBarItem(Icons.directions_run, '뚜벅뚜벅', 0, context),
          _navBarItem(Icons.hiking, '성큼성큼', 1, context),
          _navBarItem(Icons.photo_library, '기록', 2, context),
          _navBarItem(Icons.chat, '채팅', 3, context),
          _navBarItem(Icons.group, '커뮤니티', 4, context),
        ],
      ),
    );
  }
}
