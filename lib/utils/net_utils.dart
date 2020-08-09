import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thai_lotoo/model/latest_page.dart' as last;
import 'package:thai_lotoo/model/list_page.dart' as list;
import 'package:thai_lotoo/utils/configs.dart';
import 'package:thai_lotoo/widget/loading.dart';

class NetUtils {
  static Dio _dio = Dio();
  static final String baseUrl = Configs.neturl;
  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    dynamic data,
    bool isShowLoading = true,
    Options options,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.get("$baseUrl$url",
          queryParameters: params, options: options);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static Future<list.LotteryList> getlotterylist(BuildContext context,
      {@required String page}) async {
    var response =
        await _get(context, '/list/$page', isShowLoading: false);
    return list.LotteryList.fromJson(response.data);
  }

   static Future<last.LotteryLatest> getlottery(BuildContext context,
      {@required Map<String, dynamic> params}) async {
    var response =
        await _get(context, '/latest', params: params, isShowLoading: false);
    return last.LotteryLatest.fromJson(response.data);
  }
}
