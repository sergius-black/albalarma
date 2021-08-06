import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  final image;
  final double imageSize;

  AppIconWidget({
    Key? key,
    this.image = "assets/paltabigote.png",
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: imageSize,
    );
  }
}
