import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  CustomCachedNetworkImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // imageUrl이 로컬 파일 경로인지 확인
    if (Uri.parse(imageUrl).isAbsolute) {
      // 원격 이미지 URL일 경우 CachedNetworkImage를 사용
      return CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(child: SpinKitFadingCircle(color: Colors.blue)),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      );
    } else {
      // 로컬 파일 경로일 경우 Image.file을 사용
      return Image.file(
        File(imageUrl),
        fit: BoxFit.cover,
      );
    }
  }
}
