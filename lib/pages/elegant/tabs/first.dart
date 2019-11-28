import 'package:flutter/material.dart';
import 'animations.dart';

class BarLoadingScreen extends StatefulWidget {
  @override
  _BarLoadingScreenState createState() => new _BarLoadingScreenState();
}

// 通过将 SingleTickerProviderStateMixin 添加到类定义中，可以将该 stateful对象作为vsync的值
// 防止屏幕外动画，降低资源消耗
class _BarLoadingScreenState extends State<BarLoadingScreen>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation;
  AnimationController _colorController;
  Animation<Color> colorAnimation;
  Tween<double> tween;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _colorController = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    tween = new Tween<double>(begin: 0.0, end: 1.00);
    _controller.repeat().orCancel;

    colorAnimation = new ColorTween(
      begin: const Color.fromRGBO(10, 10, 10, 0.5),
      end: const Color.fromRGBO(0, 200, 100, 0.5),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _colorController.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _colorController?.dispose();
    super.dispose();
  }

  Animation<double> _createAnimationStep(num stepLength) {
    double start = 0.0;
    double end = 0.125;
    final double step = 0.125;
    return tween.animate(new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          start + step * stepLength,
          end + step * stepLength,
          curve: Curves.linear,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: colorAnimation.value),
      child: forwardStaggeredAnimation,
    );
  }

  Widget get forwardStaggeredAnimation {
    return new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new PivotBar(
            alignment: FractionalOffset.centerLeft,
            controller: _controller,
            animations: [
              _createAnimationStep(0),
              _createAnimationStep(1),
            ],
            marginRight: 0.0,
            marginLeft: 0.0,
            isClockwise: true,
          ),
          new PivotBar(
            controller: _controller,
            animations: [
              _createAnimationStep(2),
              _createAnimationStep(7),
            ],
            marginRight: 0.0,
            marginLeft: 0.0,
            isClockwise: false,
          ),
          new PivotBar(
            controller: _controller,
            animations: [
              _createAnimationStep(3),
              _createAnimationStep(6),
            ],
            marginRight: 0.0,
            marginLeft: 32.0,
            isClockwise: true,
          ),
          new PivotBar(
            controller: _controller,
            animations: [
              _createAnimationStep(4),
              _createAnimationStep(5),
            ],
            marginRight: 0.0,
            marginLeft: 32.0,
            isClockwise: false,
          ),
        ],
      ),
    );
  }
}

// 原文地址：https://flutterbyexample.com/step-one-tweening
