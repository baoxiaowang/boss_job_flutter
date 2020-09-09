import 'package:boos_job/page/search/widgets/search_input.dart';
import 'package:boos_job/routes/application.dart';
import 'package:boos_job/wiggets/position_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override

  List<String> word = [
    '阿里巴巴',
    '网易',
    '字节跳动',
    '百度',
    'web前端',
    'flutter',
    'php',
    'java',
    'aaaaa',
    'AAAA'
  ];
  List<String> result;
  String keyword = '';
  @override
  void initState() { 
    super.initState();
    result = [];
  }

  changeResult(List<String> val,String keyword){
    setState(() {
      result = val;
      this.keyword = keyword;
    });
  }

  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    print(result);
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Color(0xFFeeeeee), width: 1)
            )
          ),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: FlatButton(
                      onPressed: (){},
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 2),
                            child: Text('杭州', style: TextStyle(
                              fontSize: 13
                            )),
                          ),
                          Icon(Icons.arrow_drop_down,size: 15)
                        ],
                      )
                    ),
                  ),
                  Expanded(child: SearchInput(
                    onchange: (val){
                      List<String> result = [];
                      var reg = RegExp(val,
                        caseSensitive: false
                      );
                      try {
                        word.forEach((String item) {
                          if(reg.hasMatch(item)){
                            result.add(item);
                          }
                        });
                        changeResult(result, val);
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),),
                  FlatButton(
                    onPressed: (){
                      Application.router.pop(context);
                    }, 
                    child: Text('取消', style: TextStyle(
                      fontSize: 13
                    ))
                  )
                  ],
              ),
            )
          ),
        ), 
        preferredSize: Size.fromHeight(50)
      ),
      body: Builder(builder: (ctx){
        // 没有查询结果时
        if(result.length <= 0){
          return reusltEmptyBody;
        }
        return ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 15
          ),
          itemBuilder: (ctx, index){
            List<InlineSpan> children = [];
            var item = result[index];
            var keywordStyle = TextStyle(
              color: Theme.of(context).primaryColor
            );
            var itemStyle = TextStyle(
              color: Color(0xff333333)
            );
            print(keyword);
            if(keyword != ''){
              var reg = RegExp(keyword,
                caseSensitive: false
              );
              var strArr = item.split(reg);
              var index = 1;
              strArr.forEach((item) {
                if(item != ''){
                  children.add(TextSpan(
                    text: item,
                    style: itemStyle
                  ));
                }
                if(index != strArr.length){
                  children.add(TextSpan(
                    text: keyword,
                    style: keywordStyle
                  ));
                }
                index++;
              });
            }else{
              children.add(TextSpan(
                text: item
              ));
            }
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFEEEEEE),width: 0.7)
                )
              ),
              height: 55,
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: children
                )
              ),
              // child: Text('${result[index]}', style: TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w500
              // ),),
            );
          },
          itemCount: result.length,
        );
      }),
    );
  }

  Widget reusltEmptyBody = Container(
    padding: EdgeInsets.symmetric(
      horizontal: 18
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(child: Container(
                        child: Text('历史搜索', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),),
                      )),
                      IconButton(icon: Icon(Icons.delete_outline), onPressed: (){},)
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 5,
                    children: [
                      PositionLabel('vue'),
                      PositionLabel('前端开发'),
                      PositionLabel('Java开发'),
                      PositionLabel('flutter开发工程师'),
                      PositionLabel('PHP'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

