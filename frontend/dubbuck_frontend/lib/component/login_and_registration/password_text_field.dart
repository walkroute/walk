import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText; // 라벨 텍스트 추가
  final String hintText; // 힌트 텍스트 추가

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.labelText = '비밀번호', // 기본값 설정
    this.hintText = '비밀번호를 입력하세요.', // 기본값 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: labelText, // 동적으로 라벨 텍스트 사용
        hintText: hintText, // 동적으로 힌트 텍스트 사용
        border: OutlineInputBorder(),
      ),
    );
  }
}
