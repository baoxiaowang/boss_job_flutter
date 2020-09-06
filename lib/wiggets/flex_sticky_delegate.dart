/*
 * @Author: xuwang.bao
 * @Date: 2020-03-10 22:24:47
 * @LastEditors: xuwang.bao
 * @LastEditTime: 2020-09-06 10:35:09
 * @Description: 伸缩吸顶
 * @$emit: 
 * @$slot: 
 */
import 'package:flutter/material.dart';
class FlexStickyDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSizeWidget stick; //吸顶的组件
  final double collapsedHeight; // 折叠高度
  final double expandedHeight; // 展开高度
  final Widget flexWidget; // 占位组件
  final double paddingTop; // 兼容iPhoneX

  FlexStickyDelegate({
    @required this.stick,
    this.collapsedHeight = 0,
    this.expandedHeight = 0,
    this.flexWidget,
    this.paddingTop = 0
  });
  
  List<Widget> get stackChildren {
    List<Widget> list = [];
    if(this.flexWidget != null){
      list.add(top);
    }
    if(stick != null){
      list.add(bottom);
    }
    return list;
  }

  Widget get top {
    return Positioned(
      left: 0,
      right: 0,
      bottom: stick.preferredSize.height,
      child: flexWidget,
    );
  }
  Widget get bottom {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: stick,
    );
  }
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Container(
        child:  Stack(
          overflow: Overflow.visible,
          fit: StackFit.expand,
          children: stackChildren,
        ),
      ),
    );
    
  }
  double get preferredHeight => this.stick.preferredSize.height;

  // 最小高度
  @override
  double get minExtent => this.stick.preferredSize.height + paddingTop + collapsedHeight;


  @override
  double get maxExtent => this.stick.preferredSize.height + paddingTop + expandedHeight;

  

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}