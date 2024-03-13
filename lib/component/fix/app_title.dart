import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String titleText;
  const AppTitle({
    Key? key,
    this.titleText = '뚜벅뚜벅',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        titleText,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
