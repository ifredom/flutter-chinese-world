import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermono/tools/image_helper.dart';

class BannerImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  BannerImage(this.url, {this.fit: BoxFit.fitWidth});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      fit: fit,
    );
  }
}
