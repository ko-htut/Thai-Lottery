import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:thai_lotoo/utils/configs.dart';

class ErrorPage extends StatefulWidget {
  ErrorPage({Key key}) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Icon(AntIcons.frown_outline),
          Text(Configs.wrong)
        ],
      ),
    );
  }
}