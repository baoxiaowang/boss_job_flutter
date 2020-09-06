import 'package:flutter/material.dart';
class MessageItem extends StatelessWidget {
  Widget _companyLogo(){
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.only(right: 5),
      // margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5
      ),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFeeeeee),
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: ClipOval(
          child: Image.network('https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3140403455,2984550794&fm=26&gp=0.jpg',
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }
  Widget _message(){
    return Container(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('呵呵哒', style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  )),
                ),
                Expanded(child: Text('邻汇吧·HR', 
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF666666)
                ),)),
                Text('昨天', style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF666666)
                ),)
              ],
            ),
          ),
          Text('我们正在寻找并肩奋斗的伙伴', style: TextStyle(
            fontSize: 12
          ),)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
      // margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _companyLogo(),
          Expanded(child: _message())
        ],
      ),
    );
  }
}