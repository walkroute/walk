import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageRepository {
  final List<String> _imageUrls = List.generate(
    // 아마존s3에서 가져올 사진
    40,
        (index) => 'https://picsum.photos/id/${index + 1}/200/300',
  );

  Future<String> getImageFilePath(String url) async {
    final file = await DefaultCacheManager().getSingleFile(url);
    return file.path;
  }

  List<String> get imageUrls => _imageUrls;
}

