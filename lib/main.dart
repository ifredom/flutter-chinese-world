import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:fluttermono/pages/root/root.dart';

void main() async {
  // set Global Screen
  // SystemChrome.setEnabledSystemUIOverlays([]);

  await SpUtil.getInstance();

  runApp(RootComponent());
}
