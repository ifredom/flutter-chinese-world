import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/pagebg/mountain1.jpg"),
            fit: BoxFit.contain,
          ),
        ),
        child: Text('song 多语言切换参考 fun_android'),
      ),
    );
  }
}
