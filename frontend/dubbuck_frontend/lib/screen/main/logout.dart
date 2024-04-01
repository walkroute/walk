import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/user_profile_provider.dart';
import '../login/login_screen.dart';

void logout(BuildContext context) async {
  // UserProfileProvider의 logout 메소드 호출
  await Provider.of<UserProfileProvider>(context, listen: false).logout();

  // 로그인 화면으로 사용자를 리다이렉트
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false,
  );
}
