import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:thai_lotoo/page/lottery_detail_page.dart';
import 'package:thai_lotoo/page/main_page.dart';

var mainHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return MainPage();
});

// Result
var lotterydetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String url = params['url'].first.toString();
  print("data: $url");
  return LotteryDetailPage(url: url,);
});
