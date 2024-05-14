import 'dart:async';
import 'package:flutter/material.dart';
import '../../../repository/image_repository.dart';
import 'custom_cached_network_image.dart';
import 'image_detail_page.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final List<String> _imageUrls = ImageRepository().imageUrls;
  final ScrollController _scrollController = ScrollController();

  Future<void> _refreshImages() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshImages,
      child: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: _imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return FutureBuilder<String>(
            future: ImageRepository().getImageFilePath(_imageUrls[index]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                // 로컬 파일 경로가 준비되었을 때 이미지를 표시합니다.
                return GestureDetector(
                  onTap: () {
                    // 이미지 상세 페이지로 이동합니다.
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ImageDetailPage(imageUrls: _imageUrls, initialPage: index),
                    ));
                  },
                  child: Hero(
                    tag: 'photo$index',
                    child: CustomCachedNetworkImage(imageUrl: snapshot.data!), // 로컬 파일 경로를 사용
                  ),
                );
              } else {
                // 데이터 로딩 중 표시
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
