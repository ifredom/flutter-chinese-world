import 'dart:math';

import 'package:flutter/material.dart';

// 实现基本原理：将句子拆成一个一个的字，每绘制一个字的时候就计算该字绘制的位置，
// 这样是无法支持emoji的。因为在dart里面，String 是UTF-16， 而emoji 是UTF-32. 意味着一个emoji 长度为普通字符的两倍。那么，text[i] 就会将emoji 拆成两部分，TextPainter 没办法渲染。
// string.runes 可以更加直观的表示单个文字/字符。通过string.runes 获取到的是codeUnit， 不是字符，需要String(codeUnit) 转一下
class VerticalText extends CustomPainter {
  final String text;
  final TextStyle textStyle;
  final double width;
  final double height;

  VerticalText({
    @required this.text,
    this.textStyle,
    this.width = 0,
    this.height = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = new Paint();
    paint.color = textStyle.color;
    double offsetX = size.width - width;
    double offsetY = size.height - height;
    bool newLine = true;
    int maxCol = 0;
    int currentCol = 0;
    double spanMaxWidth = 0;

    spanMaxWidth = _getSpanMaxWidth(text, textStyle);

    maxCol = offsetX.toInt() ~/ spanMaxWidth.toInt();

    paint
      ..isAntiAlias = true // 是否抗锯齿
      ..style = PaintingStyle.fill // 填充
      ..color = Color(0x77cdb175); // 背景为纸黄色;

    text.runes.forEach((rune) {
      String str = new String.fromCharCode(rune);
      TextSpan span = new TextSpan(text: str, style: textStyle);
      TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();

      if (offsetY + tp.height > size.height) {
        newLine = true;
        offsetY = 0;
      }

      if (newLine) {
        currentCol += 1;
        offsetX -= spanMaxWidth;
        newLine = false;
      }

      if (currentCol > maxCol) {
        return;
      }

      tp.paint(canvas, new Offset(offsetX, offsetY));
      offsetY += tp.height;
    });
  }

  double _getSpanMaxWidth(String text, TextStyle style) {
    double _spanMaxWidth = 0;

    text.runes.forEach((rune) {
      String str = new String.fromCharCode(rune);
      TextSpan span = new TextSpan(style: style, text: str);
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      tp.layout();
      _spanMaxWidth = max(_spanMaxWidth, tp.width);
    });

    return _spanMaxWidth;
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(VerticalText oldDelegate) {
    return oldDelegate.text != this.text;
  }

  double max(double a, double b) {
    if (a > b) {
      return a;
    } else {
      return b;
    }
  }
}
