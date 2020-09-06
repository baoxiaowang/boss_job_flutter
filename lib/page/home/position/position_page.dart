import 'package:boos_job/wiggets/position_label.dart';
import 'package:boos_job/routes/application.dart';
import 'package:boos_job/routes/routes.dart';
import 'package:boos_job/wiggets/slive_header_bar.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'widgets/position_item.dart';
class PositionPage extends StatefulWidget  {
  @override
  _PositionPageState createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage> with AutomaticKeepAliveClientMixin {
  int _count = 0;
  EasyRefreshController _controller = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.builder(
        controller: _controller,
        firstRefresh: true,
        header: BallPulseHeader(
          enableHapticFeedback: false,
          color: Theme.of(context).primaryColor
        ),
        // footer: BallPulseFooter(
        //   enableHapticFeedback: false,
        //   color: Theme.of(context).primaryColor
        // ),
        footer: ClassicalFooter(
          enableInfiniteLoad: true,
          enableHapticFeedback: false,
          loadText: "拉动加载",
          loadReadyText: "释放加载",
          loadingText: "正在加载...",
          loadedText: "加载完成",
          loadFailedText: "加载失败",
          noMoreText: "没有更多数据", 
          infoText: "更新于 %T",
        ),
        builder: (context, physics, header, footer) {
          return CustomScrollView(
            physics: physics,
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                // floating: true,
                delegate: SliveHaderBarDelegate(
                  collapsedHeight: 50,
                  expandedHeight: 60,
                  title: 'web前端',
                  paddingTop: MediaQuery.of(context).padding.top,
                  actions: [
                    IconButton(icon: Icon(Icons.add), color: Colors.white, onPressed: (){}),
                    IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: (){
                      Application.router.navigateTo(context, Routes.searchPath, 
                        transition: TransitionType.cupertino
                      );
                    })
                  ],
                  stick: PositionBarBottom()
                )
              ),
              header,
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) => PositionItem(),
                  childCount: _count
                )
              ),
              footer,
            ],
          );
        },
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                _count = 20;
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            if (mounted) {
              if(_count >=55){
                _controller.finishLoad(
                  success: true,
                  noMore: true
                );
              }else{
                setState(() {
                  _count += 20;
                });
              }
            }
          });
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// ignore: must_be_immutable
class PositionBarBottom extends StatelessWidget implements PreferredSizeWidget {
  // 切换tab
  Widget _positionTab = Builder(builder: (ctx){
    return Container(
      width: 175,
      child: Row(
        children: [
          FlatButton(
            onPressed: (){},
            child: Text('推荐')
          ),
          FlatButton(
            onPressed: (){},
            child: Text('最新')
          ),
          FlatButton(
            onPressed: (){},
            child: Text('附近')
          )
        ],
      ),
    );
  });
  Container _filterLabel = Container(
    height: 30,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
      children: [
        PositionLabel('杭州'),
        PositionLabel('筛选'),
        PositionLabel('关键词'),
      ],
    ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10
      ),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFEEEEEE),
              width: 1
            )
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _positionTab,
            Expanded(child: _filterLabel)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45);
}