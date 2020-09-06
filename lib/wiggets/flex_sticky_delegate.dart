/*
 * @Author: xuwang.bao
 * @Date: 2020-03-10 22:24:47
 * @LastEditors: xuwang.bao
 * @LastEditTime: 2020-08-31 09:47:53
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
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    bool collapsed = maxExtent - shrinkOffset <= minExtent;
    print(collapsed);
    print(maxExtent);
    return OverflowBox(
      minHeight: maxExtent - shrinkOffset <= minExtent ? minExtent : maxExtent - shrinkOffset,
      child: Container(
        alignment: Alignment.bottomCenter,
        constraints: BoxConstraints(
          maxHeight: 145
        ),
        color: Colors.red,
        height: 145,
        // child: stick,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: flexWidget != null && !collapsed
          ? [Container(
            child: flexWidget,
            constraints: BoxConstraints(
              minHeight: maxExtent - minExtent
            ),
          ),stick]
          : [stick],
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