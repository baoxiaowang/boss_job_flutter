import 'package:boos_job/page/home/company/widgets/company_item.dart';
import 'package:boos_job/page/home/company/widgets/company_overview.dart';
import 'package:boos_job/page/home/company/widgets/search_block.dart';
import 'package:boos_job/routes/application.dart';
import 'package:boos_job/routes/routes.dart';
import 'package:boos_job/wiggets/slive_header_bar.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> with AutomaticKeepAliveClientMixin {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: EasyRefresh.builder(
        firstRefresh: true,
        header: BallPulseHeader(
          enableHapticFeedback: false,
          color: Theme.of(context).primaryColor
        ),
        footer: BallPulseFooter(
          enableHapticFeedback: false,
          color: Theme.of(context).primaryColor
        ),
        builder: (context, physics, header, footer) {
          return CustomScrollView(
            physics: physics,
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                // floating: true,
                delegate: SliveHaderBarDelegate(
                  collapsedHeight: 50,
                  expandedHeight: 60,
                  title: '公司',
                  paddingTop: MediaQuery.of(context).padding.top,
                  actions: [
                    SearchBlock(
                      onTap: (){
                        Application.router.navigateTo(context, Routes.searchPath, 
                          transition: TransitionType.cupertino
                        );
                      },
                    )
                  ],
                )
              ),
              header,
              SliverToBoxAdapter(
                child: CompanyOverview(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  // margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('推荐公司', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),),
                      Text('和你相似的牛人还在看这些公司', style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF666666)
                      ),)
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CompanyItem(),
                  childCount: _count,
                )
              ),
              footer,
            ],
          );
        },
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                _count = 20;
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                _count += 20;
              });
            }
          });
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}