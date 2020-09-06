/*
 * @Author: xuwang.bao
 * @Date: 2020-08-24 16:24:35
 * @LastEditors: xuwang.bao
 * @LastEditTime: 2020-08-26 19:06:37
 * @Description: 定制动态appBar
 * @$emit: 
 * @$slot: 
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SliveHaderBar extends StatelessWidget  {
  SliveHaderBar({this.title, this.paddingTop = 0});

  String title;
  double paddingTop;
  @override
  Widget build(Object context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: SliveHaderBarDelegate(
        title: title,
        paddingTop: paddingTop
      )
    );
  }
}

class SliveHaderBarDelegate extends SliverPersistentHeaderDelegate{
  SliveHaderBarDelegate({
    this.title, 
    this.paddingTop = 0, 
    this.collapsedHeight = 0,
    this.expandedHeight = 0,
    this.actions = const [],
    this.stick
  });

  final String title;
  final double paddingTop;
  final double collapsedHeight;
  final double expandedHeight;
  List<Widget> actions;
  final PreferredSizeWidget stick; //吸顶的组件

  Widget _flexible(double scale){
    return Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 100,
            // padding: EdgeInsets.only(
            //   left: 15
            // ),
            child: Transform.scale(
              alignment: Alignment.centerLeft,
              scale: scale,
              child: Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                )
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: actions,
              ),
            )
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));  
    double range = maxExtent - minExtent;
    double offset = range - shrinkOffset;
    double scale = (offset) <= 0 ? 1 : (offset / range * 0.5) + 1;
    // 伸缩区
    Widget _flexible = Expanded(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: 15
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              bottom: 15,
              right: 0,
              child: this._flexible(scale)
            )
          ],
        ),
      ) 
    );
    List<Widget> columnChildren = stick == null ? [_flexible] : [_flexible, stick];
    return Container(
      height: maxExtent,
      child: Column(
        children: columnChildren,
      ),
    );
  }

  // 最小高度
  @override
  double get minExtent => this.stick != null ? this.stick.preferredSize.height + collapsedHeight + paddingTop : collapsedHeight + paddingTop;


  @override
  double get maxExtent => this.stick != null ? this.stick.preferredSize.height + expandedHeight + paddingTop : expandedHeight + paddingTop;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}