import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final bool isOval;
  Avatar({this.isOval = true});

  final Widget avatar = Image.asset(
    "assets/image/advatar.jpg",
    fit: BoxFit.cover,
    width: 28.0,
    height: 28.0,
  );

  @override
  Widget build(BuildContext context) {
    return isOval ? ClipOval(child: avatar) : avatar; //剪裁为圆形
  }
}
