/*
 * @Author: xuwang.bao
 * @Date: 2020-08-25 10:25:24
 * @LastEditors: xuwang.bao
 * @LastEditTime: 2020-08-25 15:00:19
 * @Description: 搜索块
 * @$emit: 
 * @$slot: 
 */

import 'package:flutter/material.dart';
class SearchBlock extends StatelessWidget {

  SearchBlock({
    this.onTap
  });
  final GestureTapCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 155,
        height: 30,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF81ceca),
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              child: Icon(Icons.search, color: Colors.white, size: 15,),
            ),
            Text('搜索公司或职位', style: TextStyle(
              color: Colors.white,
              fontSize: 13
            ))
          ],
        ),
      ),
    );
  }
}