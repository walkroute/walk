import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RegistrationButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        '회원가입',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
