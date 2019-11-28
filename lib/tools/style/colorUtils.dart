import 'package:flutter/material.dart';

/**
 * @author ifredom on 2019/11/16 17:41
 * Use Example: HexToColor("#fffff")
 */
class HexToColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor == null ||
        hexColor.length != 6 ||
        int.tryParse(hexColor.substring(0, 6), radix: 16) == null) {
      hexColor = '103580';
    }
    hexColor = "FF" + hexColor;
    return int.parse(hexColor, radix: 16);
  }

  HexToColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
