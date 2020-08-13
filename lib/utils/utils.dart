import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  static var engmonthlsit = {
    "มกราคม": "January",
    "กุมภาพันธ์": "February",
    "มีนาคม": "March",
    "เมษายน": "April",
    "พฤษภาคม": "May",
    "มิถุนายน": "June",
    "กรกฎาคม": "July",
    "สิงหาคม": "August",
    "กันยายน": "September",
    "ตุลาคม": "October",
    "พฤศจิกายน": "November",
    "ธันวาคม": "December",
  };

  static var engprize = {
    "prizeFirst": "First Prize",
    "prizeFirstNear": "First Near Prize",
    "prizeSecond": "Second Prize",
    "prizeThird": "Thrid Prize",
    "prizeForth": "Forth Prize",
    "prizeFifth": "Fifth Prize",
    "runningNumberFrontThree": "Prize for 3 page numbers",
    "runningNumberBackThree": "Prize for last 3 digits",
    "runningNumberBackTwo": "Prize for last 2 digits",
  };
}
