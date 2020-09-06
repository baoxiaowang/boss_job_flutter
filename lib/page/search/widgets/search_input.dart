import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  SearchInput({
    this.onchange
  });
  ValueChanged<String> onchange;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: '请输入职位或公司',
          border: InputBorder.none
        ),
        onChanged: onchange,
      ),
    );
  }
}