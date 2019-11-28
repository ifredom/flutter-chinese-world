import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttermono/language/i18n.dart';
import 'package:fluttermono/pages/home/home.dart';
import 'package:fluttermono/pages/splash/splash.dart';
import 'package:fluttermono/routers/application.dart';
import 'package:fluttermono/routers/routers.dart';
import 'package:fluttermono/store/index.dart';
import 'package:fluttermono/store/model/config.dart';
import 'package:fluttermono/tools/style/themeData.dart';

class RootComponent extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final bool isSignin = false;

  RootComponent({Key key}) : super(key: key);

  void _initRoute() {
    final router = new Router();
    Routes.configureRoutes(router);
    // set environment
    Application.router = router;
  }

  Widget _showPage() {
    return HomePage();
    // if (isSignin) {
    //   return HomePage();
    // } else {
    //   return SplashPage();
    // }
  }

  @override
  Widget build(BuildContext context) {
    _initRoute();

    return Store.init(
      context: context,
      child: Store.connect<ConfigModel>(
          builder: (BuildContext context, ConfigModel snapshot, Widget child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: '悠悠我心',
          theme: UnityThemeData.getThemeData(),
          home: _showPage(),
          localizationsDelegates: [
            // 本地化的代理类
            S.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Application.router.generator,
        );
      }),
    );
  }
}
