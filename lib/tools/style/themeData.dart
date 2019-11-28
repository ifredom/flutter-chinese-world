import 'package:flutter/material.dart';
import 'package:fluttermono/tools/style/colorUtils.dart';

class UnityThemeData {
  UnityThemeData();

  static ThemeData getThemeData() {
    ThemeData _theme = new ThemeData(
      primaryColor: HexToColor('#ffffff'), // #232427
      backgroundColor: HexToColor('#5A6275'),
      textTheme: TextTheme(
        // set Material default font style
        body1: TextStyle(
          color: HexToColor('#333333'),
          fontSize: 16.0,
          fontFamily: 'PingFang SC',
        ),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFC91B3A),
        size: 35.0,
      ),
    );
    return _theme;
  }
}
