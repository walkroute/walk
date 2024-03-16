import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'custom_cached_network_image.dart';
import 'like_button_model.dart';

class ImageDetailPage extends StatefulWidget {
  final List<String> imageUrls;
  final int initialPage;

  ImageDetailPage({required this.imageUrls, required this.initialPage});

  @override
  _ImageDetailPageState createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.8;
    final double imageHeight = MediaQuery.of(context).size.height * 0.6;

    return ChangeNotifierProvider<LikeButtonModel>(
      create: (_) => LikeButtonModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('사진'),
          centerTitle: true, // 제목을 AppBar의 중앙에 배치합니다.
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[ // AppBar의 제목이 중앙에 오도록 빈 공간을 추가합니다.
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.transparent),
              onPressed: null,
            ),
          ],
        ),
        body: Center(
          child: CarouselSlider.builder(
            itemCount: widget.imageUrls.length,
            options: CarouselOptions(
              initialPage: widget.initialPage,
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                width: imageWidth,
                height: imageHeight,
                child: Hero(
                  tag: 'photo$index',
                  child: CustomCachedNetworkImage(imageUrl: widget.imageUrls[index]),
                ),
              );
            },
          ),
        ),
        floatingActionButton: Consumer<LikeButtonModel>(
          builder: (context, likeButtonModel, child) {
            return FloatingActionButton(
              onPressed: () {
                likeButtonModel.toggleLike();
              },
              child: Icon(
                likeButtonModel.isLiked ? Icons.favorite : Icons.favorite_border,
                color: likeButtonModel.isLiked ? Colors.red : Colors.black,
              ),
              backgroundColor: Colors.white,
            );
          },
        ),
      ),
    );
  }
}