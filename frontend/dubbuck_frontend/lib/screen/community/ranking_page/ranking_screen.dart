import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 여기에 랭킹 정보를 불러오는 로직을 구현합니다.
    return ListView.builder(
            itemCount: 20, // 예시 데이터의 수
            itemBuilder: (context, index) {
      return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
      title: Text('사용자 이름 $index'),
              subtitle: Text('추가 정보, 예: 사용자 점수'),
        );
    },
    );
  }
}
