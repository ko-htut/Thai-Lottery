import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:thai_lotoo/page/error_page.dart';

import 'route_handles.dart';

class Routes {
  static String root = "/";
  static String result = "/result";


  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return ErrorPage();
    });
    router.define(root, handler: mainHandler);
    router.define(result, handler: lotterydetailHandler);
  }
}