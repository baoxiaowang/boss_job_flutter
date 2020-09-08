import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 100,
            child: Transform.scale(
              alignment: Alignment.centerLeft,
              scale: scale,
              child: Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                )
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
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
    double currentExtent = math.max(minExtent, maxExtent - shrinkOffset);
    final double deltaExtent = maxExtent - minExtent;
    final double t = (1.0 - (currentExtent - minExtent) / deltaExtent).clamp(0.0, 1.0) as double;
    final double scaleValue = Tween<double>(begin: 1.2, end: 1.0).transform(t);
    final double top = Tween<double>(begin: 44 + deltaExtent, end: 44).transform(t);
    // 伸缩区
    Widget _flexible = Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4eaaa8),
              Color(0xff50aba9),
            ]
          )
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: top,
              left: 0,
              // bottom: 15,
              right: 0,
              child: this._flexible(scaleValue)
            )
          ],
        ),
      ) 
    );
    List<Widget> columnChildren = stick == null ? [_flexible] : [_flexible, stick];
    return GestureDetector(
      onVerticalDragStart:(dragStartDetails){
        return false;
      },
      child: Container(
        height: maxExtent,
        child: Column(
          children: columnChildren,
        ),
      )
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