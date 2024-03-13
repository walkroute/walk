import 'package:flutter/material.dart';

import '../../screen/calender/calendar_screen.dart';
import '../../screen/community/community_screen.dart';
import '../../screen/dubbuck/dubbuck_screen.dart';
import '../../screen/dubbuckDiary/diary_screen.dart';
import '../../screen/seongkeum/seongkeum_screen.dart';

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => DiaryPage()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage()));
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
          _navBarItem(Icons.photo_library, '뚜벅기록', 2, context),
          _navBarItem(Icons.calendar_today, '캘린더', 3, context),
          _navBarItem(Icons.group, '커뮤니티', 4, context),
        ],
      ),
    );
  }
}
