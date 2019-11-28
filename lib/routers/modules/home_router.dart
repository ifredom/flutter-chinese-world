import 'package:fluro/fluro.dart';
import 'package:fluttermono/pages/daterange/daterange.dart';
import '../router_init.dart';
import 'package:fluttermono/pages/home/home.dart';

class HomeRouter implements IRouterProvider {
  static String homePage = "/home";
  static String daterangePage = "/daterange";
  @override
  void initRouter(Router router) {
    router.define(homePage,
        handler: Handler(handlerFunc: (_, params) => HomePage()));
    router.define(daterangePage,
        handler: Handler(handlerFunc: (_, params) => DateRangePage()));
  }
}
