import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:thai_lotoo/model/latest_page.dart';
import 'package:thai_lotoo/utils/net_utils.dart';
import 'package:thai_lotoo/utils/utils.dart';
import 'package:thai_lotoo/widget/common_text_style.dart';
import 'package:thai_lotoo/widget/widget_future_builder.dart';

class LotteryDetailPage extends StatefulWidget {
  final String url;
  LotteryDetailPage({Key key, this.url}) : super(key: key);

  @override
  _LotteryDetailPageState createState() => _LotteryDetailPageState();
}

class _LotteryDetailPageState extends State<LotteryDetailPage> {
  Widget _buildRecommendPlayList() {
    return CustomFutureBuilder<LotteryLatest>(
      plsurl: widget.url ?? "/latest",
      futureFunc: NetUtils.getlottery,
      builder: (context, snapshot) {
        var data = snapshot.response;
        final reg = RegExp(r'([\u0E00-\u0E7F]+)');
        String month = reg.firstMatch(snapshot.response.date).group(0);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            (widget.url == null)
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(Utils.engmonthlsit[month]),
                      subtitle: Text(snapshot.response.date),
                      trailing: Icon(AntIcons.scan),
                    ),
                  )
                : Container(),
            // Container(
            //   width: double.infinity,
            //   color: Colors.blue[100],
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text(snapshot.response.date),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: data.prizes
                    .map((e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${Utils.engprize[e.id]} :${e.reward} "),
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                spacing: ScreenUtil().setWidth(3),
                                children: e.number
                                    .map((v) => GestureDetector(
                                          onTap: () {},
                                          child: Chip(
                                            label: Text(
                                              v,
                                              style: common14TextStyle,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: data.runningNumbers
                      .map((e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${Utils.engprize[e.id]} :${e.reward} "),
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: ScreenUtil().setWidth(10),
                                  children: e.number
                                      .map((v) => GestureDetector(
                                            onTap: () {},
                                            child: Chip(
                                              label: Text(
                                                v,
                                                style: common14TextStyle,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.url == null)
        ? Scaffold(
            body: SingleChildScrollView(child: _buildRecommendPlayList()),
          )
        : Scaffold(
            appBar: AppBar(elevation: 0,),
            body: SingleChildScrollView(child: _buildRecommendPlayList()),
          );
  }
}
