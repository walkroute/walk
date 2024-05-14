import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LogPage extends StatelessWidget {
  final List<String> imageUrls;
  final int initialPage;

  LogPage({required this.imageUrls, required this.initialPage});

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.8;
    final double imageHeight = MediaQuery.of(context).size.height * 0.6;

    return Scaffold(
      appBar: AppBar(
        leading: Container(), // 뒤로 가기 버튼을 없앱니다.
        title: Container(), // '기록' 텍스트를 비웁니다.
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.transparent),
            onPressed: null,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: imageUrls.length,
              options: CarouselOptions(
                initialPage: initialPage,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
              ),
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: imageWidth,
                  height: imageHeight,
                  child: Hero(
                    tag: 'photo$index',
                    child: Image.network(imageUrls[index]),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              '사진에 대한 정보를 여기에 표시해주세요.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // 다른 사진 정보 위젯들을 여기에 추가할 수 있습니다.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 원하는 기능을 추가합니다.
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
