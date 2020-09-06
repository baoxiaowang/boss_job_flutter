import 'package:flutter/material.dart';
class WorkDetailPage extends StatefulWidget {
  @override
  _WorkDetailPageState createState() => _WorkDetailPageState();
}

class _WorkDetailPageState extends State<WorkDetailPage> {
  static const scroll_offset = 100;
  double appBarTitleAlpha = 0;
  _onScrollUpdate(offset){
    double alpha = offset / scroll_offset;
    if(alpha<0){
      alpha = 0;
    }else if(alpha>1){
      alpha = 1;
    }
    
    setState(() {
      appBarTitleAlpha = alpha;
    });
  }
  Widget _detailTitle(){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  // color: Colors.yellow,
                  margin: EdgeInsets.only(right: 10),
                  child: Text('web前端开发工程师', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)
                  ),),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text('10-15k',style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500
                  ),)
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(child: Icon(Icons.location_on_outlined, color: Color(0xff666666),),),
                Container(margin: EdgeInsets.only(left: 5), child: Text('杭州 · 余杭', style: TextStyle(
                  color: Color(0xff666666)
                ),),),
                Container(margin: EdgeInsets.only(left: 20), child: Icon(Icons.work_outline, color: Color(0xff666666),),),
                Container(margin: EdgeInsets.only(left: 5), child: Text('1-3年', style: TextStyle(
                  color: Color(0xff666666)
                ),),),
                Container(margin: EdgeInsets.only(left: 20), child: Icon(Icons.bookmark_outline, color: Color(0xff666666),),),
                Container(margin: EdgeInsets.only(left: 5), child: Text('大专', style: TextStyle(
                  color: Color(0xff666666)
                ),),),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _hrWidget(){
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Color(0xffeeeeee),
            width: 1
          )
        )
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 20
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(right: 15),
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
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: RichText(
                    text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(text: '呵呵哒', style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          )),
                          TextSpan(
                            text: '  今日活跃',
                            style: TextStyle(color: Color(0xff666666),fontSize: 12),
                          ),
                        ]),
                  ),
                ),
                Container(
                  child: Text('邻汇吧 · 招聘经理', style: TextStyle(
                    fontSize: 13
                  ),),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.yellow,
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Icon(Icons.keyboard_arrow_right, color: Color(0xff999999),),
                onTap: (){},
              ),
            )
          )
          
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 45,
            left: 0,
            right: 0,
            bottom: 0,
            child: NotificationListener(
              onNotification:(Notification notification){
                if(notification is ScrollUpdateNotification &&
                  notification.depth == 0
                ){
                  _onScrollUpdate(notification.metrics.pixels);
                }
                return false;
              },
              child: Container(
                // color: Colors.yellow,
                child: ListView(
                  children: [
                    _detailTitle(),
                    _hrWidget(),
                    Container(
                      height: 600,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            )
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              color: Colors.yellow,
              child: Container(
                height: 45,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      child: BackButton(
                        color: Color(0xff333333),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Opacity(
                          opacity: appBarTitleAlpha,
                          child: Text('web前端开发工程师',textAlign: TextAlign.left, style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                            ),
                          )
                        ),
                      )
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(icon: Icon(Icons.star_outline),color: Color(0xff333333), onPressed: (){}),
                          IconButton(icon: Icon(Icons.warning_amber_outlined), color: Color(0xff333333), onPressed: (){}),
                          IconButton(icon: Icon(Icons.share), color: Color(0xff333333), onPressed: (){})
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Color(0xffeeeeee)
                  )
                )
              ),
              margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10
              ),
              height: 65,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text('立即沟通', style: TextStyle(
                  color: Colors.white
                ),),
                onPressed: (){}
              ),
            )
          )
        ],
      ),
    );
  }
}