import 'package:flutter/material.dart';
class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.topLeft,
      // constraints: BoxConstraints(
      //   maxHeight: 40
      // ),
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
}