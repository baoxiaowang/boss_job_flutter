import 'package:boos_job/page/home/message/widgets/message_item.dart';
import 'package:boos_job/page/home/message/widgets/search_input.dart';
import 'package:boos_job/page/home/message/widgets/search_tab_bar.dart';
import 'package:boos_job/wiggets/flex_sticky_delegate.dart';
import 'package:boos_job/wiggets/slive_header_bar.dart';
import 'package:flutter/material.dart';
class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // SliverPersistentHeader(
          //   pinned: true,
          //   // floating: true,
          //   delegate: SliveHaderBarDelegate(
          //     collapsedHeight: 50,
          //     expandedHeight: 60,
          //     title: '聊天',
          //     actions: [
          //       IconButton(
          //         icon: Icon(Icons.notifications_none),
          //         onPressed: (){},
          //         color: Colors.white,
          //       )
          //     ],
          //     paddingTop: MediaQuery.of(context).padding.top,
          //   )
          // ),
          SliverAppBar(
            pinned: true,
            centerTitle: false,
            title: Text('聊天', style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: (){},
                color: Colors.white,
              )
            ],
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexStickyDelegate(
              flexWidget: SearchInput(),
              collapsedHeight: 0,
              expandedHeight: 55,
              stick: PreferredSize(
                child: SearchTabBar(),
                preferredSize: Size.fromHeight(40)
              )
            )
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => MessageItem(),
              childCount: 30,
            )
          ),
        ],
      ),
    );
  }
}
