import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'router_handlers.dart';


class Routes{
  static String root = '/';
  static String searchPath = '/search';
  
  // 路由表
  static List<RouteConifg> routerHandlers = [
    RouteConifg(
      path: Routes.searchPath,
      handler: searchPageHandler
    ),
  ];

  static void configureRoutes(Router router){
    // 404
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('error::: router 没有找到');
        return Text('404');
      }
    );

    // 装载路由
    routerHandlers.forEach((config) {
      router.define(config.path, handler: config.handler);
    });
  }
}

class RouteConifg {
  RouteConifg({
    @required this.path,
    @required this.handler
  });
  String name;
  String path;
  Handler handler;
}
