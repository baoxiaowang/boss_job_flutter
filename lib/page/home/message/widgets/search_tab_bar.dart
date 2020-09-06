import 'package:flutter/material.dart';
class SearchTabBar extends StatelessWidget {
  Widget _tabBar = Container(
    height: 40,
    margin: EdgeInsets.symmetric(
      horizontal: 10
    ),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Color(0xFFEEEEEE),
          width: 1,
        )
      )
    ),
    child: Row(
      children: [
        FlatButton(
          key: ValueKey('全部'),
          onPressed: (){},
          child: Text('全部', style: TextStyle(
            fontSize: 13
          ),)
        ),
        FlatButton(
          onPressed: (){},
          child: Text('招呼', style: TextStyle(
            fontSize: 13
          ))
        ),
        FlatButton(
          onPressed: (){},
          child: Text('沟通中', style: TextStyle(
            fontSize: 13
          ))
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          // _search(),
          _tabBar
        ],
      ),
    );
  }
}