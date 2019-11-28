import 'package:flutter/material.dart';
import 'package:fluttermono/pages/wind/vertical_text.dart';
import 'package:fluttermono/res/gaps.dart';
import 'package:fluttermono/routers/fluro_navigator.dart';
import 'package:fluttermono/routers/modules/home_router.dart';
import 'package:fluttermono/tools/style/colorUtils.dart';

import 'advatar.dart';

class ArticleListWidget extends StatefulWidget {
  @override
  _ArticleListWidgetState createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _dateTitle(),
          _lineText(),
          _specialItem(),
          _customItem(),
          Gaps.vGap20,
          _customItem(),
          Gaps.vGap20,
        ],
      ),
    );
    // return _layoutWrapper(
    //   expandChild: Column(
    //     children: <Widget>[
    //       _dateTitle(),
    //       _lineText(),
    //       _specialItem(),
    //       _customItem(),
    //       Gaps.vGap20,
    //       _customItem(),
    //       Gaps.vGap20,
    //     ],
    //   ),
    // );
  }

  Widget _customItem() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/pagebg/mountain1.jpg"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        children: <Widget>[
          _titleDesc(),
          Gaps.vGap20,
          _customContentCard(),
          _toolMenu(),
          Gaps.vGap20,
        ],
      ),
    );
  }

  Widget _specialItem() {
    return Column(
      children: <Widget>[
        _titleDesc(),
        Gaps.vGap20,
        _painterCard(),
        _toolMenu(),
        Gaps.vGap20,
      ],
    );
  }

  /// 列表item内容
  Widget _customContentCard() {
    Size mediaSize = MediaQuery.of(context).size;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '雨中黄叶树，灯下白头人。',
            style: TextStyle(fontSize: 18.0),
          ),
          Gaps.vGap20,
          Image.asset(
            "assets/image/article/f1.jpg",
            fit: BoxFit.fitWidth,
          )
        ],
      ),
    );
  }

  /// 列表item工具栏
  Widget _toolMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.share, color: Colors.grey, size: 18.0),
              Gaps.hGap16,
              Icon(Icons.thumb_up, color: Colors.grey, size: 18.0),
              Gaps.hGap16,
              Icon(Icons.comment, color: Colors.grey, size: 18.0),
            ],
          ),
          Icon(Icons.more, color: Colors.grey, size: 18.0),
        ],
      ),
    );
  }

  /// 列表item标题
  Widget _titleDesc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Avatar(),
            Gaps.hGap8,
            Text(
              '初晨日签',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
        Text(
          '阅读',
          style: TextStyle(fontSize: 14.0),
        )
      ],
    );
  }

  /// 列表item内容
  Widget _painterCard() {
    Size mediaSize = MediaQuery.of(context).size;

    return Container(
      color: HexToColor('#5A6275'),
      // color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: CustomPaint(
        size: Size(mediaSize.width - (16 * 2), 300),
        painter: VerticalText(
          text: "人们总以自己的想法来约束",
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 4,
            wordSpacing: 4,
          ),
        ),
      ),
    );
  }

  /// 大标题以及日期
  Widget _dateTitle() {
    return Text(
      '早茶 2019.11.16',
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontSize: 22.0,
        letterSpacing: 2.0,
      ),
    );
  }

  /// 横线以及小标题
  Widget _lineText() {
    Size mediaSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: mediaSize.width / 4,
          height: 1.0,
          color: HexToColor('#333333'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Text('星期六/12篇内容'),
        ),
        Container(
          width: mediaSize.width / 4,
          height: 1.0,
          color: HexToColor('#333333'),
        ),
      ],
    );
  }

  /// Stack容器
  Widget _layoutWrapper({Widget expandChild}) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        expandChild,
        Positioned(
          right: 16.0,
          top: 45.0,
          child: InkWell(
            child: Hero(
              tag: "advator", //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset(
                  "assets/image/advatar.jpg",
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              print("hero");
              NavigatorUtils.push(context, HomeRouter.daterangePage);
            },
          ),
        ),
      ],
    );
  }
}
