import 'package:common_utils/common_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thai_lotoo/page/main_page.dart';
import 'package:thai_lotoo/route/navigate_service.dart';
import 'package:thai_lotoo/route/routes.dart';

import 'application.dart';
 void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  Application.setupLocator();
  LogUtil.init(tag: 'Thai_lottery');
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
     SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
       statusBarColor: Colors.transparent,
       // statusBarIconBrightness: Brightness.light,
     ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thai Lottery',
      navigatorKey: Application.getIt<NavigateService>().key,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          splashColor: Colors.transparent,
          tooltipTheme: TooltipThemeData(verticalOffset: -100000)),
      home: MainPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}