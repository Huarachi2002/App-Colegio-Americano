import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String urlImage;

  CustomImageWidget(this.urlImage);

  @override
  Widget build(BuildContext context) {
    if (this.urlImage == null)
      return Image.asset(
        'assets/no_image.png',
        fit: BoxFit.scaleDown,
      );
    return CachedNetworkImage(
      imageUrl: urlImage,
      placeholder: (context, url) => Image.asset(
        'assets/no_image.png',
        fit: BoxFit.scaleDown,
        ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/no_image.png',
          fit: BoxFit.scaleDown,
          ),
    );
  }
}
