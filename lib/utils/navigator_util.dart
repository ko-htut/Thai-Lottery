import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:thai_lotoo/page/lottery_detail_page.dart';
import 'package:thai_lotoo/route/transparent_route.dart';

import '../application.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }

  static void golotterydetails(BuildContext context, {@required String url}) {
     Navigator.push(
      context,
        TransparentRoute(builder: (_) => LotteryDetailPage(url:url),),
    );
    //  _navigateTo(context, "${Routes.result}?url=$url");
  }
}
