/*
 * @Author: xuwang.bao
 * @Date: 2020-08-25 14:57:30
 * @LastEditors: xuwang.bao
 * @LastEditTime: 2020-08-25 15:41:02
 * @Description: 搜索公司和职位
 * @$emit: 
 * @$slot: 
 */

import 'package:boos_job/routes/application.dart';
import 'package:flutter/material.dart';

class HomeSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      FlatButton(onPressed: (){
        Application.router.pop(context);
      }, child: Text('取消'))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return FlatButton(onPressed: (){}, child: Text('杭州'));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('result');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: Text('buildSuggestions'),
    );
  }


  @override
  ThemeData appBarTheme(BuildContext context) {
    // return super.appBarTheme(context);
    return ThemeData(
      // brightness: Brightness.light
      primaryColor: Colors.white
    );
  }
}