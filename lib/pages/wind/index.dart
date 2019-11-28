import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttermono/language/i18n.dart';
import 'package:fluttermono/tools/style/colorUtils.dart';
import 'package:fluttermono/widgets/banner_image.dart';

import 'article_list.dart';

class WindPage extends StatelessWidget {
  WindPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(),
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(S.of(context).windPageTitle),
              background: BannerWidget(),
              centerTitle: true,
            ),
          ),
          WindArticleList()
        ],
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  final List banners = [
    {'imagePath': 'assets/image/article/f1.jpg'},
    {'imagePath': 'assets/image/article/f2.jpg'},
    {'imagePath': 'assets/image/article/f3.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Swiper(
        loop: true,
        autoplay: true,
        autoplayDelay: 5000,
        pagination: SwiperPagination(),
        itemCount: banners.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              print(index);
            },
            child: BannerImage(banners[index]['imagePath']),
          );
        },
      ),
    );
  }
}

class WindArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ArticleListWidget();
        },
        childCount: 20,
      ),
    );
  }
}
