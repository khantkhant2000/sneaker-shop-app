import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      placeholder: (context, url) => Image.asset(
        "images/placeholder.png",
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) => Text('This is error $error'),
    );
  }
}
