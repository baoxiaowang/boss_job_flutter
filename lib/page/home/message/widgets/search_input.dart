import 'package:flutter/material.dart';
class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5
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