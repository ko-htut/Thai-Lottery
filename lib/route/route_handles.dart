import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:thai_lotoo/page/Result/result_page.dart';
import 'package:thai_lotoo/page/main_page.dart';

var mainHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return MainPage();
});

// Result
var resultHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return LotteryResultPage();
});
