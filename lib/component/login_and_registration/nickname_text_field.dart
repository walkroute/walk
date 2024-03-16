import 'package:flutter/material.dart';

class NicknameTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText; // 라벨 텍스트 추가
  final String hintText; // 힌트 텍스트 추가

  const NicknameTextField({
    Key? key,
    required this.controller,
    this.labelText = '별명', // 기본값 설정
    this.hintText = '2~10자 이내여야 합니다.', // 기본값 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText, // 동적으로 라벨 텍스트 사용
        hintText: hintText, // 동적으로 힌트 텍스트 사용
        border: OutlineInputBorder(),
      ),
    );
  }
}
