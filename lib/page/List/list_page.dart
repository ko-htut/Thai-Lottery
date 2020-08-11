import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:thai_lotoo/model/list_page.dart' as list;
import 'package:thai_lotoo/utils/net_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_lotoo/utils/utils.dart';
import 'package:thai_lotoo/widget/loading.dart';
import 'package:thai_lotoo/widget/widget_load_footer.dart';

typedef LoadMoreWidgetBuilder<T> = Widget Function(T data);

class LotteryListPage extends StatefulWidget {
  LotteryListPage({Key key}) : super(key: key);

  @override
  _LotteryListPageState createState() => _LotteryListPageState();
}

class _LotteryListPageState extends State<LotteryListPage> {
  List<list.Responset> _slotteryData = [];
  int page = 1;
  int _currentpage = 1;
  int _lastpage = 1;
  int _count = -1;
  EasyRefreshController _controller;
  // var _engmonthlsit = {
  //   "มกราคม": "January",
  //   "กุมภาพันธ์": "February",
  //   "มีนาคม": "March",
  //   "เมษายน": "April",
  //   "พฤษภาคม": "May",
  //   "มิถุนายน": "June",
  //   "กรกฎาคม": "July",
  //   "สิงหาคม": "August",
  //   "กันยายน": "September",
  //   "ตุลาคม": "October",
  //   "พฤศจิกายน": "November",
  //   "ธันวาคม": "December",
  // };
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      _request();
    });
  }

  void _request() async {
    String inpage = page.toString();
    var smovie = await NetUtils.getlotterylist(context, page: inpage);

    if (mounted) {
      setState(() {
        _count = smovie.response.length;
        _lastpage = 2;
        _currentpage = 1;
        _slotteryData.addAll(smovie.response);
      });
    }
  }

  Widget _buildlottolist() {
    return _buildLoadMoreWidget<list.Responset>(_slotteryData, (slottery) {
      final monthreg = RegExp(r'([\u0E00-\u0E7F]+)');
      String month = monthreg.firstMatch(slottery.date).group(0);
      return ListTile(
        title: Text("Month : ${Utils.engmonthlsit[month]}"),
        subtitle: Text("Rd : ${slottery.date}"),
      );
    });
  }

  Widget _buildLoadMoreWidget<T>(
      List<T> data, LoadMoreWidgetBuilder<T> builder) {
    return EasyRefresh.custom(
      slivers: [
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return builder(data[index]);
        }, childCount: data.length))
      ],
      footer: LoadFooter(),
      controller: _controller,
      onLoad: () async {
        if (_lastpage != _currentpage) {
          page++;
          _request();
        } else {
          _controller.finishLoad(noMore: data.length >= _count);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_count == -1) {
      return Center(child: Text("loading..."));
    }
    return _buildlottolist();
  }
}
