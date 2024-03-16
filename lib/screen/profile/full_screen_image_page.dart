import 'package:flutter/material.dart';

class FullScreenImagePage extends StatelessWidget {
  final ImageProvider imageProvider;

  const FullScreenImagePage({Key? key, required this.imageProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: Hero(
            tag: 'profileImage',
            child: Image(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
