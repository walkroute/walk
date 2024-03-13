import 'package:flutter/material.dart';
import 'package:dubbuck_ver2/splash/splashFirst.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '뚜벅뚜벅',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // 첫 번째로 보여질 스플래시 화면
    );
  }
}
