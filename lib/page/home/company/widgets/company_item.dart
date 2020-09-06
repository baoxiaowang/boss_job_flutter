import 'package:boos_job/wiggets/position_label.dart';
import 'package:flutter/material.dart';
class CompanyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15
            ),
            // margin: EdgeInsets.only(right: 15),
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffececec), width: 0.5)
              ),
              child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598335768471&di=651a67d0636cc67bbb96ca3e7ab39554&imgtype=0&src=http%3A%2F%2Fzhaopin-rd5-pub.oss-cn-beijing.aliyuncs.com%2Fimgs%2Fcompany%2Ff131b23ae3960b8142e34a766620be1b.jpeg'),
            )
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFececec)
                  )
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text('邻汇吧', 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                  ),),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text('杭州市余杭区', style: TextStyle(
                    fontSize: 12,
                  ),textAlign: TextAlign.center,),),
                  
                  Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: PositionLabel('股票代码00354'),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 3),
                    child: PositionLabel('年终奖,期权,双休，早九晚五'),
                  ),
                  Container(
                    height: 35,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text('3195个热招岗位', style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF666666)
                            ),),
                          )
                        ),
                        Container(
                          child: Icon(Icons.keyboard_arrow_right, size: 13,),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}