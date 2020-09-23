import 'package:boos_job/page/home/personal/widget/setting_row.dart';
import 'package:boos_job/routes/application.dart';
import 'package:boos_job/routes/routes.dart';
import 'package:flutter/material.dart';
import 'widget/personal_header_delegate.dart';
class PersonalPage extends StatelessWidget {
  Widget _getTopBlock(){
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text('求职助手', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),)),
          Text('其他/钱包',style: TextStyle(
            color: Color(0xffcbcbcb)
          ),),
          Icon(Icons.chevron_right, color: Color(0xffcbcbcb))
        ],
      ),
    );
  }
  Widget _fileSetting(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(top: 10),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingRow(
              icon: Icon(Icons.folder_outlined, color: Color(0xff909090),),
              title: '附件简历',
              memo: '已上传2份',
            ),
            SettingRow(
              icon: Icon(Icons.add_circle_outline, color: Color(0xff909090)),
              title: '管理求职意向',
              memo: '在职考虑机会',
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Divider(
                height: 1.0,
                indent: 0.0,
                color: Color(0xffcbcbcb)
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _resumeSetting(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(top: 10),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingRow(
              icon: Icon(Icons.bookmark_outline, color: Color(0xff909090),),
              title: '提升简历曝光',
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Divider(
                height: 1.0,
                indent: 0.0,
                color: Color(0xffcbcbcb)
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _mySetting(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(top: 10),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingRow(
              icon: Icon(const IconData(0xe629,fontFamily: 'bossIcons'), color: Color(0xff909090)),
              title: '我的发现',
            ),
            SettingRow(
              icon: Icon(Icons.home, color: Color(0xff909090)),
              title: '个人主页',
            ),
            SettingRow(
              icon: Icon(Icons.chat_bubble_outline, color: Color(0xff909090)),
              title: '牛人问答',
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Divider(
                height: 1.0,
                indent: 0.0,
                color: Color(0xffcbcbcb)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otherSetting(context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(top: 10),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingRow(
              icon: Icon(Icons.assessment_outlined, color: Color(0xff909090)),
              title: '薪酬查询',
            ),
            SettingRow(
              icon: Icon(Icons.help_outline, color: Color(0xff909090)),
              title: '帮助与反馈',
            ),
            SettingRow(
              icon: Icon(Icons.face_outlined, color: Color(0xff909090)),
              title: '我的客服',
            ),
            SettingRow(
              icon: Icon(Icons.info_outline, color: Color(0xff909090)),
              title: '关于',
              onTab: (){
                Application.router.navigateTo(context, Routes.about);
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Divider(
                height: 1.0,
                indent: 0.0,
                color: Color(0xffcbcbcb)
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _aboutBlock(){
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20
      ),
      alignment: Alignment.center,
      child: Text('客服电话 400-065-9999   工作时间9:30-18:30', style: TextStyle(
        fontSize: 11,
        color: Color(0xffcbcbcb)
      ),),
    );
  }
  Widget _getCards(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text('简历刷新', style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                          Text('提升简历活跃', style: TextStyle(
                            fontSize: 11,
                            color: Color(0xffcbcbcb)
                          ),)
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            )
          ),
          Expanded(
            child: Container(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text('竞争力分析', style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                          Text('洞察职业竞争', style: TextStyle(
                            fontSize: 11,
                            color: Color(0xffcbcbcb)
                          ),)
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: PersonalHeaderDelegate(
              paddingTop: MediaQuery.of(context).padding.top
            )
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _getTopBlock(),
              _getCards(),
              _fileSetting(),
              _mySetting(),
              _resumeSetting(),
              _otherSetting(context),
              _aboutBlock()
            ])
          ),
        ],
      ),
    );
  }
}