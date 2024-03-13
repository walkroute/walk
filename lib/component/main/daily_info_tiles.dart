import 'package:flutter/material.dart';

class DailyInfoTiles extends StatelessWidget {
  const DailyInfoTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          leading: Icon(Icons.directions_walk),
          title: Text('하루 거리'),
          trailing: Text('5km'),
        ),
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text('총 시간'),
          trailing: Text('1시간'),
        ),
        ListTile(
          leading: Icon(Icons.map),
          title: Text('총 거리'),
          trailing: Text('5km'),
        ),
      ],
    );
  }
}