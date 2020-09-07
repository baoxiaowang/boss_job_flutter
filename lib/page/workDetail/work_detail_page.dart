import 'package:boos_job/wiggets/expandable_text.dart';
import 'package:boos_job/wiggets/position_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
const textInfo = 
'''
职位描述\n
1、负责公司核心业务系统前端团队的搭建和管理；\n
2、负责对标业内顶级 Saas 和 Paas 平台的需求研究、技术研究和实现；\n
3、负责不断优化团队前后端分离架构，提高团队开发效率和质量；\n
4、负责探索前端新的技术框架和边界（Vue.js，ElasticSearch，ReactNative等）；\n
5、负责团队 Scrum 流程推进和优化；\n
6、负责发现和产出对团队效率提升有价值的产品和工具；\n
7、更多的工作内容，欢迎你过来自己定义：）\n
职位要求\n
1、计算机相关专业，5年以上Web前端开发经验，有管理经验优先；\n
2、追求极致和完美，有代码洁癖，善于总结和挖掘事物本质；\n
3、前端基础扎实，理解RIA，有Ajax相关的实践经验，对React.js，Vue.js，Angular.js等MVVM框架能熟练运用至少一种，且了解其基本原理；\n
4、关注Web发展，对新技术充满激情，期待或者已经开发出优秀的产品；\n
5、对实现高性能、高可用、优秀用户体验的 Web 应用有实际的了解和实践经验；\n
6、熟悉 B/S 架构，有 Node 经验，有 Python 等其他脚本语言经验更佳；\n
7、有团队精神，性格乐观，能积极面对压力。
''';
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
                    fontSize: 25,
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
  Widget _workInfo(){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text('职位详情', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff333333)
            ),),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: ExpandableText(textInfo,
              expandText: '查看全部',
              collapseText: '',
              expanded: false,
              maxLines: 7,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff666666)
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffeeeeee)
                )
              )
            ),
            child: Row(
              children: [
                PositionLabel('HTML'),
                PositionLabel('CSS'),
                PositionLabel('javaScript'),
              ],
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
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
                    _workInfo(),
                    Container(
                      height: 200,
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
              color: Colors.white,
              child: Container(
                height: 45,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                            ),
                          )
                        ),
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            child: FlatButton(
                              onPressed: (){},
                              child: Icon(Icons.star_outline, color: Color(0xff333333)),
                            ),
                          ),
                          Container(
                            width: 40,
                            child: FlatButton(
                              onPressed: (){},
                              child: Icon(Icons.warning_amber_outlined, color: Color(0xff333333)),
                            ),
                          ),
                          Container(
                            width: 40,
                            child: FlatButton(
                              onPressed: (){},
                              child: Icon(Icons.launch, color: Color(0xff333333)),
                            ),
                          ),
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
              padding: EdgeInsets.fromLTRB(10, 10, 10, MediaQuery.of(context).padding.bottom + 10),
              child: Container(
                height: 45,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('立即沟通', style: TextStyle(
                    color: Colors.white
                  ),),
                  onPressed: (){}
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}