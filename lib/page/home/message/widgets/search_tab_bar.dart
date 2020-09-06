import 'package:flutter/material.dart';
class SearchTabBar extends StatelessWidget {

  Widget _search(){
    return Container(
      alignment: Alignment.topLeft,
      constraints: BoxConstraints(
        maxHeight: 40
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0
      ),

      child: TextField(
        textAlign: TextAlign.justify,
        onChanged: (val){},
        style: TextStyle(
          fontSize: 14
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5
          ),
          hintText: '通过名字活公司搜索联系人',
          border: OutlineInputBorder()
        ),
      ),
    );
  }

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
          _search(),
          _tabBar
        ],
      ),
    );
  }
}