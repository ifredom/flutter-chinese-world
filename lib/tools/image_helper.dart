import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageHelper {
  static const String baseUrl = 'http://www.ifredom.cn';
  static const String imagePrefix = '$baseUrl/images/';

  static ImageProvider getAssetImage(String name) {
    return AssetImage(getLocalImagePath(name));
  }

  static String getLocalImagePath(String name) {
    return 'assets/images/$name';
  }

  static ImageProvider getImageProvider(String imageUrl,
      {String holderImg: "none"}) {
    if (TextUtil.isEmpty(imageUrl)) {
      return AssetImage(getLocalImagePath(holderImg));
    }
    return CachedNetworkImageProvider(imageUrl);
  }

  static String wrapAssets(String url) {
    return "assets/images/" + url;
  }
}
