/*
 * @Author: xuwang.bao
 * @Date: 2020-08-25 00:04:45
 * @LastEditors: xuwang.bao
 * @LastEditTime: 2020-08-25 00:15:10
 * @Description: 
 * @$emit: 
 * @$slot: 
 */
import 'package:flutter/material.dart';

class PositionLabel extends StatelessWidget {
  PositionLabel(String label): label = label;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: Color(0xFFf5f5f5),
      ),
      margin: EdgeInsets.only(
        right: 10
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 5
      ),
      child: Text(label,
        style: TextStyle(
          fontSize: 12
        )
      ),
    );
  }
}