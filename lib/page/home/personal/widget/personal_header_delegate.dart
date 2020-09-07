import 'package:flutter/material.dart';
import 'dart:math' as math;
class PersonalHeaderDelegate extends SliverPersistentHeaderDelegate{ 
  PersonalHeaderDelegate({
    this.paddingTop
  });
  final double paddingTop; // 兼容iPhoneX

  Widget _getTitle(){
    return GestureDetector(
      onVerticalDragStart: (d){
        return false;
      },
      child: Container(
        height: 55,
        alignment: Alignment.centerLeft,
        child: Text('鲍小旺', style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),),
      ),
    );
  }
  Widget _itemStatistics(String title, int value){
    return Container(
      height: 55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title, style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),),
          Text('$value', style: TextStyle(
            color: Colors.white70
          ),)
        ],
      ),
    );
  }
  Widget _appBar(context){
    return GestureDetector(
      onVerticalDragStart: (d){
        return false;
      },
      child: Container(
        margin: EdgeInsets.only(
          top: paddingTop
        ),
        height: 55,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(icon: Icon(Icons.crop_free, color: Colors.white,), onPressed: null),
            IconButton(icon: Icon(Icons.brightness_5, color: Colors.white,), onPressed: null)
          ],
        ),
      ),
    );
  }
  Widget _background(){
    return Container(
      alignment: Alignment.bottomLeft,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(IconData(0xe600, fontFamily: 'bossIcons'),color: Colors.white,size: 12,),
                      ),
                      Text('我的在线简历', style: TextStyle(
                        color: Colors.white,
                      ))
                    ],
                  )),
                  Container(
                    height: 65,
                    width: 65,
                    child: ClipOval(
                      child: Image.network('https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3140403455,2984550794&fm=26&gp=0.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Row(
                children: [
                  Expanded(child: _itemStatistics('沟通过', 300)),
                  Expanded(child: _itemStatistics('待面试', 0)),
                  Expanded(child: _itemStatistics('已投递', 63)),
                  Expanded(child: _itemStatistics('收藏', 15))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff202020),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10)
                  )
                ),
                child: Text('升级vip享受超级福利', style: TextStyle(
                  color: Color(0xffc29a7d)
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }

  double _getCollapsePadding(double t, {double maxExtent , double minExtent }) {
    final double deltaExtent = maxExtent - minExtent;
    return -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t);
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final List<Widget> children = <Widget>[];
    double currentExtent = math.max(minExtent, maxExtent - shrinkOffset);
    final double deltaExtent = maxExtent - minExtent;
    final double fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
    const double fadeEnd = 1.0;
    // 0.0 -> Expanded
    // 1.0 -> Collapsed to toolbar
    final double t = (1.0 - (currentExtent - minExtent) / deltaExtent).clamp(0.0, 1.0) as double;
    final double opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);
    final double scaleValue = Tween<double>(begin: 1.5, end: 1.0).transform(t);
    final double top = Tween<double>(begin: 105, end: 44).transform(t);
    children.add(Positioned(
      top: _getCollapsePadding(t, maxExtent: maxExtent, minExtent: minExtent),
      left: 0.0,
      right: 0.0,
      height: maxExtent,
      child: Opacity(
        opacity: opacity,
        child: _background(),
      ),
    ));
    children.add(Positioned(
      top: 0,
      left: 0.0,
      right: 0.0,
      child: _appBar(context),
    ));
    children.add(Positioned(
      top: top,
      left: 20.0,
      right: 0.0,
      child: Transform.scale(
        scale: scaleValue,
        alignment: Alignment.centerLeft,
        child:  _getTitle(),
      ),
    ));
    return Container(
      height: maxExtent,
      color: Theme.of(context).primaryColor,
      child: Stack(
        fit: StackFit.expand,
        children: children,
      ),
    );
  }
  
  @override
  double get maxExtent => 280 + paddingTop;
  @override
  double get minExtent => 55 + paddingTop;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // FlexibleSpaceBar
    return false;
  }

}