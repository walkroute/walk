import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onValidated;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.buttonText, // 버튼 텍스트 동적으로 받음
    this.onValidated,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        buttonText, // 동적으로 전달된 텍스트 사용
        style: TextStyle(color: textColor),
      ),
      onPressed: onValidated,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, // 텍스트 색상
        backgroundColor: backgroundColor, // 배경 색상
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // 모서리 둥글게
        ),
        padding: EdgeInsets.symmetric(vertical: 12), // 버튼 내부 패딩
      ),
    );
  }
}
