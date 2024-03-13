import 'package:flutter/material.dart';
import 'image_repository.dart'; // 이미지 저장 및 로딩 로직이 구현된 클래스
import 'dart:io';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  CustomCachedNetworkImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: ImageRepository().getImageFilePath(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return Image.file(File(snapshot.data!)); // 로컬 파일로부터 이미지를 로드합니다.
        } else {
          return Center(child: CircularProgressIndicator()); // 이미지 로딩 중 표시
        }
      },
    );
  }
}
