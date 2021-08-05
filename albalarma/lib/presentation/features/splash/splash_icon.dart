import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  final image;
  double? imageSize;

  AppIconWidget({Key? key, this.image, this.imageSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //getting screen size
    var size = MediaQuery.of(context).size;

    //calculating container width
    // double imageSize;
    if (imageSize == null) {
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        imageSize = (size.width * 0.70);
      } else {
        imageSize = (size.height * 0.70);
      }
    }

    return Image.asset(
      image,
      height: imageSize,
    );
  }
}
