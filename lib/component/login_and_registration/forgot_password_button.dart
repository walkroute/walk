import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ForgotPasswordButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        '비밀번호 찾기',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
