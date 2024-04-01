import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onValidated; // 유효성 검사 후 실행될 콜백

  const LoginButton({Key? key, this.onValidated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('로그인'),
      onPressed: onValidated, // 유효성 검사 콜백 사용
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
