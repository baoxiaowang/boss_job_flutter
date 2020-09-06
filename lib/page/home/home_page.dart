import 'package:boos_job/page/home/company/company_page.dart';
import 'package:boos_job/page/home/message/message_page.dart';
import 'package:boos_job/page/home/personal/personal_page.dart';
import 'package:boos_job/page/home/work/work_page.dart';
import 'package:boos_job/providers/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  
  final WorkPage _positionPage = WorkPage();
  final CompanyPage _companyPage = CompanyPage();
  final MessagePage _messagePage = MessagePage();
  final PersonalPage _personalPage = PersonalPage();
  
  static const List<BottomNavigationBarItem> bottomNavigationBars = [
    BottomNavigationBarItem(
      icon: Icon(Icons.work),
      title: Text('职务')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      title: Text('公司')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      title: Text('消息')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('我的')
    )
  ];
  PageController _pageController = PageController(
    initialPage: 0
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8f8f8),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _positionPage,
          _companyPage,
          _messagePage,
          _personalPage
        ],
      ),
      bottomNavigationBar: Builder(builder: (ctx){
        return BottomNavigationBar(
          items: bottomNavigationBars,
          type: BottomNavigationBarType.fixed,
          currentIndex: ctx.select<HomePageProvider, int>((value) => value.currentIndex),
          onTap: (index){
            ctx.read<HomePageProvider>().setIndex(index);
            _pageController.jumpToPage(index);
          },
        );
      }),
    );
  }
}

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  WorkPage _positionPage = WorkPage();
  CompanyPage _companyPage = CompanyPage();
  MessagePage _messagePage = MessagePage();
  PersonalPage _personalPage = PersonalPage();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(
        initialPage: context.select<HomePageProvider, int>((value) => value.currentIndex)
      ),
      children: [
        _positionPage,
        _companyPage,
        _messagePage,
        _personalPage
      ],
    );
  }
}