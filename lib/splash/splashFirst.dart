import 'dart:async';

import 'package:flutter/material.dart';
import '../screen/login/login_screen.dart';
import '../repository/image_repository.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheImages();
    });
    _timer = Timer(Duration(seconds: 10), _goToSignUp);
  }

  void _goToSignUp() {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  void _precacheImages() {
    final List<String> imageUrls = ImageRepository().imageUrls;
    for (String url in imageUrls) {
      precacheImage(NetworkImage(url), context);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: _goToSignUp, // 화면을 탭했을 때 메서드를 실행합니다.
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/브로콜리뚜벅.gif'), fit: BoxFit.contain),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                width: width,
                height: height,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
