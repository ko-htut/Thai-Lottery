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
      appBar: AppBar(elevation: 0,),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(AntIcons.frown_outline),
              Text(Configs.wrong)
            ],
          ),
        ),
      ),
    );
  }
}