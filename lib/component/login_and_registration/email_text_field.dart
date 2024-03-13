import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText; // 라벨 텍스트 추가
  final String hintText; // 힌트 텍스트 추가

  const EmailTextField({
    Key? key,
    required this.controller,
    this.labelText = '이메일', // 기본값 설정
    this.hintText = '이메일을 입력하세요.', // 기본값 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: labelText, // 동적으로 라벨 텍스트 사용
        hintText: hintText, // 동적으로 힌트 텍스트 사용
        border: OutlineInputBorder(),
      ),
    );
  }
}
