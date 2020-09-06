/*
 * @Author: xuwang.bao
 * @Date: 2020-08-24 21:06:11
 * @LastEditors: xuwang.bao
 * @LastEditTime: 2020-08-25 00:38:21
 * @Description: 
 * @$emit: 
 * @$slot: 
 */
import 'package:boos_job/wiggets/position_label.dart';
import 'package:flutter/material.dart';

class PositionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 6
      ),
      color: Colors.white,
      // height: 170,
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          positionName,
          labelRow,
          companyInfo,
          contacts
        ],
      ),
    );
  }
  Widget labelRow = Builder(builder: (ctx){
    return Container(
      margin: EdgeInsets.only(
        bottom: 10
      ),
      child: Row(
        children: [
          PositionLabel('1-3年'),
          PositionLabel('大专')
        ],
      ),
    );
  });
  Widget positionName = Builder(builder: (ctx){
    return Container(
    // height: 20,
      margin: EdgeInsets.only(
        bottom: 10
      ),
      child: Row(
        children: [
          Expanded(
            child: Text('中级开发',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              )
            )
          ),
          Text('10-15k', 
            style: TextStyle(
              color: Theme.of(ctx).primaryColor
            ),
          )
        ],
      ),
    );
  });

  Widget companyInfo  = Builder(builder: (ctx){
    TextStyle style = TextStyle(
      fontSize: 12,
      color: Color(0xFF666666)
    );
    return Container(
      margin: EdgeInsets.only(
        bottom: 10
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text('邻汇吧', style: style),
          ),
          Container(
            child: Text('不需要融资', style: style),
          ),
        ],
      ),
    );
  });

  Widget contacts = Builder(builder: (ctx){
    return Container(
      child: Row(
        children: [
          Expanded(child: Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 7),
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundImage: NetworkImage('https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3140403455,2984550794&fm=26&gp=0.jpg'),
                  ),
                ),
                Text('呵呵哒'),
                Text('·HR')
              ],
            ),
          )),
          Text('杭州', style: TextStyle(
            color: Color(0xFF999999)
          ),)
        ],
      ),
    );
  });
}