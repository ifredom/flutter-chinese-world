import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:fluttermono/res/gaps.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<Slide> slides = new List();

  void _onDonePress() async {
    var hasLogin = await SpUtil.getString('hasLogin');

    print(hasLogin);
    hasLogin == null
        ? Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
            (route) => route == null,
          )
        : Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (route) => route == null,
          );
  }

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "你若懂我该多好",
        widgetDescription: Column(
          children: <Widget>[
            Text('每个人都有一个死角,'),
            Gaps.vGap8,
            Text('自己走不出来，别人也闯不进去。'),
            Gaps.vGap8,
            Text('我把最深沉的秘密放在那里,'),
            Gaps.vGap8,
            Text('你不懂我，我不怪你。'),
          ],
        ),
        backgroundImage: './assets/image/splash/splash1.jpg',
      ),
    );

    slides.add(
      new Slide(
        title: "红尘有爱，盈花香满怀",
        widgetDescription: Column(
          children: <Widget>[
            Text('你说，繁华三千，却倾其一人'),
            Gaps.vGap8,
            Text('我唱，千千阙歌，却只恋一曲'),
            Gaps.vGap8,
            Text('这世间，经历千回百转，回眸依然是他的笑脸'),
            Gaps.vGap8,
            Text('有一个名字，虽途径万千，永远是心中唯一'),
            Gaps.vGap8,
            Text('红尘邂逅，情思缱绻，谁为谁饮尽孤独'),
            Gaps.vGap8,
            Text('谁为谁书写寂寞，却道是，情到深处无怨尤'),
          ],
        ),
        backgroundImage: './assets/image/splash/splash2.jpg',
      ),
    );

    slides.add(
      new Slide(
        title: "像这样细细的听",
        widgetDescription: Column(
          children: <Widget>[
            Text('像这样细细地听，如河口'),
            Gaps.vGap8,
            Text('凝神倾听自己的源头。'),
            Gaps.vGap8,
            Text('像这样深深地嗅，嗅一朵'),
            Gaps.vGap8,
            Text('小花，直到知觉化为乌有。'),
            Gaps.vGap8,
            Text('......'),
            Gaps.vGap8,
            Text('像这样，莲花般的少年'),
            Gaps.vGap8,
            Text('默默体验血的温泉。'),
            Gaps.vGap8,
            Text('……就像这样，与爱情相恋'),
            Gaps.vGap8,
            Text('就像这样，落入深渊。'),
          ],
        ),
        backgroundImage: './assets/image/splash/splash3.jpg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this._onDonePress,
    );
  }
}
