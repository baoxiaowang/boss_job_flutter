import 'package:flutter/material.dart';
class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 55,
            brightness: Brightness.dark,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('我的',style: TextStyle(
                color: Colors.white
              ),),
              centerTitle: false,
              titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 10),
            ),
          )
        ],
      ),
    );
  }
}