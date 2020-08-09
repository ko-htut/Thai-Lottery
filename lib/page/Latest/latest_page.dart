import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_lotoo/model/latest_page.dart';
import 'package:thai_lotoo/utils/net_utils.dart';
import 'package:thai_lotoo/widget/h_empty_view.dart';
import 'package:thai_lotoo/widget/widget_future_builder.dart';

class LotteryLastPage extends StatefulWidget {
  LotteryLastPage({Key key}) : super(key: key);

  @override
  _LotteryLastPageState createState() => _LotteryLastPageState();
}

class _LotteryLastPageState extends State<LotteryLastPage> {
  Widget _buildRecommendPlayList() {
    return CustomFutureBuilder<LotteryLatest>(
      futureFunc: NetUtils.getlottery,
      builder: (context, snapshot) {
        var data = snapshot.response;
        return ListView.separated(
          separatorBuilder: (context, index) {
            return HEmptyView(ScreenUtil().setWidth(30));
          },
          padding:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
          itemBuilder: (context, index) {
            var prizes = snapshot.response.prizes[index];
            return Text("${prizes.name} :${prizes.reward} ");
          },
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: data.prizes.length,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildRecommendPlayList(),
          ],
        ),
      ),
    );
  }
}
