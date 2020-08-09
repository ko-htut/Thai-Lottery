import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


class Utils {
  
  static void showToast(String msg) {
    //  Toast.show(msg, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    // Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }

  static Widget showNetImage(String url,
      {double width, double height, BoxFit fit}) {
    return Image(
      image: NetworkImage(url),
      width: width,
      height: height,
      fit: fit,
    );
  }

}