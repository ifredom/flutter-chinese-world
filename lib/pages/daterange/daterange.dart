import 'package:flutter/material.dart';

class DateRangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日历'),
      ),
      body: Center(
        child: Hero(
          tag: "advator", //唯一标记，前后两个路由页Hero的tag必须相同
          child: Image.asset(
            "assets/image/advatar.jpg",
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
