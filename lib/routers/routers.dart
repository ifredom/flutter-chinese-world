import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttermono/pages/custom/webview_page.dart';
import 'package:fluttermono/pages/home/home.dart';
import 'package:fluttermono/routers/router_init.dart';

import '404.dart';
import 'modules/home_router.dart';

class Routes {
  static String home = "/home";
  static String webViewPage = "/webview";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// error page
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint("can't find page!");
      return WidgetNotFound();
    });

    router.define(home,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    HomePage()));

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

    // 参考：https://www.jianshu.com/p/1987cc9b714a
    // 每次初始化前 先清除集合 以免重复添加
    _listRouter.clear();

    /// add module route
    _listRouter.add(HomeRouter());

    /// init router
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
